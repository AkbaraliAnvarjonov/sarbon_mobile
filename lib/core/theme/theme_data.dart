part of 'themes.dart';

const systemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Colors.white,
  // ios
  statusBarBrightness: Brightness.light,
  // android
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
);

final appTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  ),
  splashFactory: Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
    ),
  ),
  dividerTheme: const DividerThemeData(thickness: 1),
);

final ThemeData lightTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    ThemeTextStyles.light,
    ThemeColors.light,
  ],
  primaryColor: colorLightScheme.primary,
  colorScheme: colorLightScheme,
  dialogBackgroundColor: colorLightScheme.surface,
  scaffoldBackgroundColor: colorLightScheme.background,
  cardColor: Colors.white,
  canvasColor: Colors.white,
  shadowColor: const Color(0xFFE6E9EF),
  disabledColor: const Color(0xFFE6E9EF),
  dividerTheme: const DividerThemeData(
    thickness: 1,
    color: Color(0xFFE6E9EF),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    interactive: true,
    thumbColor: WidgetStatePropertyAll(
      ThemeColors.light.main,
    ),
    thickness: const WidgetStatePropertyAll(5),
    minThumbLength: 100,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    elevation: 1,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: Color(0xFFE6E9EF),
  ),
  checkboxTheme: CheckboxThemeData(
    side: WidgetStateBorderSide.resolveWith(
      (states) => const BorderSide(color: Color(0xFF6D7885)),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF32B141),
    foregroundColor: Colors.white,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    shape: CircleBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF003399).withOpacity(0.12);
          }
          return const Color(0xFF597FCB);
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF003399);
          }
          return Colors.white;
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF003399).withOpacity(0.12);
          }
          return const Color(0xFF003399);
        },
      ),
      textStyle: WidgetStatePropertyAll(ThemeTextStyles.light.buttonStyle),
      elevation: const WidgetStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => Colors.black,
      ),
      textStyle: WidgetStatePropertyAll(ThemeTextStyles.light.buttonStyle),
      elevation: const WidgetStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    fillColor: Color(0xFFF2F4F7),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    showDragHandle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 4,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      color: colorLightScheme.primary,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      color: Color(0xFF98A2B3),
      fontWeight: FontWeight.w400,
    ),
    unselectedItemColor: const Color(0xFF98A2B3),
    selectedItemColor: colorLightScheme.primary,
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: colorLightScheme.primary,
    labelColor: const Color(0xFF0C111D),
    unselectedLabelColor: const Color(0xFF0C111D),
    dividerColor: Colors.transparent,
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    labelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: const BoxDecoration(
      borderRadius: AppUtils.kBorderRadius12,
      color: Colors.white,
      border: Border(
        top: BorderSide(color: Colors.transparent, width: 0),
        bottom: BorderSide(color: Colors.transparent, width: 0),
        left: BorderSide(color: Colors.transparent, width: 0),
        right: BorderSide(color: Colors.transparent, width: 0),
      ),
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    height: kToolbarHeight,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (states) => const IconThemeData(
        color: Colors.black,
      ),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (states) => ThemeTextStyles.light.appBarTitle,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 1,
    systemOverlayStyle: systemUiOverlayStyle,
    iconTheme: const IconThemeData(color: Colors.white),
    shadowColor: Colors.black45,
    titleTextStyle: const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    toolbarTextStyle: ThemeTextStyles.light.appBarTitle,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: Platform.isAndroid ? const Icon(Icons.arrow_back) : const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Colors.white,
    horizontalTitleGap: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 34,
    ),

    /// text field title style
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),

    /// list tile title style
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),

    /// list tile subtitle style
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    ),
    displayLarge: TextStyle(
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
    ),
  ),
);

final ThemeData darkTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    ThemeTextStyles.dark,
    ThemeColors.dark,
  ],
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    indicator: BoxDecoration(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      border: Border.all(color: Colors.blue, width: 2),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    elevation: 2,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: ThemeColors.primary,

      /// android
      statusBarIconBrightness: Brightness.light,

      /// ios
      statusBarBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: ThemeTextStyles.dark.appBarTitle,
    // backgroundColor: ThemeColors.cardBackgroundDark,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
  ),
);
