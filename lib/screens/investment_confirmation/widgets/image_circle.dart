import 'package:finniu/constants/colors.dart';
import 'package:finniu/providers/settings_provider.dart';
import 'package:finniu/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularImage extends ConsumerWidget {
  const CircularImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final themeProvider = ref.watch(settingsNotifierProvider);
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 5.0,
      percent: 0.5,
      center: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: Image.asset(
                  'assets/result/money.png',
                  width: 60,
                  height: 58.22,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "6 meses",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(primaryDark),
              ),
            )
          ],
        ),
      ),
      progressColor: Color(themeProvider.isDarkMode ? primaryLight : primaryDark),
      backgroundColor: Color(themeProvider.isDarkMode ? primaryDark : primaryLight),
      fillColor: Colors.white,
    );
  }
}
