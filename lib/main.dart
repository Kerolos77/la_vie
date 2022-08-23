import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/mobile/regisation_screen.dart';

import 'data/local/cache_helper.dart';
import 'data/web_services/dio_hellper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}
