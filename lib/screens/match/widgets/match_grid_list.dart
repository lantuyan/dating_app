import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/model.dart';
import '../../../theme/color_schemes.dart';



class MatchGridList extends StatelessWidget {
  const MatchGridList({
    super.key,
    required this.inactiveMatches,
  });

  final List<UserMatch> inactiveMatches;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: inactiveMatches.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                inactiveMatches[index].matchedUser.imageUrls[0],
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.loose,
            // clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        '${inactiveMatches[index].matchedUser.name}, ${inactiveMatches[index].matchedUser.age}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.close,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: whiteColor,
                              thickness: 0.5,
                            ),
                          ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_sharp,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
