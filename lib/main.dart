import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/cashhelper.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/controller/socialappcupit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/screens/auth/login.dart';
import 'package:todoapp/screens/auth/register.dart';
import 'package:todoapp/screens/home/home.dart';
var uid;String useruid;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token =await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.onMessage.listen((event){

  });
  FirebaseMessaging.onMessageOpenedApp.listen((event){

  });
  await CachHelper.init();
  Widget startonde;
  uid = CachHelper.getdata(key: 'login');
  if(uid!=null){
    startonde = home();
  }
  else{
    startonde = LoginScreen();
  }
  runApp(MyApp(startWidget:startonde));
}
class MyApp extends StatelessWidget {
  var startWidget;

  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCupit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            elevation: 20,
          ),
          textTheme: const TextTheme(
            subtitle1: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
            subtitle2: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
            bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.3
            ),
            headline1: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home: startWidget,
      ),
    );
  }
}


