import 'package:flutter/material.dart';

class AppsInAllApps {
  final String name;
  final IconData icon;

  AppsInAllApps(this.name, this.icon);
}

class DataHolder {
  String name;
  String number;
  DataHolder({required this.name, required this.number});

  factory DataHolder.formJson(Map<String, dynamic> json) => DataHolder(
        name: json["name"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {"name": name, "number": number};
}



//create a singleton




// class Singleton(){
//   static Singleton _instance;
//   static Singleton get instance{
//     if(_instance ==null){

//     }
//   }
// }