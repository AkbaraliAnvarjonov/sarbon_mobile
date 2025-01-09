import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/news/get_news_response_entity.dart';
import '../../../domain/usecases/get_all_news_usecase.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required this.getAllNewsUseCase,
  }) : super(const NewsState()) {
    on<GetNewsListFromArgument>(_getNewsListFromArgument);
    on<GetNewsWithPaginationEvent>(_getNewsWithPagination);
  }

  final GetAllNewsUseCase getAllNewsUseCase;

  void _getNewsListFromArgument(
    GetNewsListFromArgument event,
    Emitter<NewsState> emit,
  ) =>
      emit(
        state.copyWith(
          news: event.news,
          newsCount: event.count > state.limit ? event.count - state.limit : 0,
        ),
      );

  Future<void> _getNewsWithPagination(
    GetNewsWithPaginationEvent event,
    Emitter<NewsState> emit,
  ) async {
    if (state.newsCount == 0) {
      return;
    }
    emit(state.copyWith(status: NewsStateStatus.loading));
    final response = await getAllNewsUseCase(
      GetAllNewsParams(
        limit: state.limit,
        offset: state.offset,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: NewsStateStatus.error)),
      (r) {
        final List<NewsItemEntity> news = [
          ...?state.news,
          ...r.news,
        ];
        final int offset = state.offset + 1;
        final int count =
            state.newsCount > state.limit ? state.newsCount - state.limit : 0;

        emit(
          state.copyWith(
            status: NewsStateStatus.success,
            offset: offset,
            newsCount: count,
            news: news,
          ),
        );
      },
    );
  }
}
