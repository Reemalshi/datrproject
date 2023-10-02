import 'package:flutter/material.dart';

class DetealsModle {
  String? email;
  String? password;
  String?name;
  String? phone;

  DetealsModle({ this.email, this.name, this.password, this.phone});


  Map<String, dynamic> toMap(){
  return {
 "email": email,
 "password": password,
 "name":name,
 "phone": phone,
  };
}
}
