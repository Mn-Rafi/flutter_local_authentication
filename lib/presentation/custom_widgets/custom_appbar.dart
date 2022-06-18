import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar customAppBar(String title) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
