import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends StatelessWidget {
  const NumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 64,
          width: 64,
          child: TextFormField(
            onChanged: (value) {
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (pin1) {
            },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder( //border khi click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),
              enabledBorder: const OutlineInputBorder( //border khi k click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),

              hintText: '0',
              hintStyle: TextStyle(fontSize: 30, color: Colors.pinkAccent),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(
          height: 64,
          width: 64,
          child: TextFormField(
            onChanged: (value) {
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (pin2) {
            },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder( //border khi click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),
              enabledBorder: const OutlineInputBorder( //border khi k click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),

              hintText: '0',
              hintStyle: TextStyle(fontSize: 30, color: Colors.pinkAccent),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(
          height: 64,
          width: 64,
          child: TextFormField(
            onChanged: (value) {
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (pin3) {
            },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder( //border khi click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),
              enabledBorder: const OutlineInputBorder( //border khi k click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),

              hintText: '0',
              hintStyle: TextStyle(fontSize: 30, color: Colors.pinkAccent),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(
          height: 64,
          width: 64,
          child: TextFormField(
            onChanged: (value) {
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (pin4) {
            },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder( //border khi click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),
              enabledBorder: const OutlineInputBorder( //border khi k click
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 1
                  )
              ),

              hintText: '0',
              hintStyle: TextStyle(fontSize: 30, color: Colors.pinkAccent),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),

      ],
    ));
  }
}
