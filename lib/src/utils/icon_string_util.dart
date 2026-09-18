import 'package:flutter/material.dart';

final Map<String, dynamic> _icons ={
  "add_alert":Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open":Icons.folder_open,
  "count": Icons.countertops_rounded,
  "donut_large":Icons.donut_large,
  "input": Icons.input,
  "tune": Icons.tune,
  "list": Icons.list,
  "person": Icons.person,
  "gradient": Icons.gradient,
  "open_with": Icons.open_with
};


Icon getIcon(String icon){
  return Icon(_icons[icon],color: Colors.lightBlueAccent);
}