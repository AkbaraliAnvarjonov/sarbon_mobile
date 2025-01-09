import 'package:flutter/material.dart';

class LogoTextPainter extends CustomPainter {
  const LogoTextPainter({
    this.textColor = Colors.white,
  });

  final Color textColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.1711293, size.height * 0.2424757)
      ..cubicTo(
        size.width * 0.1674567,
        size.height * 0.2082525,
        size.width * 0.1629885,
        size.height * 0.1759632,
        size.width * 0.1577242,
        size.height * 0.1464464,
      )
      ..cubicTo(
        size.width * 0.1229006,
        size.height * -0.04881536,
        size.width * 0.06644013,
        size.height * -0.04881536,
        size.width * 0.03161643,
        size.height * 0.1464464,
      )
      ..cubicTo(
        size.width * -0.003207325,
        size.height * 0.3417079,
        size.width * -0.003207325,
        size.height * 0.6582893,
        size.width * 0.03161643,
        size.height * 0.8535500,
      )
      ..cubicTo(
        size.width * 0.06644013,
        size.height * 1.048814,
        size.width * 0.1229006,
        size.height * 1.048814,
        size.width * 0.1577242,
        size.height * 0.8535500,
      )
      ..cubicTo(
        size.width * 0.1629879,
        size.height * 0.8240393,
        size.width * 0.1674561,
        size.height * 0.7917536,
        size.width * 0.1711280,
        size.height * 0.7575357,
      )
      ..cubicTo(
        size.width * 0.1708459,
        size.height * 0.7575643,
        size.width * 0.1705631,
        size.height * 0.7575786,
        size.width * 0.1702796,
        size.height * 0.7575786,
      )
      ..lineTo(size.width * 0.1378535, size.height * 0.7575786)
      ..cubicTo(
        size.width * 0.1124834,
        size.height * 0.7575786,
        size.width * 0.09191720,
        size.height * 0.6422571,
        size.width * 0.09191720,
        size.height * 0.5000036,
      )
      ..cubicTo(
        size.width * 0.09191720,
        size.height * 0.3577500,
        size.width * 0.1124834,
        size.height * 0.2424325,
        size.width * 0.1378535,
        size.height * 0.2424325,
      )
      ..lineTo(size.width * 0.1702796, size.height * 0.2424325)
      ..cubicTo(
        size.width * 0.1705637,
        size.height * 0.2424325,
        size.width * 0.1708471,
        size.height * 0.2424471,
        size.width * 0.1711293,
        size.height * 0.2424757,
      )
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffFFC007);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path()
      ..moveTo(size.width * 0.1378535, size.height * 0.3333436)
      ..cubicTo(
        size.width * 0.1214376,
        size.height * 0.3333436,
        size.width * 0.1081299,
        size.height * 0.4079607,
        size.width * 0.1081299,
        size.height * 0.5000071,
      )
      ..cubicTo(
        size.width * 0.1081299,
        size.height * 0.5920536,
        size.width * 0.1214376,
        size.height * 0.6666714,
        size.width * 0.1378535,
        size.height * 0.6666714,
      )
      ..lineTo(size.width * 0.1702796, size.height * 0.6666714)
      ..cubicTo(
        size.width * 0.1866955,
        size.height * 0.6666714,
        size.width * 0.2000032,
        size.height * 0.5920536,
        size.width * 0.2000032,
        size.height * 0.5000071,
      )
      ..cubicTo(
        size.width * 0.2000032,
        size.height * 0.4079607,
        size.width * 0.1866955,
        size.height * 0.3333436,
        size.width * 0.1702796,
        size.height * 0.3333436,
      )
      ..lineTo(size.width * 0.1378535, size.height * 0.3333436)
      ..close()
      ..moveTo(size.width * 0.1703465, size.height * 0.4107750)
      ..cubicTo(
        size.width * 0.1615656,
        size.height * 0.4107750,
        size.width * 0.1544465,
        size.height * 0.4507679,
        size.width * 0.1544465,
        size.height * 0.5000071,
      )
      ..cubicTo(
        size.width * 0.1544465,
        size.height * 0.5492464,
        size.width * 0.1615656,
        size.height * 0.5892393,
        size.width * 0.1703465,
        size.height * 0.5892393,
      )
      ..cubicTo(
        size.width * 0.1791280,
        size.height * 0.5892393,
        size.width * 0.1862471,
        size.height * 0.5492464,
        size.width * 0.1862471,
        size.height * 0.5000071,
      )
      ..cubicTo(
        size.width * 0.1862471,
        size.height * 0.4507679,
        size.width * 0.1791280,
        size.height * 0.4107750,
        size.width * 0.1703465,
        size.height * 0.4107750,
      )
      ..close();

    final Paint paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff32B141);
    canvas.drawPath(path_1, paint1Fill);

    final Path path_2 = Path()
      ..moveTo(size.width * 0.2576828, size.height * 0.8080786)
      ..lineTo(size.width * 0.2576828, size.height * 0.1363636)
      ..lineTo(size.width * 0.2802732, size.height * 0.1363636)
      ..lineTo(size.width * 0.2802732, size.height * 0.6929250)
      ..lineTo(size.width * 0.3350369, size.height * 0.6929250)
      ..lineTo(size.width * 0.3350369, size.height * 0.8080786)
      ..lineTo(size.width * 0.2576828, size.height * 0.8080786)
      ..close();

    final Paint paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_2, paint2Fill);

    final Path path_3 = Path()
      ..moveTo(size.width * 0.3861490, size.height * 0.8080786)
      ..lineTo(size.width * 0.3861490, size.height * 0.3321204)
      ..lineTo(size.width * 0.4073701, size.height * 0.3321204)
      ..lineTo(size.width * 0.4073701, size.height * 0.3839393)
      ..lineTo(size.width * 0.4104503, size.height * 0.3839393)
      ..cubicTo(
        size.width * 0.4119338,
        size.height * 0.3679464,
        size.width * 0.4143866,
        size.height * 0.3541907,
        size.width * 0.4178096,
        size.height * 0.3426757,
      )
      ..cubicTo(
        size.width * 0.4212318,
        size.height * 0.3305207,
        size.width * 0.4257389,
        size.height * 0.3244436,
        size.width * 0.4313293,
        size.height * 0.3244436,
      )
      ..cubicTo(
        size.width * 0.4373758,
        size.height * 0.3244436,
        size.width * 0.4422248,
        size.height * 0.3311607,
        size.width * 0.4458758,
        size.height * 0.3445950,
      )
      ..cubicTo(
        size.width * 0.4495268,
        size.height * 0.3573893,
        size.width * 0.4523223,
        size.height * 0.3743429,
        size.width * 0.4542618,
        size.height * 0.3954536,
      )
      ..lineTo(size.width * 0.4573420, size.height * 0.3954536)
      ..cubicTo(
        size.width * 0.4592815,
        size.height * 0.3749821,
        size.width * 0.4620197,
        size.height * 0.3580286,
        size.width * 0.4655567,
        size.height * 0.3445950,
      )
      ..cubicTo(
        size.width * 0.4690936,
        size.height * 0.3311607,
        size.width * 0.4741134,
        size.height * 0.3244436,
        size.width * 0.4806166,
        size.height * 0.3244436,
      )
      ..cubicTo(
        size.width * 0.4858650,
        size.height * 0.3244436,
        size.width * 0.4906000,
        size.height * 0.3308407,
        size.width * 0.4948210,
        size.height * 0.3436354,
      )
      ..cubicTo(
        size.width * 0.4991567,
        size.height * 0.3557900,
        size.width * 0.5025796,
        size.height * 0.3746607,
        size.width * 0.5050892,
        size.height * 0.4002500,
      )
      ..cubicTo(
        size.width * 0.5077134,
        size.height * 0.4252000,
        size.width * 0.5090255,
        size.height * 0.4568679,
        size.width * 0.5090255,
        size.height * 0.4952500,
      )
      ..lineTo(size.width * 0.5090255, size.height * 0.8080786)
      ..lineTo(size.width * 0.4874624, size.height * 0.8080786)
      ..lineTo(size.width * 0.4874624, size.height * 0.5038857)
      ..cubicTo(
        size.width * 0.4874624,
        size.height * 0.4776571,
        size.width * 0.4862643,
        size.height * 0.4581464,
        size.width * 0.4838682,
        size.height * 0.4453536,
      )
      ..cubicTo(
        size.width * 0.4814726,
        size.height * 0.4319179,
        size.width * 0.4781070,
        size.height * 0.4252000,
        size.width * 0.4737713,
        size.height * 0.4252000,
      )
      ..cubicTo(
        size.width * 0.4688656,
        size.height * 0.4252000,
        size.width * 0.4650433,
        size.height * 0.4341571,
        size.width * 0.4623051,
        size.height * 0.4520679,
      )
      ..cubicTo(
        size.width * 0.4596809,
        size.height * 0.4693429,
        size.width * 0.4583688,
        size.height * 0.4942929,
        size.width * 0.4583688,
        size.height * 0.5269179,
      )
      ..lineTo(size.width * 0.4583688, size.height * 0.8080786)
      ..lineTo(size.width * 0.4368057, size.height * 0.8080786)
      ..lineTo(size.width * 0.4368057, size.height * 0.5038857)
      ..cubicTo(
        size.width * 0.4368057,
        size.height * 0.4776571,
        size.width * 0.4356076,
        size.height * 0.4581464,
        size.width * 0.4332115,
        size.height * 0.4453536,
      )
      ..cubicTo(
        size.width * 0.4308159,
        size.height * 0.4319179,
        size.width * 0.4274503,
        size.height * 0.4252000,
        size.width * 0.4231146,
        size.height * 0.4252000,
      )
      ..cubicTo(
        size.width * 0.4182089,
        size.height * 0.4252000,
        size.width * 0.4143866,
        size.height * 0.4341571,
        size.width * 0.4116484,
        size.height * 0.4520679,
      )
      ..cubicTo(
        size.width * 0.4090242,
        size.height * 0.4693429,
        size.width * 0.4077121,
        size.height * 0.4942929,
        size.width * 0.4077121,
        size.height * 0.5269179,
      )
      ..lineTo(size.width * 0.4077121, size.height * 0.8080786)
      ..lineTo(size.width * 0.3861490, size.height * 0.8080786)
      ..close();

    final Paint paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_3, paint3Fill);

    final Path path_4 = Path()
      ..moveTo(size.width * 0.5667006, size.height * 0.8215107)
      ..cubicTo(
        size.width * 0.5582580,
        size.height * 0.8215107,
        size.width * 0.5506707,
        size.height * 0.8119143,
        size.width * 0.5439395,
        size.height * 0.7927250,
      )
      ..cubicTo(
        size.width * 0.5372076,
        size.height * 0.7735321,
        size.width * 0.5319025,
        size.height * 0.7457036,
        size.width * 0.5280236,
        size.height * 0.7092393,
      )
      ..cubicTo(
        size.width * 0.5241446,
        size.height * 0.6727750,
        size.width * 0.5222045,
        size.height * 0.6289536,
        size.width * 0.5222045,
        size.height * 0.5777750,
      )
      ..lineTo(size.width * 0.5222045, size.height * 0.5624214)
      ..cubicTo(
        size.width * 0.5222045,
        size.height * 0.5112429,
        size.width * 0.5241446,
        size.height * 0.4674214,
        size.width * 0.5280236,
        size.height * 0.4309571,
      )
      ..cubicTo(
        size.width * 0.5319025,
        size.height * 0.3944929,
        size.width * 0.5372076,
        size.height * 0.3666643,
        size.width * 0.5439395,
        size.height * 0.3474736,
      )
      ..cubicTo(
        size.width * 0.5506707,
        size.height * 0.3282818,
        size.width * 0.5582580,
        size.height * 0.3186857,
        size.width * 0.5667006,
        size.height * 0.3186857,
      )
      ..cubicTo(
        size.width * 0.5751433,
        size.height * 0.3186857,
        size.width * 0.5827306,
        size.height * 0.3282818,
        size.width * 0.5894618,
        size.height * 0.3474736,
      )
      ..cubicTo(
        size.width * 0.5961930,
        size.height * 0.3666643,
        size.width * 0.6014981,
        size.height * 0.3944929,
        size.width * 0.6053777,
        size.height * 0.4309571,
      )
      ..cubicTo(
        size.width * 0.6092567,
        size.height * 0.4674214,
        size.width * 0.6111962,
        size.height * 0.5112429,
        size.width * 0.6111962,
        size.height * 0.5624214,
      )
      ..lineTo(size.width * 0.6111962, size.height * 0.5777750)
      ..cubicTo(
        size.width * 0.6111962,
        size.height * 0.6289536,
        size.width * 0.6092567,
        size.height * 0.6727750,
        size.width * 0.6053777,
        size.height * 0.7092393,
      )
      ..cubicTo(
        size.width * 0.6014981,
        size.height * 0.7457036,
        size.width * 0.5961930,
        size.height * 0.7735321,
        size.width * 0.5894618,
        size.height * 0.7927250,
      )
      ..cubicTo(
        size.width * 0.5827306,
        size.height * 0.8119143,
        size.width * 0.5751433,
        size.height * 0.8215107,
        size.width * 0.5667006,
        size.height * 0.8215107,
      )
      ..close()
      ..moveTo(size.width * 0.5667006, size.height * 0.7140393)
      ..cubicTo(
        size.width * 0.5733178,
        size.height * 0.7140393,
        size.width * 0.5787943,
        size.height * 0.7022036,
        size.width * 0.5831299,
        size.height * 0.6785321,
      )
      ..cubicTo(
        size.width * 0.5874650,
        size.height * 0.6542214,
        size.width * 0.5896331,
        size.height * 0.6196786,
        size.width * 0.5896331,
        size.height * 0.5748964,
      )
      ..lineTo(size.width * 0.5896331, size.height * 0.5653000)
      ..cubicTo(
        size.width * 0.5896331,
        size.height * 0.5205214,
        size.width * 0.5874650,
        size.height * 0.4862929,
        size.width * 0.5831299,
        size.height * 0.4626250,
      )
      ..cubicTo(
        size.width * 0.5789083,
        size.height * 0.4383143,
        size.width * 0.5734318,
        size.height * 0.4261607,
        size.width * 0.5667006,
        size.height * 0.4261607,
      )
      ..cubicTo(
        size.width * 0.5600834,
        size.height * 0.4261607,
        size.width * 0.5546070,
        size.height * 0.4383143,
        size.width * 0.5502713,
        size.height * 0.4626250,
      )
      ..cubicTo(
        size.width * 0.5459357,
        size.height * 0.4862929,
        size.width * 0.5437682,
        size.height * 0.5205214,
        size.width * 0.5437682,
        size.height * 0.5653000,
      )
      ..lineTo(size.width * 0.5437682, size.height * 0.5748964)
      ..cubicTo(
        size.width * 0.5437682,
        size.height * 0.6196786,
        size.width * 0.5459357,
        size.height * 0.6542214,
        size.width * 0.5502713,
        size.height * 0.6785321,
      )
      ..cubicTo(
        size.width * 0.5546070,
        size.height * 0.7022036,
        size.width * 0.5600834,
        size.height * 0.7140393,
        size.width * 0.5667006,
        size.height * 0.7140393,
      )
      ..close();

    final Paint paint4Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_4, paint4Fill);

    final Path path_5 = Path()
      ..moveTo(size.width * 0.6242637, size.height * 0.8080786)
      ..lineTo(size.width * 0.6242637, size.height * 0.3321204)
      ..lineTo(size.width * 0.6454841, size.height * 0.3321204)
      ..lineTo(size.width * 0.6454841, size.height * 0.3944929)
      ..lineTo(size.width * 0.6485669, size.height * 0.3944929)
      ..cubicTo(
        size.width * 0.6499363,
        size.height * 0.3778607,
        size.width * 0.6525032,
        size.height * 0.3621857,
        size.width * 0.6562675,
        size.height * 0.3474736,
      )
      ..cubicTo(
        size.width * 0.6600318,
        size.height * 0.3321204,
        size.width * 0.6657389,
        size.height * 0.3244436,
        size.width * 0.6733822,
        size.height * 0.3244436,
      )
      ..cubicTo(
        size.width * 0.6800000,
        size.height * 0.3244436,
        size.width * 0.6857580,
        size.height * 0.3330796,
        size.width * 0.6906624,
        size.height * 0.3503525,
      )
      ..cubicTo(
        size.width * 0.6956879,
        size.height * 0.3669857,
        size.width * 0.6995669,
        size.height * 0.3903357,
        size.width * 0.7023057,
        size.height * 0.4204036,
      )
      ..cubicTo(
        size.width * 0.7050382,
        size.height * 0.4498286,
        size.width * 0.7064076,
        size.height * 0.4843750,
        size.width * 0.7064076,
        size.height * 0.5240393,
      )
      ..lineTo(size.width * 0.7064076, size.height * 0.8080786)
      ..lineTo(size.width * 0.6848471, size.height * 0.8080786)
      ..lineTo(size.width * 0.6848471, size.height * 0.5336357)
      ..cubicTo(
        size.width * 0.6848471,
        size.height * 0.4978107,
        size.width * 0.6832484,
        size.height * 0.4709429,
        size.width * 0.6800573,
        size.height * 0.4530286,
      )
      ..cubicTo(
        size.width * 0.6769745,
        size.height * 0.4351179,
        size.width * 0.6725223,
        size.height * 0.4261607,
        size.width * 0.6667070,
        size.height * 0.4261607,
      )
      ..cubicTo(
        size.width * 0.6600892,
        size.height * 0.4261607,
        size.width * 0.6549554,
        size.height * 0.4386357,
        size.width * 0.6513057,
        size.height * 0.4635857,
      )
      ..cubicTo(
        size.width * 0.6476497,
        size.height * 0.4878929,
        size.width * 0.6458280,
        size.height * 0.5221179,
        size.width * 0.6458280,
        size.height * 0.5662607,
      )
      ..lineTo(size.width * 0.6458280, size.height * 0.8080786)
      ..lineTo(size.width * 0.6242637, size.height * 0.8080786)
      ..close();

    final Paint paint5Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_5, paint5Fill);

    final Path path_6 = Path()
      ..moveTo(size.width * 0.3482452, size.height * 0.8080786)
      ..lineTo(size.width * 0.3482452, size.height * 0.3571679)
      ..lineTo(size.width * 0.3686739, size.height * 0.3571679)
      ..lineTo(size.width * 0.3686739, size.height * 0.8080786)
      ..lineTo(size.width * 0.3482452, size.height * 0.8080786)
      ..close()
      ..moveTo(size.width * 0.3584592, size.height * 0.3044421)
      ..cubicTo(
        size.width * 0.3547847,
        size.height * 0.3044421,
        size.width * 0.3516503,
        size.height * 0.2977757,
        size.width * 0.3490561,
        size.height * 0.2844421,
      )
      ..cubicTo(
        size.width * 0.3465701,
        size.height * 0.2711089,
        size.width * 0.3453268,
        size.height * 0.2535332,
        size.width * 0.3453268,
        size.height * 0.2317150,
      )
      ..cubicTo(
        size.width * 0.3453268,
        size.height * 0.2098968,
        size.width * 0.3465701,
        size.height * 0.1923211,
        size.width * 0.3490561,
        size.height * 0.1789879,
      )
      ..cubicTo(
        size.width * 0.3516503,
        size.height * 0.1656546,
        size.width * 0.3547847,
        size.height * 0.1589879,
        size.width * 0.3584592,
        size.height * 0.1589879,
      )
      ..cubicTo(
        size.width * 0.3622427,
        size.height * 0.1589879,
        size.width * 0.3653771,
        size.height * 0.1656546,
        size.width * 0.3678631,
        size.height * 0.1789879,
      )
      ..cubicTo(
        size.width * 0.3703490,
        size.height * 0.1923211,
        size.width * 0.3715924,
        size.height * 0.2098968,
        size.width * 0.3715924,
        size.height * 0.2317150,
      )
      ..cubicTo(
        size.width * 0.3715924,
        size.height * 0.2535332,
        size.width * 0.3703490,
        size.height * 0.2711089,
        size.width * 0.3678631,
        size.height * 0.2844421,
      )
      ..cubicTo(
        size.width * 0.3653771,
        size.height * 0.2977757,
        size.width * 0.3622427,
        size.height * 0.3044421,
        size.width * 0.3584592,
        size.height * 0.3044421,
      )
      ..close();

    final Paint paint6Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_6, paint6Fill);

    final Path path_7 = Path()
      ..moveTo(size.width * 0.7226879, size.height * 0.8080786)
      ..lineTo(size.width * 0.7226879, size.height * 0.1363629)
      ..lineTo(size.width * 0.7719745, size.height * 0.1363629)
      ..cubicTo(
        size.width * 0.7795032,
        size.height * 0.1363629,
        size.width * 0.7861210,
        size.height * 0.1449993,
        size.width * 0.7918280,
        size.height * 0.1622718,
      )
      ..cubicTo(
        size.width * 0.7976433,
        size.height * 0.1789046,
        size.width * 0.8021529,
        size.height * 0.2025746,
        size.width * 0.8053503,
        size.height * 0.2332818,
      )
      ..cubicTo(
        size.width * 0.8086561,
        size.height * 0.2639886,
        size.width * 0.8103121,
        size.height * 0.3004532,
        size.width * 0.8103121,
        size.height * 0.3426750,
      )
      ..lineTo(size.width * 0.8103121, size.height * 0.3561093)
      ..cubicTo(
        size.width * 0.8103121,
        size.height * 0.3976929,
        size.width * 0.8085987,
        size.height * 0.4341571,
        size.width * 0.8051783,
        size.height * 0.4655036,
      )
      ..cubicTo(
        size.width * 0.8018662,
        size.height * 0.4962107,
        size.width * 0.7973057,
        size.height * 0.5202000,
        size.width * 0.7914841,
        size.height * 0.5374714,
      )
      ..cubicTo(
        size.width * 0.7857834,
        size.height * 0.5541036,
        size.width * 0.7792803,
        size.height * 0.5624214,
        size.width * 0.7719745,
        size.height * 0.5624214,
      )
      ..lineTo(size.width * 0.7452803, size.height * 0.5624214)
      ..lineTo(size.width * 0.7452803, size.height * 0.8080786)
      ..lineTo(size.width * 0.7226879, size.height * 0.8080786)
      ..close()
      ..moveTo(size.width * 0.7452803, size.height * 0.4472714)
      ..lineTo(size.width * 0.7697516, size.height * 0.4472714)
      ..cubicTo(
        size.width * 0.7751146,
        size.height * 0.4472714,
        size.width * 0.7794459,
        size.height * 0.4389536,
        size.width * 0.7827580,
        size.height * 0.4223214,
      )
      ..cubicTo(
        size.width * 0.7860637,
        size.height * 0.4056893,
        size.width * 0.7877197,
        size.height * 0.3829786,
        size.width * 0.7877197,
        size.height * 0.3541904,
      )
      ..lineTo(size.width * 0.7877197, size.height * 0.3445943)
      ..cubicTo(
        size.width * 0.7877197,
        size.height * 0.3158064,
        size.width * 0.7860637,
        size.height * 0.2930961,
        size.width * 0.7827580,
        size.height * 0.2764632,
      )
      ..cubicTo(
        size.width * 0.7794459,
        size.height * 0.2598304,
        size.width * 0.7751146,
        size.height * 0.2515139,
        size.width * 0.7697516,
        size.height * 0.2515139,
      )
      ..lineTo(size.width * 0.7452803, size.height * 0.2515139)
      ..lineTo(size.width * 0.7452803, size.height * 0.4472714)
      ..close();

    final Paint paint7Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_7, paint7Fill);

    final Path path_8 = Path()
      ..moveTo(size.width * 0.8465032, size.height * 0.8215143)
      ..cubicTo(
        size.width * 0.8404586,
        size.height * 0.8215143,
        size.width * 0.8350382,
        size.height * 0.8157571,
        size.width * 0.8302484,
        size.height * 0.8042429,
      )
      ..cubicTo(
        size.width * 0.8254522,
        size.height * 0.7920893,
        size.width * 0.8216306,
        size.height * 0.7748143,
        size.width * 0.8187771,
        size.height * 0.7524250,
      )
      ..cubicTo(
        size.width * 0.8160382,
        size.height * 0.7293929,
        size.width * 0.8146752,
        size.height * 0.7015679,
        size.width * 0.8146752,
        size.height * 0.6689393,
      )
      ..cubicTo(
        size.width * 0.8146752,
        size.height * 0.6363143,
        size.width * 0.8160382,
        size.height * 0.6091250,
        size.width * 0.8187771,
        size.height * 0.5873750,
      )
      ..cubicTo(
        size.width * 0.8216306,
        size.height * 0.5649857,
        size.width * 0.8255096,
        size.height * 0.5483500,
        size.width * 0.8304140,
        size.height * 0.5374750,
      )
      ..cubicTo(
        size.width * 0.8354395,
        size.height * 0.5259607,
        size.width * 0.8411401,
        size.height * 0.5202036,
        size.width * 0.8475287,
        size.height * 0.5202036,
      )
      ..lineTo(size.width * 0.8708025, size.height * 0.5202036)
      ..lineTo(size.width * 0.8708025, size.height * 0.4933357)
      ..cubicTo(
        size.width * 0.8708025,
        size.height * 0.4709429,
        size.width * 0.8695478,
        size.height * 0.4527107,
        size.width * 0.8670382,
        size.height * 0.4386393,
      )
      ..cubicTo(
        size.width * 0.8645287,
        size.height * 0.4239250,
        size.width * 0.8605350,
        size.height * 0.4165679,
        size.width * 0.8550573,
        size.height * 0.4165679,
      )
      ..cubicTo(
        size.width * 0.8497006,
        size.height * 0.4165679,
        size.width * 0.8457070,
        size.height * 0.4236036,
        size.width * 0.8430828,
        size.height * 0.4376786,
      )
      ..cubicTo(
        size.width * 0.8404586,
        size.height * 0.4511143,
        size.width * 0.8387452,
        size.height * 0.4687036,
        size.width * 0.8379490,
        size.height * 0.4904571,
      )
      ..lineTo(size.width * 0.8180955, size.height * 0.4530321)
      ..cubicTo(
        size.width * 0.8194650,
        size.height * 0.4287214,
        size.width * 0.8216306,
        size.height * 0.4066500,
        size.width * 0.8245987,
        size.height * 0.3868214,
      )
      ..cubicTo(
        size.width * 0.8276815,
        size.height * 0.3663500,
        size.width * 0.8317261,
        size.height * 0.3500357,
        size.width * 0.8367516,
        size.height * 0.3378811,
      )
      ..cubicTo(
        size.width * 0.8418854,
        size.height * 0.3250864,
        size.width * 0.8481019,
        size.height * 0.3186889,
        size.width * 0.8554013,
        size.height * 0.3186889,
      )
      ..cubicTo(
        size.width * 0.8665860,
        size.height * 0.3186889,
        size.width * 0.8754268,
        size.height * 0.3343625,
        size.width * 0.8819299,
        size.height * 0.3657107,
      )
      ..cubicTo(
        size.width * 0.8884331,
        size.height * 0.3970571,
        size.width * 0.8916815,
        size.height * 0.4424750,
        size.width * 0.8916815,
        size.height * 0.5019714,
      )
      ..lineTo(size.width * 0.8916815, size.height * 0.6794964)
      ..cubicTo(
        size.width * 0.8916815,
        size.height * 0.6986857,
        size.width * 0.8932803,
        size.height * 0.7082821,
        size.width * 0.8964777,
        size.height * 0.7082821,
      )
      ..lineTo(size.width * 0.9033185, size.height * 0.7082821)
      ..lineTo(size.width * 0.9033185, size.height * 0.8080821)
      ..lineTo(size.width * 0.8889427, size.height * 0.8080821)
      ..cubicTo(
        size.width * 0.8847261,
        size.height * 0.8080821,
        size.width * 0.8812420,
        size.height * 0.8023214,
        size.width * 0.8785032,
        size.height * 0.7908071,
      )
      ..cubicTo(
        size.width * 0.8757707,
        size.height * 0.7792929,
        size.width * 0.8744013,
        size.height * 0.7639393,
        size.width * 0.8744013,
        size.height * 0.7447464,
      )
      ..lineTo(size.width * 0.8744013, size.height * 0.7437893)
      ..lineTo(size.width * 0.8711465, size.height * 0.7437893)
      ..cubicTo(
        size.width * 0.8706879,
        size.height * 0.7514643,
        size.width * 0.8696624,
        size.height * 0.7617000,
        size.width * 0.8680637,
        size.height * 0.7744964,
      )
      ..cubicTo(
        size.width * 0.8664713,
        size.height * 0.7866500,
        size.width * 0.8639618,
        size.height * 0.7975250,
        size.width * 0.8605350,
        size.height * 0.8071214,
      )
      ..cubicTo(
        size.width * 0.8571146,
        size.height * 0.8167179,
        size.width * 0.8524331,
        size.height * 0.8215143,
        size.width * 0.8465032,
        size.height * 0.8215143,
      )
      ..close()
      ..moveTo(size.width * 0.8502675, size.height * 0.7236357)
      ..cubicTo(
        size.width * 0.8563185,
        size.height * 0.7236357,
        size.width * 0.8612229,
        size.height * 0.7143607,
        size.width * 0.8649873,
        size.height * 0.6958071,
      )
      ..cubicTo(
        size.width * 0.8688662,
        size.height * 0.6766179,
        size.width * 0.8708025,
        size.height * 0.6513464,
        size.width * 0.8708025,
        size.height * 0.6200000,
      )
      ..lineTo(size.width * 0.8708025, size.height * 0.6104036)
      ..lineTo(size.width * 0.8490701, size.height * 0.6104036)
      ..cubicTo(
        size.width * 0.8450764,
        size.height * 0.6104036,
        size.width * 0.8419427,
        size.height * 0.6152036,
        size.width * 0.8396561,
        size.height * 0.6248000,
      )
      ..cubicTo(
        size.width * 0.8373758,
        size.height * 0.6343964,
        size.width * 0.8362357,
        size.height * 0.6478286,
        size.width * 0.8362357,
        size.height * 0.6651000,
      )
      ..cubicTo(
        size.width * 0.8362357,
        size.height * 0.6823750,
        size.width * 0.8374331,
        size.height * 0.6964500,
        size.width * 0.8398280,
        size.height * 0.7073250,
      )
      ..cubicTo(
        size.width * 0.8422229,
        size.height * 0.7182000,
        size.width * 0.8457070,
        size.height * 0.7236357,
        size.width * 0.8502675,
        size.height * 0.7236357,
      )
      ..close();

    final Paint paint8Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_8, paint8Fill);

    final Path path_9 = Path()
      ..moveTo(size.width * 0.9263885, size.height)
      ..lineTo(size.width * 0.9263885, size.height * 0.8944429)
      ..lineTo(size.width * 0.9725924, size.height * 0.8944429)
      ..cubicTo(
        size.width * 0.9757898,
        size.height * 0.8944429,
        size.width * 0.9773822,
        size.height * 0.8848464,
        size.width * 0.9773822,
        size.height * 0.8656571,
      )
      ..lineTo(size.width * 0.9773822, size.height * 0.7457071)
      ..lineTo(size.width * 0.9743057, size.height * 0.7457071)
      ..cubicTo(
        size.width * 0.9733885,
        size.height * 0.7565821,
        size.width * 0.9719682,
        size.height * 0.7674571,
        size.width * 0.9700255,
        size.height * 0.7783321,
      )
      ..cubicTo(
        size.width * 0.9680892,
        size.height * 0.7892071,
        size.width * 0.9654650,
        size.height * 0.7981643,
        size.width * 0.9621529,
        size.height * 0.8052036,
      )
      ..cubicTo(
        size.width * 0.9588471,
        size.height * 0.8122393,
        size.width * 0.9546242,
        size.height * 0.8157571,
        size.width * 0.9494904,
        size.height * 0.8157571,
      )
      ..cubicTo(
        size.width * 0.9428726,
        size.height * 0.8157571,
        size.width * 0.9370510,
        size.height * 0.8074393,
        size.width * 0.9320318,
        size.height * 0.7908071,
      )
      ..cubicTo(
        size.width * 0.9271274,
        size.height * 0.7735357,
        size.width * 0.9233057,
        size.height * 0.7498643,
        size.width * 0.9205669,
        size.height * 0.7198000,
      )
      ..cubicTo(
        size.width * 0.9178280,
        size.height * 0.6897321,
        size.width * 0.9164586,
        size.height * 0.6551857,
        size.width * 0.9164586,
        size.height * 0.6161643,
      )
      ..lineTo(size.width * 0.9164586, size.height * 0.3321236)
      ..lineTo(size.width * 0.9380255, size.height * 0.3321236)
      ..lineTo(size.width * 0.9380255, size.height * 0.6065679)
      ..cubicTo(
        size.width * 0.9380255,
        size.height * 0.6423929,
        size.width * 0.9395605,
        size.height * 0.6692607,
        size.width * 0.9426433,
        size.height * 0.6871714,
      )
      ..cubicTo(
        size.width * 0.9458408,
        size.height * 0.7050857,
        size.width * 0.9503439,
        size.height * 0.7140393,
        size.width * 0.9561656,
        size.height * 0.7140393,
      )
      ..cubicTo(
        size.width * 0.9627834,
        size.height * 0.7140393,
        size.width * 0.9679172,
        size.height * 0.7018857,
        size.width * 0.9715669,
        size.height * 0.6775750,
      )
      ..cubicTo(
        size.width * 0.9752166,
        size.height * 0.6526286,
        size.width * 0.9770446,
        size.height * 0.6180821,
        size.width * 0.9770446,
        size.height * 0.5739393,
      )
      ..lineTo(size.width * 0.9770446, size.height * 0.3321236)
      ..lineTo(size.width * 0.9986051, size.height * 0.3321236)
      ..lineTo(size.width * 0.9986051, size.height * 0.8925250)
      ..cubicTo(
        size.width * 0.9986051,
        size.height * 0.9251500,
        size.width * 0.9968917,
        size.height * 0.9510607,
        size.width * 0.9934713,
        size.height * 0.9702500,
      )
      ..cubicTo(
        size.width * 0.9900510,
        size.height * 0.9900821,
        size.width * 0.9854841,
        size.height,
        size.width * 0.9797834,
        size.height,
      )
      ..lineTo(size.width * 0.9263885, size.height)
      ..close();

    final Paint paint9Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = textColor;
    canvas.drawPath(path_9, paint9Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
