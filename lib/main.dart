import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:machinetestlive/controller/video_controller.dart';
import 'package:machinetestlive/view/videolist.dart';
import 'package:machinetestlive/view/mainpage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     

        primarySwatch: Colors.blue,
      ),
      home:  Mainpage()
    );
  }
}

