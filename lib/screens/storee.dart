import 'package:apiexample/api/storeapi.dart';

import 'package:apiexample/screens/eachproduct.dart';
import 'package:apiexample/utils/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Store> {
  @override
  void initState() {
    super.initState();
    Provider.of<Storeapi>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    final storeprovider = Provider.of<Storeapi>(context, listen: true);

    return storeprovider.isloading
        ? const Loading()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 233, 205, 120),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 77, 72, 72),
              title: const Text(
                ''' Hello   
 Saurav!''',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.notifications_none),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(5)),
                      child: const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.mic_none,
                              size: 32,
                              color: Colors.black,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            hintText: "Search for orders . .",
                            hintStyle: TextStyle(fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final aIndex = index + 13;
                        if (aIndex >= 13 && aIndex <= 16) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 170,
                              width: 400,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 195,
                                    height: double.infinity,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 40, right: 32),
                                          child: Text(
                                            "Year End",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        const Text("BIG SALE!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 39, 36, 28),
                                              borderRadius:
                                                  BorderRadius.circular(38)),
                                          child: Center(
                                            child: Text(
                                              "Shop Now!",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 175,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    storeprovider
                                                        .imagedata![aIndex]
                                                        .image)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => Eachproduct(
                                                productData: storeprovider
                                                    .imagedata![aIndex],
                                              ),
                                            ));
                                          },
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox(
                            child: Text("data"),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Featured",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text("view all"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: storeprovider.imagedata!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(storeprovider
                                                .imagedata![index].image)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Eachproduct(
                                            productData:
                                                storeprovider.imagedata![index],
                                          ),
                                        ));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      storeprovider.imagedata![index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 135),
                                  child: Text(
                                      storeprovider
                                          .imagedata![index].rating.rate
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 115),
                                  child: Text(
                                      storeprovider.imagedata![index].price
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Trending",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: storeprovider.imagedata!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    height: 150,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(storeprovider
                                                .imagedata![index].image)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Eachproduct(
                                            productData:
                                                storeprovider.imagedata![index],
                                          ),
                                        ));
                                      },
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, left: 20, right: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        storeprovider.imagedata![index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 22,
                                            ),
                                            Text(
                                                storeprovider
                                                    .imagedata![index].id
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                storeprovider.imagedata![index]
                                                    .rating.rate
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "\$${storeprovider.imagedata![index].price}"
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
  }
}
