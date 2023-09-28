import 'package:dating_app/screens/auth/profile_page/component/interests.dart';
import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '';
import '../model/interests_model.dart';

class ContentProfile extends StatelessWidget {
  const ContentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildProfess(),
          SizedBox(height: 20,),
          _buildLocal(),
          SizedBox(height: 20,),
          _buildAbout(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Interests',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
            ],
          ),
          Container(
            height: 90,
            child: Expanded(child: GridView.builder(
              itemCount: interestprofile.length,
              //padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 40,
              ),
              itemBuilder:(context, index) {
                return InterestSelect(
                  name: interestprofile[index].name,
                  isSelect: interestprofile[index].isSelect,
                );
              },
            )),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gallery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text('See all', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: redColor),)
            ],
          ),
          Container(
            height: size.height * 0.3,
            child: Expanded(
              child: MasonryGridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(height: 200,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/human${index + 1}.jpg')),
                    ),
                  ),
              ),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  Widget _buildProfess(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jessica Parker, 23', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Text('Professional model', style: TextStyle(fontSize: 14, color: Colors.grey[700]),)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: borderColor,
              border: Border.all(
                color: borderColor,
                width: 2.0,
              )),
          child: IconButton(
            icon: const Icon(
              Icons.share,
              color: redColor,
              size: 20,
            ),
            color: redColor,
            onPressed: () {

            },
          ),
        )
      ],
    );
  }
  Widget _buildLocal(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Text('Chicago, IL United States', style: TextStyle(fontSize: 14, color: Colors.grey[700]),)
          ],
        ),
        Container(
          height: 34,
          width: 61,
          decoration: BoxDecoration(
              color: Color(0xffFDECEE),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.pin_drop_outlined, color: Colors.pinkAccent,),
              Text('1km', style: TextStyle(color: Colors.pinkAccent),),
            ],
          ),
        )
      ],
    );
  }
  Widget _buildAbout(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('About',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(width: 10,),
          ],
        ),
        Text('My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Read more', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: redColor),),
            const SizedBox(width: 10,),
          ],
        ),
      ],
    );
  }

}
