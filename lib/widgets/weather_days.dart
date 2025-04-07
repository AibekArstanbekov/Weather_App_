import 'package:flutter/material.dart';
import 'package:flutter_weather_app/styles/app_styles.dart';

class WeatherDays extends StatelessWidget {
  const WeatherDays({
    super.key,
    required this.text1,
    required this.image,
    required this.text2,
  });
  final String text1, image, text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17.25),
      width: 55.19,
      height: 98.99,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34.5),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: AppStyles.nowTextStyle,
            ),
            Image.asset(
              image,
              width: 41.39,
              height: 41.39,
            ),
            Text(
              text2,
              style: AppStyles.nowTextStyle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
