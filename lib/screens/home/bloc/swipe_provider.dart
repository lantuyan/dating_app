import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/model.dart';
import 'swipe_bloc.dart';

class SwipeProvider extends StatelessWidget {
  final Widget child;
  const SwipeProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SwipeBloc>(
      create: (context) => SwipeBloc()..add(LoadUsers(users: User.users)),
      child: child,
    );
  }
}
