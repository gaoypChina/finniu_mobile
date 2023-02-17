import 'package:finniu/constants/colors.dart';
import 'package:finniu/providers/theme_provider.dart';
import 'package:finniu/widgets/buttons.dart';
import 'package:finniu/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartInvestment extends StatefulWidget {
  const StartInvestment({super.key});

  @override
  State<StartInvestment> createState() => _StartInvestmentState();
}

class _StartInvestmentState extends State<StartInvestment> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context, listen: false);

    return CustomScaffoldReturnLogo(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 90),
            Stack(
              children: <Widget>[
                Container(
                  width: 276,
                  height: 118,
                  padding: const EdgeInsets.only(left: 20, right: 40, top: 10),
                  child: Text(
                    'Queremos conocerte para ofrecerte lo mejor',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(Theme.of(context).colorScheme.secondary.value),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/investment/arrow.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: 276,
                    height: 163,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(top: 65),
                    decoration: BoxDecoration(
                      color: currentTheme.isDarkMode ? const Color(0xffFFEEDD) : const Color(primaryLightAlternative),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Hola,Mari queremos conocer tus metas que quieres lograr invirtiendo y poder ayudarte a recomendarte la mejor opción de plan de inversion para ti.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: -30,
                  // left: 155,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Color(0xff9381FF),
                      child: CircleAvatar(
                        radius: 43,
                        // foregroundColor: Colors.red,
                        backgroundColor: currentTheme.isDarkMode ? Color(backgroundColorDark) : Colors.white,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/investment/avatar.png'),
                          radius: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            const CustomButton(
              text: 'Continuar',
              width: 224,
              height: 50,
              pushName: '/investment_select',
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
