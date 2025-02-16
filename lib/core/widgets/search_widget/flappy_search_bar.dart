import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../extension/extension.dart';
import '../../utils/utils.dart';

mixin ControllerListener<T> on State<FlappySearchBar<T>> {
  void onListChanged(List<T> items) {}

  void onLoading() {}

  void onClear() {}

  void onError(Error error) {}
}

class SearchBarController<T> {
  final List<T> _list = [];
  final List<T> _filteredList = [];
  final List<T> _sortedList = [];
  late TextEditingController _searchQueryController;
  String? _lastSearchedText;
  Future<List<T>> Function(String? text)? _lastSearchFunction;
  late ControllerListener<dynamic> controllerListener;
  int Function(T a, T b)? _lastSorting;
  CancelableOperation? _cancelableOperation;
  late int minimumChars;

  void setTextController(TextEditingController searchQueryController, int minimunChars) {
    _searchQueryController = searchQueryController;
    minimumChars = minimunChars;
  }

  void clear() {
    controllerListener.onClear();
  }

  Future<void> _search(String? text, Future<List<T>> Function(String? text) onSearch) async {
    controllerListener.onLoading();
    try {
      if (_cancelableOperation != null && (!_cancelableOperation!.isCompleted || !_cancelableOperation!.isCanceled)) {
        await _cancelableOperation!.cancel();
      }
      _cancelableOperation = CancelableOperation.fromFuture(
        onSearch(text),
        onCancel: () => {},
      );

      final List<T> items = await _cancelableOperation?.value as List<T>;
      _lastSearchFunction = onSearch;
      _lastSearchedText = text;
      _list.clear();
      _filteredList.clear();
      _sortedList.clear();
      _lastSorting = null;
      _list.addAll(items);
      controllerListener.onListChanged(_list);
    } on Exception catch (error) {
      controllerListener.onError(error as Error);
    }
  }

  void injectSearch(String? searchText, Future<List<T>> Function(String? text) onSearch) {
    if (searchText != null && searchText.length >= minimumChars) {
      _searchQueryController.text = searchText;
      _search(searchText, onSearch);
    }
  }

  void replayLastSearch() {
    if (_lastSearchFunction != null && _lastSearchedText != null) {
      _search(_lastSearchedText, _lastSearchFunction!);
    }
  }

  void removeFilter() {
    _filteredList.clear();
    if (_lastSorting == null) {
      controllerListener.onListChanged(_list);
    } else {
      _sortedList
        ..clear()
        ..addAll(List<T>.from(_list))
        ..sort(_lastSorting);
      controllerListener.onListChanged(_sortedList);
    }
  }

  void removeSort() {
    _sortedList.clear();
    _lastSorting = null;
    controllerListener.onListChanged(_filteredList.isEmpty ? _list : _filteredList);
  }

  void sortList(int Function(T a, T b) sorting) {
    _lastSorting = sorting;
    _sortedList
      ..clear()
      ..addAll(List<T>.from(_filteredList.isEmpty ? _list : _filteredList))
      ..sort(sorting);
    controllerListener.onListChanged(_sortedList);
  }

  void filterList(bool Function(T item) filter) {
    _filteredList
      ..clear()
      ..addAll(_sortedList.isEmpty ? _list.where(filter).toList() : _sortedList.where(filter).toList());
    controllerListener.onListChanged(_filteredList);
  }
}

typedef IndexedScaledTileBuilder = Widget Function(int index);

class FlappySearchBar<T> extends StatefulWidget {
  const FlappySearchBar({
    super.key,
    required this.onSearch,
    required this.onItemFound,
    this.searchBarController,
    this.minimumChars = 1,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.loader = const Center(child: CircularProgressIndicator.adaptive()),
    this.onError,
    this.emptyWidget = const SizedBox.shrink(),
    this.header,
    this.placeHolder,
    this.icon,
    this.hintText = '',
    this.hintStyle = const TextStyle(color: Color.fromRGBO(142, 142, 147, 1)),
    this.iconActiveColor = Colors.black,
    this.textStyle,
    this.cancellationWidget = const Text('Cancel'),
    this.onCancelled,
    this.suggestions = const [],
    this.buildSuggestion,
    this.crossAxisCount = 1,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.listPadding = EdgeInsets.zero,
    this.searchBarPadding = EdgeInsets.zero,
    this.headerPadding = EdgeInsets.zero,
    this.focusNode,
    this.filled,
    this.haveBorder = true,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.prefixText,
    this.prefixStyle,
    this.onChanged,
    required this.controller,
  });

  /// Future returning searched items
  final Future<List<T>> Function(String? text) onSearch;

  /// List of items showed by default
  final List<T> suggestions;

  /// Callback returning the widget corresponding to a Suggestion item
  final Widget Function(T? item, int index)? buildSuggestion;

  /// Minimum number of chars required for a search
  final int minimumChars;

  /// Callback returning the widget corresponding to an item found
  final Widget Function(T? item, int index) onItemFound;

  /// Callback returning the widget corresponding to an Error while searching
  final Widget Function(Error error)? onError;

  /// Cooldown between each call to avoid too many
  final Duration debounceDuration;

  /// Widget to show when loading
  final Widget loader;

  /// Widget to show when no item were found
  final Widget emptyWidget;

  /// Widget to show by default
  final Widget? placeHolder;

  /// Widget showed on left of the search bar
  final Widget? icon;

  /// Widget placed between the search bar and the results
  final Widget? header;

  /// Hint text of the search bar
  final String hintText;

  /// TextStyle of the hint text
  final TextStyle hintStyle;

  /// Color of the icon when search bar is active
  final Color iconActiveColor;

  /// Text style of the text in the search bar
  final TextStyle? textStyle;

  final bool? filled;
  final bool haveBorder;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final EdgeInsets? contentPadding;

  /// Widget shown for cancellation
  final Widget cancellationWidget;

  /// Callback when cancel button is triggered
  final void Function()? onCancelled;
  final ValueChanged<String?>? onChanged;

  /// Focus node
  final FocusNode? focusNode;

  /// Controller used to be able to sort, filter or replay the search
  final SearchBarController? searchBarController;

  /// Number of items displayed on cross axis
  final int crossAxisCount;

  /// Weather the list should take the minimum place or not
  final bool shrinkWrap;

  /// Set the scrollDirection
  final Axis scrollDirection;

  /// Spacing between tiles on main axis
  final double mainAxisSpacing;

  /// Spacing between tiles on cross axis
  final double crossAxisSpacing;

  /// Set a padding on the search bar
  final EdgeInsetsGeometry searchBarPadding;

  /// Set a padding on the header
  final EdgeInsetsGeometry headerPadding;

  /// Set a padding on the list
  final EdgeInsetsGeometry listPadding;

  final TextEditingController controller;

  @override
  FlappySearchBarState createState() => FlappySearchBarState<T>();
}

class FlappySearchBarState<T> extends State<FlappySearchBar<T>> with TickerProviderStateMixin, ControllerListener<T> {
  bool _loading = false;
  bool _isTitle = true;
  Widget? _error;
  late TextEditingController _searchQueryController;
  Timer? _debounce;
  bool animate = false;
  List<T?> _list = [];
  late SearchBarController searchBarController;

  @override
  void initState() {
    super.initState();
    searchBarController = widget.searchBarController ?? SearchBarController<T>();
    searchBarController
      ..controllerListener = this
      ..setTextController(
        _searchQueryController = widget.controller,
        widget.minimumChars,
      );
  }

  @override
  void onListChanged(List<T?> items) {
    setState(() {
      _loading = false;
      _list = items;
    });
  }

  @override
  void onLoading() {
    setState(() {
      _loading = true;
      _error = null;
      animate = true;
    });
  }

  @override
  void onClear() {
    _cancel();
  }

  @override
  void onError(Error error) {
    setState(() {
      _loading = false;
      _error = widget.onError != null ? widget.onError!(error) : const Text('error');
    });
  }

  Future<void> _onTextChanged(String newText) async {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(widget.debounceDuration, () async {
      if (newText.length >= widget.minimumChars) {
        await searchBarController._search(newText, widget.onSearch);
      } else {
        setState(() {
          _list.clear();
          _error = null;
          _loading = false;
          animate = false;
        });
      }
    });
  }

  void _cancel() {
    if (widget.onCancelled != null) {
      widget.onCancelled!.call();
    }

    setState(() {
      _searchQueryController.clear();
      _list.clear();
      _isTitle = !_isTitle;
      _error = null;
      _loading = false;
      animate = false;
    });
  }

  Widget _buildListView(
    List<T?> items,
    Widget Function(T? item, int index) builder,
  ) =>
      ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: widget.listPadding,
        itemCount: items.length,
        shrinkWrap: widget.shrinkWrap,
        scrollDirection: widget.scrollDirection,
        itemBuilder: (_, index) => builder(items[index], index),
        separatorBuilder: (_, __) => AppUtils.kDivider,
      );

  Widget? _buildContent() {
    if (_error != null) {
      return _error;
    } else if (_loading) {
      return widget.loader;
    } else if (_searchQueryController.text.isEmpty) {
      if (widget.placeHolder != null) return widget.placeHolder;
      return _buildListView(
        widget.suggestions,
        widget.buildSuggestion ?? widget.onItemFound,
      );
    } else if (_list.isNotEmpty) {
      return _buildListView(_list, widget.onItemFound);
    } else {
      return widget.emptyWidget;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: context.colorScheme.surface,
            child: Padding(
              padding: widget.searchBarPadding,
              child: TextField(
                controller: _searchQueryController,
                onChanged: (value) {
                  widget.onChanged?.call(value);
                  _onTextChanged(value);
                },
                style: widget.textStyle ??
                    const TextStyle(
                      fontSize: 14,
                      height: 16 / 14,
                      fontWeight: FontWeight.w400,
                    ),
                focusNode: widget.focusNode,
                cursorColor: context.colorScheme.primary,
                decoration: InputDecoration(
                  fillColor: widget.fillColor ?? context.colorScheme.background,
                  filled: widget.filled,
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  errorStyle: TextStyle(
                    fontSize: 14,
                    height: 14 / 12,
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.error,
                  ),
                  hintText: widget.hintText,
                  contentPadding: widget.contentPadding ?? AppUtils.kPaddingAll12,
                  errorBorder: OutlineInputBorder(
                    borderSide: widget.haveBorder ? const BorderSide(color: Colors.red) : BorderSide.none,
                    borderRadius: AppUtils.kBorderRadius8,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: widget.haveBorder ? const BorderSide(color: Colors.red) : BorderSide.none,
                    borderRadius: AppUtils.kBorderRadius8,
                  ),
                  prefixText: widget.prefixText,
                  prefixStyle: widget.prefixStyle,
                  hintStyle: widget.hintStyle,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
          Padding(
            padding: widget.headerPadding,
            child: widget.header ?? const SizedBox(),
          ),
          Expanded(
            child: _buildContent() ?? const SizedBox(),
          ),
        ],
      );
}
