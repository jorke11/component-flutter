
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/animated_container.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/listview_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
        '/': (context)=>HomePage(),
        'alert': (context)=>AlertPage(),
        'avatar': (context)=>AvatarPage(),
        'card':(context)=>CardPage(),
        'animatedContainer':(context)=>AnimatedContainerPage(),
        'inputs':(context)=>InputPage(),
        'slider':(context)=>SliderPage(),
        'list':(context)=>ListviewPage(),

      };
}
