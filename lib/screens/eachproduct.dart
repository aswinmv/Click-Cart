import 'package:apiexample/providers/cartprovider.dart';
import 'package:apiexample/screens/cartpage.dart';
import 'package:apiexample/providers/wishlistprovider.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class Eachproduct extends StatefulWidget {
  // final String image;
  // final double rating;
  // final double price;
  // final int count;
  // final String description;
  // final String title;
  // final int id;

  // ignore: prefer_typing_uninitialized_variables
  final productData;

  const Eachproduct({super.key, required this.productData
      // required this.image,
      // required this.rating,
      // required this.price,
      // required this.description,
      // required this.title,
      // required this.count,
      // required this.id

      });

  @override
  State<Eachproduct> createState() => _EachproductState();
}

class _EachproductState extends State<Eachproduct> {
  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<Cartprovider>(context, listen: true);
    final wishprovider = Provider.of<WishProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: const Color(0xffEAEAEA),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(widget.productData.image)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                            onTap: () {
                              if (wishprovider.wishListed
                                  .contains(widget.productData.id)) {
                                wishprovider.removeWish(widget.productData.id);
                                if (kDebugMode) {
                                  print(wishprovider.wishListed);
                                }
                              } else {
                                wishprovider.addWish(widget.productData.id);
                                if (kDebugMode) {
                                  print(wishprovider.wishListed);
                                }
                              }
                            },
                            child: wishprovider.isliked
                                ? const Icon(
                                    Ionicons.heart,
                                    color: Colors.red,
                                  )
                                : const Icon(Ionicons.heart_outline))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.productData.title,
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.productData.rating.rate.toString(),
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "${widget.productData.rating.count} reviews",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Options",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffFCE7B4),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(9),
                                  topRight: Radius.circular(9)),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade600)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              "Black",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "\$${widget.productData.price.toString()}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Text(
                            "In Stock",
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 61, 201, 68),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(9),
                                  topRight: Radius.circular(9)),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade600)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              "White",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "\$${widget.productData.price.toString()}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Text(
                            "In Stock",
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 61, 201, 68),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    if (cartprovider.cartAdded
                        .contains(widget.productData.id)) {
                      cartprovider.removeCart(widget.productData.id);
                      if (kDebugMode) {
                        print(cartprovider.cartAdded);
                      }
                    } else {
                      cartprovider.addCart(widget.productData.id);
                      if (kDebugMode) {
                        print(cartprovider.cartAdded);
                      }
                    }
                  },
                  child: cartprovider.ontapped
                      ? Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(width: .7),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Go to Cart",
                                style: GoogleFonts.poppins(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Cart(),
                                  ));
                                },
                                child: const Icon(
                                  Ionicons.arrow_forward_sharp,
                                  size: 35,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(width: .7),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Add to Cart",
                                style: GoogleFonts.poppins(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              const Icon(
                                Ionicons.cart_outline,
                                size: 35,
                              ),
                            ],
                          ),
                        )),
            )
          ]),
        ),
      ),
    );
  }
}
