import 'package:google_fonts/google_fonts.dart';

import '../models/card_page.dart';
import 'package:flutter/material.dart';

class PageCard extends StatelessWidget {
  final CardPage cardPage;
  const PageCard({Key? key, required this.cardPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 27,
                    color: Colors.black12,
                  ),],
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(cardPage.image)
                  )
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              cardPage.title,
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: Colors.pinkAccent
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
                alignment: Alignment.center,
                child: Text(cardPage.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                  maxLines: 2,
                )),
          )
        ],
      ),
    );
  }
}
