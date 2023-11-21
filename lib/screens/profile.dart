import 'package:apiexample/api/storeapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    Provider.of<Storeapi>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    final profileimage = Provider.of<Storeapi>(context, listen: true);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 203, 203),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Profile",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Saura Khadka",
                          style: GoogleFonts.poppins(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          image: const DecorationImage(
                              image: NetworkImage("http://surl.li/mgkhy"),
                              fit: BoxFit.cover),
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(60)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: const Color.fromARGB(255, 231, 231, 225),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      "Edit",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: const Color.fromARGB(255, 243, 218, 160),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "What Interest You !",
                        style: GoogleFonts.poppins(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          '''You don't have any interst added listed ,Tell us about your Intersts''',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 290,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.5),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.add),
                            Text(
                              "Add My Interest",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Orders",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  )),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 125,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(profileimage
                                            .imagedata![index].image)),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                    maxLines: 1,
                                    profileimage.imagedata![index].title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Keep Shopping For",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  )),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1.5,
                    crossAxisSpacing: 1.5),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          image: DecorationImage(
                              image: NetworkImage(
                                  profileimage.imagedata![index].image))),
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 300,
              //     child: ListView.builder(
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 5),
              //           child: Container(
              //             width: double.infinity,
              //             height: 160,
              //             decoration: BoxDecoration(
              //                 color: Color.fromARGB(255, 201, 177, 121),
              //                 borderRadius: BorderRadius.circular(15)),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
