import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 233, 205, 120),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .8,
                child: Lottie.asset("assets/shopping.json"),
              ),
              Text(
                "Just A Sec..",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }
}
