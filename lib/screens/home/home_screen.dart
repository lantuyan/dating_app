import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// import '../../models/model.dart';
import '../../theme/color_schemes.dart';
import 'bloc/swipe_bloc.dart';
import 'bloc/swipe_provider.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 96),
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 40),
          child: AppBarCustom(),
        ),
      ),
      body: SwipeProvider(
        child: BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, state) {
            if (state is SwipeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SwipeLoaded) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) => InkWell(
                              onTap: () {
                                context.goNamed('userProfile',
                                    // .replaceFirst(':id', state.users[0].id as String),
                                    params: {
                                      'tab': '0',
                                      'id': state.users[0].id as String,
                                    }

                                    );
                              },
                              child: Draggable(
                                feedback: UserCard(
                                    user: state.users[0],
                                    width: constraints.maxWidth),
                                childWhenDragging:
                                    UserCard(user: state.users[1]),
                                child: UserCard(user: state.users[0]),
                                onDragEnd: (drag) {
                                  if (drag.velocity.pixelsPerSecond.dx < 0) {
                                    context.read<SwipeBloc>()
                                      ..add(SwipeLeft(user: state.users[0]));
                                    print('swip left');
                                  } else {
                                    context.read<SwipeBloc>()
                                      ..add(SwipeRight(user: state.users[0]));
                                    print('swip right');
                                  }
                                },
                              ),
                            ),
                          ),

                          // 3 Buttons: Match, Pass, View Profile
                        ]),
                    // const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Pass Button
                        ChoiceButton(
                          height: 60,
                          width: 60,
                          color: whiteColor,
                          icon: Icons.close_rounded,
                          size: 30,
                          iconColor: orangeColor,
                          onPressed: () {
                            setState(() {
                              context.read<SwipeBloc>()
                                ..add(SwipeLeft(user: state.users[0]));
                              print('swip left');
                            });
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
                            setState(() {
                              context.read<SwipeBloc>()
                                ..add(SwipeRight(user: state.users[0]));
                              print('swip right');
                            });
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
                    // continueButon(),
                  ],
                ),
              );
            } else {
              return const Padding(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
                  child: Text(
                    'Error',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
            }
          },
        ),
      ),
      // bottomNavigationBar: const NavigationBar(),
    );
  }
}
