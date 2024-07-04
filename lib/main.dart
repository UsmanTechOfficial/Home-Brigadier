import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_brigadier/app/data/get_services_binding.dart';
import 'package:home_brigadier/app/routes/app_pages.dart';
import 'package:home_brigadier/connectivity_service.dart';
import 'package:home_brigadier/consts/const.dart';
import 'package:home_brigadier/services/apis/api_endpoints.dart';
import 'package:home_brigadier/services/apis/api_helper.dart';
import 'package:home_brigadier/splash_screen.dart';
import 'package:home_brigadier/theme/theme.dart';
import 'package:home_brigadier/utils/notification_service.dart';
import 'package:home_brigadier/utils/shared_preferance.dart';

import 'firebase_options.dart';
import 'generated/locales.g.dart';

// Main function to initialize the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    _initializeFirebase(),
    _initializeStripe(),
    _initializeAppSettings(),
  ]);
  NotificationService().initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

// Firebase initialization
Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// Stripe initialization
Future<void> _initializeStripe() async {
  Stripe.publishableKey = publishableKey;
  Stripe.merchantIdentifier = 'YOUR-APPLE-MERCHANT-IDENTIFIER';
  Stripe.instance.applySettings();
  await dotenv.load(fileName: ".env");
}

// App settings initialization
Future<void> _initializeAppSettings() async {
  await GetStorage.init();
  ConnectivityService.checkConnectivity();
  if (Platform.isIOS) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  } else if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  log("Start user Role ${GetStorage().read(SharedPreference.roleKey)}");
}

// Helper function to get locale value
String localeValue() =>
    GetStorage().read(SharedPreference.langKey) ?? "English";

// Global key for ScaffoldMessenger
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationService().showNotification(message);
}

// Main app widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((String? token) {
      assert(token != null);
      print("FCM Token: $token");

      try {
        ApiHelper().post("${ApiEndpoints.BASEURL}notification-token/",
            {"notification_token": "$token"} as Map<String, dynamic>);
        print("FCM Posted");
      } catch (e) {
        print(e.toString());
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        NotificationService().showNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translations,
      locale: localeValue() == "العربية"
          ? const Locale('ar', 'SA')
          : const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: "home_brigadier",
      theme: Themes.lightTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.routes,
      initialBinding: GetServicesBinding(),
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: const SplashScreen(),
    );
  }
}
