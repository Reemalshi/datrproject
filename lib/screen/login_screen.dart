// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_22/modle/deteals_modle.dart';
// import 'package:flutter_application_22/screen/home_screen.dart';
// import 'package:flutter_application_22/screen/regester_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final scaffoldKey = new GlobalKey<ScaffoldState>();
//   final formKey = new GlobalKey<FormState>();

//   late String _email,_pass;
//  @override
//   void initState() {
//     _showSnackbar();
//     super.initState();
//   }
//   _showSnackbar() {
//     var snackBar = new SnackBar(content: Text("Login Successful"));

//     // scaffoldKey.currentState!._showSnackbar(snackBar);
//   }
//   // var emailController = TextEditingController();
//   // var passwordcontroller = TextEditingController();
//   // SharedPreferences? prefs;

//   // @override
//   // void initState() {
//   //   _getData();
//   //   super.initState();
//   // }
//   // _getData()async{
//   //   prefs = await SharedPreferences.getInstance();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           key: scaffoldKey,
 
//         title: const Text("Log In page"),
//       ),
//        body: Center(
//         key: formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//           Container(
//               margin: const EdgeInsets.all(20),
//               child: TextFormField(
//                  validator: (val) => val!.contains("@") ? "Email Id is not Valid" : null ,
//               onSaved: (val) => _email = val!,
//                 // controller: emailController,
//                 decoration: const InputDecoration(labelText: "email"),
//               ),


//             ),
//             Container(
//               margin: const EdgeInsets.all(20),
//               child: TextFormField(
//                 onSaved: (val) => _pass = val!,
//               validator: (val) => val!.length < 6  ? "Password length should be Greater than 6" : null ,
//                 // controller: passwordcontroller,
//                 decoration: const InputDecoration(labelText: "password"),
//               ),

//             ),
       
//             MaterialButton(onPressed: () {
//               if(formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                      _showSnackbar();
//               }
              
//               //  DetealsModle deteals = DetealsModle(
//               //       email: emailController.text,
//               //       password: passwordcontroller.text,
//               //     );
//                   //  if (prefs!.containsKey(emailController.text)){
//                   //   ScaffoldMessenger.of(context).showSnackBar(
//                   //     const SnackBar(content: Text("Email is exist")));
//                   // } else {
//                   //   prefs! 
//                   //   .setString(emailController.text, jsonDecode(deteals._getData)))
//                   //   .then((value) {
//                   //     Navigator.pop(context);
//                   //   });
//                   // }
//               Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
              
//             },  child: Text("Login"),
//             ),
//             MaterialButton(onPressed: () { 
//               Navigator.push(context,MaterialPageRoute(builder: (context) => RegesterScreen(),));
//             },  child: Text("Regester"),
//             ),
//             ],
           
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_22/screen/home_screen.dart';
import 'package:flutter_application_22/screen/regester_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  late String _email, _pass;

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login Successful"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In page"),
      ),
      body: Center(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (val) =>
                    val!.contains("@") ? "Email Id is not Valid" : null,
                onSaved: (val) => _email = val!,
                decoration: const InputDecoration(labelText: "email"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                onSaved: (val) => _pass = val!,
                validator: (val) =>
                    val!.length < 6 ? "Password length should be at least 6" : null,
                decoration: const InputDecoration(labelText: "password"),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  _showSnackbar();
                }

                // DetealsModle deteals = DetealsModle(
                //   email: emailController.text,
                //   password: passwordcontroller.text,
                // );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
              },
              child: Text("Login"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegesterScreen()),
                );
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
