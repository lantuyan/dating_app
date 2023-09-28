import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../../theme/color_schemes.dart';
import 'widgets/app_bar.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    print('${inactiveMatches.length.toString()} is inactive matches');
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 96),
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 40),
          child: AppBarCustom(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 40, right: 40, top: 20),
        child: Column(
          children: [
            Text(
              'This is a list of people who have liked you and your matches.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: blackColor.withOpacity(0.6),
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 0),
                    child: Divider(
                      color: blackColor.withOpacity(0.6),
                      thickness: 0.5,
                    ),
                  ),
                ),
                Text(
                  'Today',
                  style: TextStyle(
                    color: blackColor.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 0),
                    child: Divider(
                      color: blackColor.withOpacity(0.6),
                      thickness: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: inactiveMatches.length,
                  shrinkWrap: true,
                  gridDelegate: const  SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            inactiveMatches[index].matchedUser.imageUrls[0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Text(
                            inactiveMatches[index].matchedUser.name,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
