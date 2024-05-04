import 'package:finniu/firebase_options.dart';
import 'package:finniu/presentation/providers/settings_provider.dart';
import 'package:finniu/services/share_preferences_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:finniu/routes/routes.dart';
import 'package:finniu/presentation/screens/intro_screen.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:loader_overlay/loader_overlay.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Preferences.init();
//   Intl.defaultLocale = 'pt_BR';
//   await initializeDateFormatting();
//   await initHiveForFlutter(); //graphql cache

//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initHiveForFlutter();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // final gqlClient =  ref.watch(gqlClientProvider);
    return GlobalLoaderOverlay(
      child: MaterialApp(
        title: 'Finniu',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics), //Analytics
        ],
        initialRoute: '/',
        // theme: ThemeData.dark(),
        theme: ref.watch(settingsNotifierProvider).currentTheme,
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => const IntroScreen(),
          );
        },
      ),
    );
  }
}
