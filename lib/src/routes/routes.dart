
import 'package:app_component/src/pages/alert_page.dart';
import 'package:app_component/src/pages/animatedContainer_page.dart';
import 'package:app_component/src/pages/avatar_page.dart';
import 'package:app_component/src/pages/cards_page.dart';
import 'package:app_component/src/pages/contador_page.dart';
import 'package:app_component/src/pages/home_page.dart';
import 'package:app_component/src/pages/inputs_page.dart';
import 'package:app_component/src/pages/list_page.dart';
import 'package:app_component/src/pages/moving_shape_page.dart';
import 'package:app_component/src/pages/perfil_page.dart';
import 'package:app_component/src/pages/slider_page.dart';
import 'package:app_component/src/pages/welcome_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationRoutes (){
  return <String, WidgetBuilder>{
    "/":(BuildContext context) => MyHomePage(title: ""),
    "contador":(BuildContext context) => const ContadorPage(),
    "alert":(BuildContext context)=>const AlertPage(),
    "avatar":(BuildContext context)=> const AvatarPage(),
    "card":(BuildContext context) => const CardsPage(),
    "animatedContainer":(BuildContext context) => const AnimatedcontainerPage(),
    "inputs":(BuildContext context) => const InputsPage(),
    "list":(BuildContext context) => const ListPage(),
    "slider": (BuildContext context) => const SliderPage(),
    "perfil": (BuildContext context) => const PerfilPage(),
    "welcome": (BuildContext context) => const WelcomePage(),
    "movingShape": (BuildContext context) => const MovingShapePage()

  };
}