import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FiltterScreen extends StatefulWidget {
  const FiltterScreen({Key? key}) : super(key: key);

  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  late int selectedIndex;
  double _currentValue = 0;
  RangeValues _values = RangeValues(0, 100);

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10,),
                  const Text("Filtter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  const Text("Clear", style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold, color: Color(0xffE94057),),)
                ],
              ),
              const SizedBox(height: 30,),
              const Text("Interested in", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5)
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color:selectedIndex == 0 ?  Color(0xffE94057 ):whiteColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                          ),
                          child: Text('Girls',
                            style: TextStyle(
                              color: selectedIndex == 0 ? whiteColor : blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                            ),),
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(color:selectedIndex == 1
                              ?  Color(0xffE94057 ):whiteColor,),
                          child: Text('Boys',
                            style: TextStyle(
                              color: selectedIndex == 1 ? whiteColor : blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color:selectedIndex == 2 ?  Color(0xffE94057 ):whiteColor,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), topRight: Radius.circular(15))
                          ),
                          child: Text('Both',
                            style: TextStyle(
                              color: selectedIndex == 2 ? whiteColor : blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              const SizedBox(height: 30,),
              MyTextField(
                  nameLabel: "Location",
                  nameHint: "Chicogo, USA",
                  obscureText: false
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Text("Distance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Spacer(),
                  Text('${_currentValue.floor()}' +' Km', style: TextStyle(fontSize: 14),)
                ],
              ),
              Slider(
                  value: _currentValue,
                  min: 0,
                  max: 10,
                  activeColor:  Color(0xffE94057),
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Text("Age", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Spacer(),
                  Text('${_values.start.floor()}' +  '-' + '${_values.end.floor()}', style: TextStyle(fontSize: 14),)
                ],
              ),
              RangeSlider(
                  values: _values,
                  min:0,
                  max: 100,
                  activeColor:  Color(0xffE94057),
                  onChanged: (value) {
                    _values = value;
                    setState(() {

                    });
                  },
              ),

              Spacer(),
              MyButton(onTap: (){}, textMy: 'Continue')

            ],

          ),
        ),
      ),
    );

  }
}

class MyTextField extends StatelessWidget {
  final String nameLabel;
  final String nameHint;
  final bool obscureText;
  const MyTextField({Key? key,required this.nameLabel, required this.nameHint, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: nameLabel,
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        hintText: nameHint,
        hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 10
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 10
        ),
        suffixIcon: const Icon(Icons.chevron_right_outlined, size: 24.0, color: Color(0xffE94057),)
      ),

    );
  }
}

class MyButton extends StatelessWidget {
  final String textMy;
  final Function()? onTap;
  const MyButton({
    Key? key,
    required this.onTap,
    required this.textMy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Color(0xffE94057),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(textMy, style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),),

        ),
      ),
    );
  }
}