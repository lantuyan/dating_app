import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/helper/dialog.dart';
import 'package:dating_app/models/chat_users.dart';
import 'package:dating_app/navigation/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../apis/api.dart';


class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  String? _img;
  final ChatUsers _users = APIs.me;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      //for hiding keyboard
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(0, 96),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 40, top: 40),
              child: AppBar(
                backgroundColor: Colors.transparent,
                scrolledUnderElevation: 0,
                title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              ),
            ),
          ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.redAccent,
            onPressed: () async{
              //for showing progress dialog
              Dialogs.showProgressBar(context);

              await APIs.updateActiveStatus(false);

              //sign out from app
              await APIs.auth.signOut().then((value)async{
                await GoogleSignIn().signOut().then((value){
                  // for hiding progress dialog
                  Navigator.pop(context);

                  // //for removing to home
                  // Navigator.pop(context);

                  APIs.auth = FirebaseAuth.instance;
                  context.pushReplacement(NavigationPath.onboardingScreen);
                });
              });

            },
            icon: const Icon(Icons.logout),
            label: Text('Logout'),
          ),
        ),

        body: Form(
          key: _formKey,
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: size.width * .05),
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .03,
                        width: size.width,
                      ) ,
                      Stack(
                        children: [
                          _img != null
                              ?
                          //local image
                          ClipRRect(
                              borderRadius: BorderRadius.circular(size.height * .1),
                              child: Image.file(File(_img!),
                                width: size.height * .2,
                                height: size.height * .2,
                                fit: BoxFit.cover,
                              ))
                              :
                          //image from server
                          ClipRRect(
                            borderRadius: BorderRadius.circular(size.height * .1),
                            child: CachedNetworkImage(
                              width: size.height * .2,
                              height: size.height * .2,
                              imageUrl: _users.image,
                              fit: BoxFit.cover,
                              // placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person)),
                            ),
                          ),


                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: MaterialButton(
                              elevation: 1,
                              onPressed: (){
                                _showBottomSheet();
                              },
                              child: const Icon(Icons.edit, color: Colors.blue,),
                              color: Colors.white,
                              shape: const CircleBorder(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * .03,),

                      Text(_users.email, style: TextStyle(color: Colors.black54, fontSize: 16),),
                      SizedBox(height: size.height * .05,),
                      //name input field
                      TextFormField(
                        initialValue: _users.name,
                        onSaved: (val) => APIs.me.name = val ?? '',
                        validator: (val) => val != null && val.isNotEmpty ? null : 'Required Field',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.blue,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          hintText: 'eg. Happy Signh',
                          label:Text("Name"),

                        ),
                      ),

                      SizedBox(height: size.height * .02,),
                      //for input about
                      TextFormField(
                        initialValue: _users.about,
                        onSaved: (val) => APIs.me.about = val ?? '',
                        validator: (val) => val != null && val.isNotEmpty ? null : 'Required Field',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.info_outline, color: Colors.blue,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          hintText: 'eg. Feeling Happy',
                          label:Text("About"),

                        ),
                      ),
                      TextFormField(
                        initialValue: _users.age,
                        onSaved: (val) => APIs.me.age = val ?? '',
                        validator: (val) => val != null && val.isNotEmpty ? null : 'Required Field',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.blue,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          hintText: 'eg. Feeling Happy',
                          label:Text("Age"),

                        ),
                      ),
                      SizedBox(height: size.height * .02,),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(shape: StadiumBorder(), maximumSize: Size(size.width * .5, size.height* .06 )),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            APIs.updateUserInfo().then((value){
                              //Dialogs.showSnackbar(context, 'Profile update Successfully');
                            });
                          }
                        },
                        icon: Icon(Icons.edit, size: 28,),
                        label: Text('Update',style: TextStyle(fontSize: 16),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// bottom sheet for picking a profile picture for user
  void _showBottomSheet(){
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
        )),
        builder: (_){
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: size.height * .03, bottom: size.height * .05),
            children: [
              Text("Pick Profile Picture",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * .02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: Size(size.width * .3, size.height * .15)
                      ),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
                        if(image !=null){
                          print('Image Path: ${image.path} -- MineType: ${image.mimeType}');
                          setState(() {
                            _img = image.path;
                          });

                          APIs.updateProfilePicture(File(_img!));

                          //for hiding bottom sheet
                          Navigator.pop(context);
                        }

                      },
                      child: Image.asset("assets/images/add_image.png")
                  ),
                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: Size(size.width * .3, size.height * .15)
                      ),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
                        if(image !=null){
                          print('Image Path: ${image.path}');
                          setState(() {
                            _img = image.path;
                          });
                          APIs.updateProfilePicture(File(_img!));

                          //for hiding bottom sheet
                          Navigator.pop(context);
                        }
                      },
                      child: Image.asset("assets/images/camera.png")
                  )
                ],
              )
            ],
          );
        });
  }
}