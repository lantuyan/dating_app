import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends Stateful Widget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        children: [
          Text('Settings', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
          const SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.person, color: Colors.pinkAccent,),
              const SizedBox(width: 8,),
              Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
            ],
          ),
          Divider(height: 15, thickness: 1,),
          const SizedBox(height: 10,),
          buildAccountOptionRow(context, 'Change password'),
          buildAccountOptionRow(context, 'Content settings'),
          buildAccountOptionRow(context, 'Social'),
          buildAccountOptionRow(context, 'Language'),
          buildAccountOptionRow(context, 'Privacy and security'),
          Row(
            children: [
              Icon(Icons.volume_up_outlined, color: Colors.pinkAccent,),
              const SizedBox(width: 8,),
              Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),)
            ],
          ),
          Divider(height: 15, thickness: 1,),

          buildNotificationOptionRow('New for you', true),
          buildNotificationOptionRow('Account activity', true),
          buildNotificationOptionRow('Opportunity', false),
          const SizedBox(height: 30,),
          Center(
            child: OutlinedButton(
                onPressed: (){},
                child: Text('SIGN OUT', style: TextStyle(
                  fontSize: 16, letterSpacing: 2.2, color: Colors.black
                ),)),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title){
    return  GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Option 1"),
                  Text("Option 2"),
                  Text("Opntion 3"),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'))
              ],
            );
          },);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight:FontWeight.w500, color: Colors.grey[600], fontSize: 18),),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }

  Widget buildNotificationOptionRow(String title , bool isActive){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey[600]),),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(value: isActive, onChanged: (bool value) {

            } ,))
      ],
    );
  }
}
