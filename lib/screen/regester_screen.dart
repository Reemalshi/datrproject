import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_22/modle/deteals_modle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  var emailController = TextEditingController();
  var passwordcontroller = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  SharedPreferences? prefs;
  @override
  void initState() {
    _getData();
    super.initState();
  }
  _getData()async{
    prefs = await SharedPreferences.getInstance();
  }
  File? image;
  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("regester page"),
      ),
       body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            image == null
            ? InkWell(
              onTap: () async {
                final XFile? file = 
                await picker.pickImage(source: ImageSource.gallery);
                image = File(file!.path);
                setState(() {
                  
                });
              },
              child: Container(
                width:150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(75),

                ),
                child: const Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
              ),
            )
            : CircleAvatar(
              radius: 75,
              backgroundImage: FileImage(image!),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "email"),
              ),


            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(labelText: "password"),
              ),

            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "name"),
              ),


            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "phone"),
              ),


            ),
                       
            // SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () async {
                DetealsModle deteals = DetealsModle(
                    email: emailController.text,
                    password: passwordcontroller.text,
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                  if (prefs!.containsKey(emailController.text)){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Email is exist")));
                  } else {
                    prefs! 
                    .setString(emailController.text, jsonEncode(deteals.toMap()))
                    .then((value) {
                      Navigator.pop(context);
                    });
                  }
              },
              child: Text("regester"),
            ),
          ],
        ),
      ),
    );
  }
}
//  ListView.builder(itemBuilder: (context, index) {
        
      //    SizedBox(height: 5.0, width: 5.5,);
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: TextField(
      //           controller: emailController,
      //           decoration: InputDecoration(
      //             hintText: "Enter your email",
                  
      //           ),
      //         ),
      //       );
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: TextField(
      //           controller: passwordcontroller,
      //           decoration: InputDecoration(
      //             hintText: "Enter your password",
      //           ),
      //           obscureText: true,
      //         ),
      //       );
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: TextField(
      //           controller: nameController,
      //           decoration: InputDecoration(
      //             hintText: "Enter your name",
      //           ),
      //           obscureText: true,
      //         ),
      //       );
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: TextField(
      //           controller: phoneController,
      //           decoration: InputDecoration(
      //             hintText: "Enter your phone",
      //             // label: "phone",
      //           ),
      //           obscureText: true,
      //         ),
      //       );
      //       SizedBox(height: 20.0);
      //       MaterialButton(
      //         onPressed: () async {
      //             // SharedPreferences prefs = await SharedPreferences.getInstance();
      //             // DetealsModle deteals = DetealsModle(
      //             //   email: emailController.text,
      //             //   password: passwordcontroller.text,
      //             //   name: nameController.text,
      //             //   phone: phoneController.text,


      //             // );
                  
              
      //              },
      //         child: Text("regester"),
      //       );
         
      //  },)
       


// List<DetealsModle> deteals = [
    // DetealsModle(
    //   email: "reemalshihhi1@gmail.com",
    //   password: "12253",
    //   name: "reem",
    //   phone: 12345678
    // ),
    //  DetealsModle(
    //   email: "reemalshihhi1@gmail.com",
    //   password: "12253",
    //   name: "reem",
    //   phone: 12345678
    // ),
    //  DetealsModle(
    //   email: "reemalshihhi1@gmail.com",
    //   password: "12253",
    //   name: "reem",
    //   phone: 12345678
    // ),
    // ];

      //  return prefs.toString(
              //       SharedPreferences,jsonEncode({
              //         "email",
              //         "password",
              //         "name",
              //         "phone",
              // }) );
                  // prefs.toString("email", emailController.text);
                  //  prefs.getString('password', passwordcontroller.text);
                  //  prefs.setString('name', nameController.text);
                  //  prefs.setString('phone', phoneController.text);