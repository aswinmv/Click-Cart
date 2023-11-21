import 'package:apiexample/constants/introk.dart';
import 'package:apiexample/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void showIntro() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shown', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(66, 201, 197, 197),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.amberAccent,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1574634534894-89d7576c8259?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80"),
                    fit: BoxFit.fitWidth)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: SizedBox(
              width: 350,
              height: 120,
              child: Text(
                "Let's Enjoy With Best Product",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 40, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Text(
                IntroConstants.introtxt,
                textAlign: TextAlign.center,
                maxLines: 5,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showIntro();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Navigationpage(),
              ));
            },
            child: Container(
              width: 350,
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.2),
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Text(
                "GET STARTED",
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600),
              )),
            ),
          )
        ]),
      ),
    );
  }
}
