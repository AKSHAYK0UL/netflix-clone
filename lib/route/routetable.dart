import 'package:flutter/material.dart';
import 'package:netflix/ui/detail/screens/detailscreen.dart';
import 'package:netflix/ui/home/screens/showall.dart';

Map<String, WidgetBuilder> routes = {
  ShowAll.routeName: (context) => const ShowAll(),
  DetailScreen.routeName: (context) => const DetailScreen(),
};
