part of 'utils.dart';

sealed class AppUtils {
  AppUtils._();

  /// box
  static const kGap = Gap(0);
  static const kGap2 = Gap(2);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap10 = Gap(10);
  static const kGap12 = Gap(12);
  static const kGap16 = Gap(16);
  static const kGap18 = Gap(18);
  static const kGap20 = Gap(20);
  static const kGap24 = Gap(24);
  static const kGap30 = Gap(30);
  static const kGap32 = Gap(32);
  static const kGap36 = Gap(36);
  static const kGap40 = Gap(40);
  static const kGap44 = Gap(44);
  static const kGap48 = Gap(48);
  static const kSliverGap8 = SliverGap(8);
  static const kSliverGap12 = SliverGap(12);
  static const kSliverGap16 = SliverGap(16);
  static const kSliverGap18 = SliverGap(18);
  static const kSliverGap24 = SliverGap(24);

  /// divider
  static const kDivider = Divider(height: 1, thickness: 1);
  static const SliverToBoxAdapter kSliverDivider = SliverToBoxAdapter(
    child: kDivider,
  );
  static const kPad16Divider = Padding(
    padding: EdgeInsets.only(left: 16),
    child: Divider(height: 1, thickness: 1),
  );
  static const kPad28Divider = Padding(
    padding: EdgeInsets.only(left: 28),
    child: Divider(height: 1, thickness: 1),
  );
  static const kPad12Divider = Padding(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: Divider(height: 1, thickness: 1),
  );
  static const kPad52Divider = ColoredBox(
    color: Colors.white,
    child: Divider(
      height: 1,
      thickness: 1,
      indent: 52,
    ),
  );
  static const kPadHor16Divider = Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Divider(height: 1, thickness: 1),
  );

  /// spacer
  static const kSpacer = Spacer();

  /// padding
  static const kPaddingZero = EdgeInsets.zero;
  static const kPaddingAll2 = EdgeInsets.all(2);
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingAll14 = EdgeInsets.all(14);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const kPaddingTop16 = EdgeInsets.fromLTRB(0, 16, 0, 0);
  static const kPaddingAll20 = EdgeInsets.all(20);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingAll32 = EdgeInsets.all(32);
  static const kPaddingHorizontal4 = EdgeInsets.symmetric(horizontal: 4);
  static const kPaddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHorizontal14 = EdgeInsets.symmetric(horizontal: 14);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHorizontal20 = EdgeInsets.symmetric(horizontal: 20);
  static const kPaddingHorizontal24 = EdgeInsets.symmetric(horizontal: 24);
  static const kPaddingHorizontal32 = EdgeInsets.symmetric(horizontal: 32);
  static const kPaddingVertical4 = EdgeInsets.symmetric(vertical: 4);
  static const kPaddingVertical8 = EdgeInsets.symmetric(vertical: 8);
  static const kPaddingVertical12 = EdgeInsets.symmetric(vertical: 12);
  static const kPaddingVertical16 = EdgeInsets.symmetric(vertical: 16);
  static const kPaddingVertical24 = EdgeInsets.symmetric(vertical: 24);
  static const kPaddingVertical32 = EdgeInsets.symmetric(vertical: 32);
  static const kPaddingHor32Ver20 = EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingHor16Ver12 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const kPaddingHor12Ver4 = EdgeInsets.symmetric(horizontal: 12, vertical: 4);
  static const kPaddingHor16Ver4 = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const kPaddingHor16Ver8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const kPaddingHor12Ver8 = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const kPaddingHor12Ver7 = EdgeInsets.symmetric(horizontal: 12, vertical: 7);
  static const kPaddingHor12Ver14 = EdgeInsets.symmetric(horizontal: 12, vertical: 14);
  static const kPaddingHor12Ver16 = EdgeInsets.symmetric(horizontal: 12, vertical: 16);
  static const kPaddingHor12Ver32 = EdgeInsets.symmetric(horizontal: 12, vertical: 32);
  static const kPaddingHor24Ver20 = EdgeInsets.symmetric(horizontal: 24, vertical: 20);
  static const kPaddingHor8Ver4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const kPaddingHor8Ver10 = EdgeInsets.symmetric(horizontal: 8, vertical: 10);
  static const kPaddingHor8Ver12 = EdgeInsets.symmetric(horizontal: 8, vertical: 12);
  static const kPaddingLeft12Right6Ver8 = EdgeInsets.only(left: 12, right: 6, top: 8, bottom: 8);
  static const kPaddingL16R16B30 = EdgeInsets.only(left: 16, right: 16, bottom: 30);
  static const kPaddingLRB16T0 = EdgeInsets.only(left: 16, right: 16, bottom: 16);
  static const kPaddingLTR16B12 = EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 12);
  static const kPaddingLR16T0B12 = EdgeInsets.only(left: 16, right: 16, bottom: 12);
  static const kPaddingR8B8 = EdgeInsets.only(right: 8, bottom: 8);
  static const kPaddingL8 = EdgeInsets.only(left: 8);
  static const kPaddingL4 = EdgeInsets.only(left: 4);

  /// only one side padding
  static const kPaddingBottom4 = EdgeInsets.only(bottom: 4);
  static const kPaddingBottom8 = EdgeInsets.only(bottom: 8);
  static const kPaddingBottom16 = EdgeInsets.only(bottom: 16);
  static const kPaddingBottom24 = EdgeInsets.only(bottom: 24);
  static const kPaddingBottom32 = EdgeInsets.only(bottom: 32);

  static const kPaddingLeft16 = EdgeInsets.only(left: 16);

  /// border radius
  static const kRadius = Radius.zero;
  static const kRadius8 = Radius.circular(8);
  static const kRadius12 = Radius.circular(12);
  static const kBorderRadiusZero = BorderRadius.zero;
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius6 = BorderRadius.all(Radius.circular(6));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius20 = BorderRadius.all(Radius.circular(20));
  static const kBorderTopRadius24 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const kBorderRadius24 = BorderRadius.all(Radius.circular(24));
  static const kBorderRadius48 = BorderRadius.all(Radius.circular(48));
  static const kBorderRadius64 = BorderRadius.all(Radius.circular(64));
  static const kBorderRadiusTop12 = BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  );
  static const kBorderRadiusBottom12 = BorderRadius.only(
    bottomLeft: Radius.circular(12),
    bottomRight: Radius.circular(12),
  );
  static const kBorderRadiusTop6 = BorderRadius.only(
    topLeft: Radius.circular(6),
    topRight: Radius.circular(6),
  );
  static const kBorderRadiusLeft6 = BorderRadius.only(
    topLeft: Radius.circular(6),
    bottomLeft: Radius.circular(6),
  );
  static const kBorderRadiusRight6 = BorderRadius.only(
    topRight: Radius.circular(6),
    bottomRight: Radius.circular(6),
  );

  static const kDecorationWithShadow = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        offset: Offset(2, 0),
        blurRadius: 14,
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
    ],
  );

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: context.colorScheme.onPrimary,
      showCloseIcon: true,
      closeIconColor: context.color.midGray,
      content: Text(
        text,
        style: context.textStyle.bodyBody,
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
