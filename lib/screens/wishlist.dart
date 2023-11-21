import 'package:apiexample/api/storeapi.dart';
import 'package:apiexample/providers/cartprovider.dart';

import 'package:apiexample/providers/wishlistprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    final storeprovider = Provider.of<Storeapi>(context, listen: true);
    final wishprovider = Provider.of<WishProvider>(context, listen: false);
    final cartprovider = Provider.of<Cartprovider>(context, listen: true);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 203, 203),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Wishlist",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: wishprovider.wishListed.length,
        itemBuilder: (context, index) {
          final productId = wishprovider.wishListed[index];
          final product =
              storeprovider.imagedata!.firstWhere((p) => p.id == productId);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: .6),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 145,
                      width: 145,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product.image)),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              product.title,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              height: 25,
                              width: 150,
                              child: Row(
                                children: [
                                  Text("\$${product.price.toString()}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 45, 110, 48))),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      wishprovider.removeWish(product.id);
                                    },
                                    child: const Icon(
                                      Ionicons.heart,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                if (cartprovider.cartAdded
                                    .contains(product.id)) {
                                  cartprovider.removeCart(product.id);
                                  if (kDebugMode) {
                                    print(cartprovider.cartAdded);
                                  }
                                } else {
                                  cartprovider.addCart(product.id);
                                  if (kDebugMode) {
                                    print(cartprovider.cartAdded);
                                  }
                                }
                              },
                              child: Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text("Add To Cart",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
