import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Notification/firebase_config.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Screens/Splash_screen/splash_screen.dart';
import 'package:flutter_application_1/Utils/navigationhelper.dart';
import 'package:flutter_application_1/view_model/account_view_model.dart';
import 'package:flutter_application_1/view_model/auth_view_model.dart';
import 'package:flutter_application_1/view_model/blocks_view_model.dart';
import 'package:flutter_application_1/view_model/mandalam_view_model.dart';
import 'package:flutter_application_1/view_model/payment_view_model.dart';
import 'package:flutter_application_1/view_model/poshagasankadana_view_model.dart';
import 'package:flutter_application_1/view_model/transaction_view_modal.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    /// ToDO change yo  qAAAur data ///
    options: const FirebaseOptions(
      apiKey: "AIzaSyDVVZBk7QR2DGFL4aS45VacBp-bSM_RzG0",
      appId: "1:761849461795:android:d0c82511c9290a0ba48596",
      messagingSenderId: "761849461795",
      projectId: "navasankalp-dd551",
    ),
  );
  // Set the background messaging   handler early  on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BlocksViewModel()),
    ChangeNotifierProvider(create: (_) => MandalamViewModel()),
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ChangeNotifierProvider(create: (_) => AccountViewModel()),
    ChangeNotifierProvider(create: (_) => PoshagasankadanaViewModal()),
    ChangeNotifierProvider(create: (_) => TransactionViewModal()),
    ChangeNotifierProvider(create: (_) => PaymentViewModel()),
  ], child: MyAPP()));
}

class MyAPP extends StatefulWidget {
  const MyAPP({super.key});
  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  @override
  void initState() {
    super.initState();
    getToken();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          navigatorKey.currentState!.pushNamed(
            // context,
            '/message',
            arguments: MessageArguments(message, true),
          );
// Here you can write your code
        });
        // Navigator.pushNamed(
        //   context,
        //   '/message',
        //   arguments: MessageArguments(message, true),
        // );
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // channel.description,

              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Future.delayed(const Duration(milliseconds: 2000), () {
        navigatorKey.currentState!.pushNamed(
          // context,
          '/message',
          arguments: MessageArguments(message, true),
        );
// Here you can write your code
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    NavigationHelper.context = context;
    Color _primaryColor = HexColor('#BFE2FE');
    Color _accentColor = HexColor('#E6F4FF');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Navasagalp',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (context) => const Application(),
        '/message': (context) => const MessageView(),
        '/': (context) => const SplashScreen(),
      },
      // home: const Login(),

      // decoration: const BoxDecoration(

      // image: DecorationImage(image: AssetImage("images/kerala.png"))),
      theme: ThemeData(
        primaryColor: _primaryColor,
        // ignore: deprecated_member_use
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      // home: SplashScreen(),
    );
  }

  void getToken() async {
    final token =
        _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }
}
