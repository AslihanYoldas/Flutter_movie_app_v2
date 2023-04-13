import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/cubit/home_feautures/home_view.dart';
import 'package:flutter_movieapi_v2/view/home_success_view.dart';


import 'cubit/search_feautures/search_view.dart';
import 'dependency_injection/locator.dart';

void main() {
  DependencyInjection();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()));
}

