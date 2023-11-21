import 'package:apiexample/api/storeapi.dart';
import 'package:apiexample/providers/cartprovider.dart';
import 'package:apiexample/utils/signuppage.dart';
import 'package:apiexample/providers/wishlistprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool repeat = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  repeat = prefs.getBool('shown') ?? false;
  if (kDebugMode) {
    print(repeat);
  }
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<Catprovider10>(
        //   create: (context) => Catprovider10(),
        // ),
        ChangeNotifierProvider<Storeapi>(
          create: (context) => Storeapi(),
        ),
        ChangeNotifierProvider<Cartprovider>(
          create: (context) => Cartprovider(),
        ),
        ChangeNotifierProvider<WishProvider>(
          create: (context) => WishProvider(),
        )
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignUpPage(),
      // home: repeat == false ? const StartPage() : const Navigationpage(),
    );
  }
}
