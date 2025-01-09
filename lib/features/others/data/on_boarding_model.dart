import 'package:flutter/material.dart';

import '../../../constants/image_constants.dart';
import '../presentation/pages/onboarding/widgets/slider_widget.dart';

class OnBoardingModel {
  static List<Widget> pages = [
    const SliderWidget(
      title: 'Добро пожаловать в Sarbon!',
      subTitle: 'Ваш надежный помощник в поиске грузов и новых маршрутов',
      image: PngImage.onBoardingFirst,
    ),
    const SliderWidget(
      title: 'Всё в одном месте',
      subTitle: 'Ищите грузы, предлагайте услуги и работайте удобнее',
      image: PngImage.onBoardingSecond,
    ),
    const SliderWidget(
      title: 'На карте в онлайн режиме',
      subTitle: 'Ищите грузы, предлагайте услуги и работайте удобнее',
      image: PngImage.onBoardingThird,
    ),
    const SliderWidget(
      title: 'Готовы к работе?',
      subTitle: 'Найдите грузы с Sarbon и начните зарабатывать прямо сейчас!',
      image: PngImage.onBoardingFourth,
    ),
  ];
}
