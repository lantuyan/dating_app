import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/model.dart';
import '../../../theme/color_schemes.dart';

class UserCard extends StatelessWidget {
  final User user;
  final double? width;
  const UserCard({
    super.key,
    required this.user,
    this.width,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      child: Hero(
        tag: 'userImage',
        child: Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: width ?? MediaQuery.of(context).size.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(user.imageUrls[0]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: whiteColor,
                          size: 20,
                        ),
                        Text(
                          '${1 + 2} km',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        // width: equal width parent container
                        // width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.name}, ${user.age}',
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${user.jobTitle}',
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  right: -25,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 90,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: whiteColor,
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: whiteColor.withOpacity(0.3),
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: whiteColor.withOpacity(0.3),
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: whiteColor.withOpacity(0.3),
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: whiteColor.withOpacity(0.3),
                                size: 8,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: redColor,
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: redColor.withOpacity(0.3),
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: redColor.withOpacity(0.3),
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: redColor.withOpacity(0.3),
                                size: 8,
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.circle_rounded,
                                color: redColor.withOpacity(0.3),
                                size: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
