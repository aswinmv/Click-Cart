import 'package:apiexample/utils/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontSize: 45, fontWeight: FontWeight.w600),
              ),
            ),
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: const Text("Name"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: const Text("Phone number"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text("Confirm Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text("I agree to terms & conditions")
                ],
              ),
            ),
            // sign up button

            //      /////// ////
            GestureDetector(
              child: Container(
                width: 375,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xffFAD16B),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 20),
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text("Or sign up with"),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.facebook),
                        Text("  Facebook")
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google),
                        Text("  Google")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                  child: Text(
                    "Already have an account ? sign in",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
