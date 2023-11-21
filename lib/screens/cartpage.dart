import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../api/storeapi.dart';
import '../providers/cartprovider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _KartState();
}

class _KartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final storeprovider = Provider.of<Storeapi>(context, listen: true);
    final cartprovider = Provider.of<Cartprovider>(context, listen: true);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 203, 203),
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "My Cart",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: cartprovider.cartAdded.length,
        itemBuilder: (context, index) {
          final productId = cartprovider.cartAdded[index];
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Order Total",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "\$${product.price.toString()}",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 43, 142, 46)),
                      ),
                      Text(
                        "Dispatching soon",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 26, 98, 205)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
