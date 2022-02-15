import 'dart:convert';
import 'package:app/screens/crud_content/add_category.dart';
import 'package:app/screens/crud_content/add_subcategory.dart';
import 'package:app/screens/crud_content/detail_content.dart';
import 'package:app/screens/signup_teacher_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/details_screen.dart';
import './screens/login_student_screen.dart';
import './screens/login_teacher_screen.dart';
import './screens/signup_student_screen.dart';
import './screens/getting_started.dart';
import './screens/access_code.dart';
import 'package:http/http.dart' as http;



void main() =>runApp(const MyApp());

String id= '';
String email= '';
String name= '';
String categoria= '';
String descripcion= '';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/' ,
      home: GettingStarted(),
      // home: LoginPage(),
      routes: {
        // HomeScreen.route: (BuildContext context)=> new HomeScreen(username: LoginScreen.username,),
        HomeScreen.route : (BuildContext context) => HomeScreen(id:id,email:email,name: name),
        DetailsScreen.route:(BuildContext context) => DetailsScreen(email:email,name: name),
        LoginScreenStudent.routeName:(_) => LoginPageStudent(),
        LoginScreenTeacher.routeName:(_) => LoginPageTeacher(),
        SignupScreenStudent.routeName:(_) => SignupPageStudent(),
        SignupScreenTeacher.routeName:(_) => SignupPageTeacher(),
        AccessCode.routeName:(BuildContext context) => AccessCode(id: id,email:email,name: name),
        AddCategory.routeName:(BuildContext context) => AddCategory(id: id),
        AddSubCategory.routeName:(BuildContext context) => AddCategory(id: id),
        DetailContent.route:(BuildContext context) => DetailContent(id: id,name: name,email: email,categoria: categoria,descripcion: descripcion),



      },
    );
  }
}


