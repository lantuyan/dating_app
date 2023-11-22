import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> item =[
      "https://images.pexels.com/photos/789555/pexels-photo-789555.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://images.pexels.com/photos/6152103/pexels-photo-6152103.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://images.pexels.com/photos/3098619/pexels-photo-3098619.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://images.pexels.com/photos/2694040/pexels-photo-2694040.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                 height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item[current]),
                        fit: BoxFit.cover
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height:  54,
                width: double.infinity,
                //color: Colors.pinkAccent,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: item.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,// center listview inside in container
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: current == index ? 64 : 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(item[index]),
                                fit: BoxFit.cover
                            ),
                           // color: current == index ? Colors.yellow : Colors.blue,
                          ),
                          child: Container(
                            color: current == index ? Colors.transparent : Colors.white70,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}




