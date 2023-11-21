import 'package:apiexample/utils/navigation.dart';
import 'package:apiexample/utils/signuppage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _loginkey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            "Login",
            style:
                GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.w600),
          )),
          const SizedBox(
            height: 10,
          ),
          Form(
              key: _loginkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Navigationpage(),
                      ));
                    },
                    child: Container(
                      width: 375,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffFAD16B),
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                    },
                    child: Text(
                      "Create account",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
