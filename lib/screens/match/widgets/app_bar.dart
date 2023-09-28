import 'package:flutter/material.dart';
import '../../../theme/color_schemes.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: const Column(
        children: [
          Text(
            'Matches',
            style: TextStyle(
              color: blackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: const [
        FilterButton(),
      ],
    );
  }
}


class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

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
          Icons.keyboard_double_arrow_down,
          color: redColor,
          size: 20,
        ),
        color: redColor,
        onPressed: () {},
      ),
    );
  }
}
