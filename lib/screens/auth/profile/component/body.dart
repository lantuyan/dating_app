import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../navigation/navigation.dart';
import '../../widgets/confirm_button.dart';
import '../../widgets/my_button.dart';
import 'choose.dart';
import 'profile_form.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Profile details', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
              const SizedBox(width: 10,),
            ],
          ),
          const SizedBox(height: 30,),
          Expanded(
            child: Column(
              children: [
                ProfilePic(),
                const SizedBox(height: 30,),
                ProfileForm(nameLabel: 'First Name',nameHint: 'Enter First Name',),
                const SizedBox(height: 20,),
                ProfileForm(nameLabel: 'Last Name',nameHint: 'Enter Last Name',),
                const SizedBox(height: 20,),
                ButtonChoose(onTap: (){
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Container(
                            height: 500,
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                Text('Birthday'),
                                Expanded(
                                  child: Container(
                                    child: TableCalendar(
                                      rowHeight: 42,
                                      headerStyle: HeaderStyle(
                                        formatButtonVisible: false,
                                        titleCentered: true,
                                        titleTextStyle: TextStyle(fontSize: 30),
                                      ),
                                      availableGestures: AvailableGestures.all,
                                      focusedDay: today,
                                      firstDay: DateTime.utc(1970, 01, 01),
                                      lastDay: DateTime.utc(2030, 01,01),
                                      selectedDayPredicate: (currentSelectedDate) {
                                        // as per the documentation 'selectedDayPredicate' needs to determine current selected day.
                                        return (isSameDay(
                                            today!, currentSelectedDate));
                                      },
                                      onDaySelected: (selectedDay, focusedDay) {
                                        // as per the documentation
                                        if (!isSameDay(today, selectedDay)) {
                                          setState(() {
                                            today = selectedDay;
                                          });
                                        }
                                      },
                                      calendarStyle: CalendarStyle(
                                        todayDecoration: BoxDecoration(
                                          color: Colors.pinkAccent.shade100,
                                          shape: BoxShape.circle,
                                        ),
                                        selectedDecoration: BoxDecoration(
                                          color: Colors.pinkAccent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                MyButton(onTap: (){},textMy: 'Save',)
                              ],
                            ),
                          ),
                        );
                      },
                      backgroundColor: Colors.white
                  );
                }, textMy: 'Sam'),
              ],
            ),
          ),
          MyButton(onTap: (){
            context.go(NavigationPath.chat);
          },textMy: 'Confirm',),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}
