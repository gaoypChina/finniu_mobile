import 'package:finniu/presentation/providers/settings_provider.dart';
import 'package:finniu/presentation/screens/catalog/widgets/text_poppins.dart';
import 'package:finniu/presentation/screens/catalog/widgets/user_profil_v2/scafold_user_profil.dart';
import 'package:finniu/presentation/screens/home_v2/widgets/navigation_bar.dart';
import 'package:finniu/presentation/screens/v2_user_profile/widgets/form_register_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterScreenV2 extends StatelessWidget {
  const RegisterScreenV2({super.key});
  final String title = "Bienvenido";
  final String subTitle = "Crea tu cuenta y comienza a invertir en Finniu.";

  @override
  Widget build(BuildContext context) {
    return ScaffoldUserProfile(
      bottomNavigationBar: const NavigationBarHome(),
      children: [
        const LogoFinniu(),
        const SizedBox(height: 10),
        TextPoppins(text: title, fontSize: 24, isBold: true),
        const SizedBox(height: 10),
        SizedBox(
          width: 244,
          child: TextPoppins(
            text: subTitle,
            fontSize: 18,
            isBold: true,
            lines: 2,
          ),
        ),
        const FormRegister(),
      ],
    );
  }
}

class LogoFinniu extends ConsumerWidget {
  const LogoFinniu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(settingsNotifierProvider).isDarkMode;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_register_v2_${isDarkMode ? "dark" : "light"}.png",
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
