import 'package:finniu/screens/confirmation_phone/confirmation_phone_screen.dart';
import 'package:finniu/screens/help/help_screen.dart';
import 'package:finniu/screens/home/home.dart';
import 'package:finniu/screens/home/notification.dart';
import 'package:finniu/screens/intro_screen.dart';
import 'package:finniu/screens/investment_question/result.dart';
import 'package:finniu/screens/investment_question/question.dart';
import 'package:finniu/screens/investment_question/start_invesment.dart';
import 'package:finniu/screens/languages/languages_screen.dart';
import 'package:finniu/screens/login/email_screen.dart';
import 'package:finniu/screens/login/forgot_password.dart';
import 'package:finniu/screens/login/invalid_email.dart';
import 'package:finniu/screens/my_investment/my_investment_start.dart';
import 'package:finniu/screens/privacy/privacy_screen.dart';
import 'package:finniu/screens/profile/profile_screen.dart';
import 'package:finniu/screens/signup/email_screen.dart';
import 'package:finniu/screens/login/start_screen.dart';
import 'package:finniu/screens/onboarding/start_onboarding.dart';
import 'package:finniu/screens/transfers/transfers_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => IntroScreen(),
    '/login_start': (BuildContext context) => StartLoginScreen(),
    '/login_email': (BuildContext context) => EmailLoginScreen(),
    '/investment_select': (BuildContext context) => SelectRange(),
    '/sign_up_email': (BuildContext context) => SignUpEmailScreen(),
    '/login_forgot': (BuildContext context) => const ForgotPassword(),
    '/login_invalid': (BuildContext context) => const InvalidEmail(),
    '/on_boarding_start': (BuildContext context) => StartOnboarding(),
    '/investment_start': (BuildContext context) => const StartInvestment(),
    '/investment_result': (BuildContext context) => ResultInvestment(),
    '/home_home': (BuildContext context) => HomeStart(),
    '/home_notification': (BuildContext context) => NotificationScreen(),
    '/profile': (BuildContext context) => ProfileScreen(),
    '/my_investment': (BuildContext context) => InvestmentStart(),
    '/privacy': (BuildContext context) => PrivacyScreen(),
    '/transfers': (BuildContext context) => TransfersScreen(),
    '/languages': (BuildContext context) => LanguagesStart(),
    '/help': (BuildContext context) => HelpScreen(),
    '/help': (BuildContext context) => HelpScreen(),
    '/confirmation': (BuildContext context) => Confirmation_Phone(),
  };
}
