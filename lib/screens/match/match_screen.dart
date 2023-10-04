
import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../../theme/color_schemes.dart';
import 'widgets/widgets.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    // print('${inactiveMatches.length.toString()} is inactive matches');

    // ignore: unused_local_variable
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();

    final matchWidgets = <Widget>[];
    List<UserMatch> matchesForDay = <UserMatch>[];
    int previousDay = 0;

    for (final match in inactiveMatches) {
      final day = DateTime.now().difference(match.date).inDays;
      // print('day is $day');

      if (previousDay != day) {
        // Add a "dayLine" when the day changes.
        matchWidgets.add(dayLine(previousDay ?? 0));

        // Add the list of matches for the current day to the widget tree.
        matchWidgets.add(MatchGridList(inactiveMatches: matchesForDay));

        // Clear the list for the next day.
        matchesForDay = <UserMatch>[];
      }

      // Accumulate matches for the current day.
      matchesForDay.add(match);

      previousDay = day;
    }

    // Add the last set of matches.
    if (matchesForDay.isNotEmpty) {
      matchWidgets.add(dayLine(previousDay));
      matchWidgets.add(MatchGridList(inactiveMatches: matchesForDay));
    }

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
          children: <Widget>[
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
            const SizedBox(height: 20),
            Expanded(
              // matchWidgets
              child: ListView(
                children: [
                  ...matchWidgets,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dayLine(int dateTime) {
    String date = dateTime.toString();
    if (dateTime == 0) {
      date = 'Today';
    } else if (dateTime == 1) {
      date = 'Yesterday';
    } else {
      date = '$dateTime days ago';
    }
    return Row(
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
          '$date',
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
    );
  }
}
