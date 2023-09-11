import 'package:flutter/material.dart';

class People{
  int id=UniqueKey().hashCode;
  String user;
  String password;
  bool state=true;

People({
  required this.user,
  required this.password,
});
}