import 'package:auth_tutorial/firebase_options.dart';
import 'package:auth_tutorial/provider/authentication/login_provider.dart';
import 'package:auth_tutorial/provider/authentication/registration_provider.dart';
import 'package:auth_tutorial/utils/router/app_route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color(0xff575DFB),
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          ),
          routeInformationParser: MyAppRouter().router.routeInformationParser,
          routerDelegate: MyAppRouter().router.routerDelegate
        );
      },
    );
  }
}
