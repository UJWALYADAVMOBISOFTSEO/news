import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Source{
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(id: json["id"], name: json["name"]);
  }
}