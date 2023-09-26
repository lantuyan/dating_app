import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../models/model.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/color_schemes.dart';
import '../widgets/choice_button.dart';

class UserProfileScreen extends StatefulWidget {
    final String id;

  const UserProfileScreen({super.key, required this.id});

  

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late String userId = widget.id;
  late User user = User.users.firstWhere((element) => element.id == userId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
          child: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            // leading: BackButton(
            //   color: whiteColor,
            //   onPressed: () {
            //     context.pop();
            //   },
            // ),
            leading: const BackToScreenButton(
              backRoute: NavigationPath.homeScreen,
            ),

                //back to home screen
                
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Hero(
                  tag: 'userImage',
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              user.imageUrls[0],
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: bgColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  child: Container(
                    color: bgColor,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - (60 + 90 / 2),
                  child: Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceButton(
                          height: 60,
                          width: 60,
                          color: whiteColor,
                          icon: Icons.close_rounded,
                          size: 30,
                          iconColor: orangeColor,
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        // Match Button
                        ChoiceButton(
                          height: 90,
                          width: 90,
                          color: redColor,
                          icon: Icons.favorite_rounded,
                          size: 40,
                          iconColor: whiteColor,
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        // Star Button
                        ChoiceButton(
                          height: 60,
                          width: 60,
                          color: whiteColor,
                          icon: Icons.star_rounded,
                          size: 30,
                          iconColor: Colors.purple,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: user.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                              children: [
                                TextSpan(
                                  text: ', ${user.age}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            user.jobTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: borderColor,
                              width: 2.0,
                            )),
                        // color: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: redColor,
                            size: 20,
                          ),
                          color: redColor,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.location,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: user.location,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: blackColor,
                              ),
                              children: [
                                TextSpan(
                                  text: ', ${user.location}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor.withOpacity(0.2),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: redColor,
                                size: 20,
                              ),
                              Text(
                                '2 km',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: redColor,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      Text(
                        user.bio,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: blackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Read more',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: redColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Interests',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      Container(
                        height: 90,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 40,
                            childAspectRatio: 40,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: redColor,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.verified_outlined,
                                    color: redColor,
                                    size: 18,
                                  ),
                                  Text(
                                    user.interests[index],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Gallery',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {

                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: redColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Albume Images
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width /2 - 40 - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[1]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width /2 - 40 - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[2]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 400/3,
                        width: MediaQuery.of(context).size.width /3 - 80/3 - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[1]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 400/3,
                        width: MediaQuery.of(context).size.width /3 - 80/3 - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[2]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 400/3,
                        width: MediaQuery.of(context).size.width /3 - 80/3 - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[2]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                     const SizedBox(height: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackToScreenButton extends StatelessWidget {
  final String backRoute;

  const BackToScreenButton({
    super.key,
    required this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: borderColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          )),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: whiteColor,
          size: 20,
        ),
        color: whiteColor,
        onPressed: () {
          context.go(backRoute);
        },
      ),
    );
  }
}
