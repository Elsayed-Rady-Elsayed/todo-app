import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/cashhelper.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/screens/auth/register.dart';
import 'package:todoapp/screens/home/home.dart';
import 'package:todoapp/widgets/textformfieldwidget.dart';
import 'package:todoapp/widgets/toastmessage.dart';

import '../../widgets/buttomwidget.dart';
class LoginScreen extends StatelessWidget {

  GlobalKey<FormState>formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCupit(),
      child: BlocConsumer<LoginCupit,AppStatust>(
        listener: (context,state){
          if(state is ApperrorLoginstate){
            CustomToast(message: 'you enterd wrong data please check it again');
          }
          else if(state is AppsucessLoginstate)
            {
              CachHelper.savedata(key: 'login',value: state.uid).then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return home();
                }));
              });
            }

        },
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login to your account',
                        style: Theme.of(context).textTheme.headline1,),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTesxtFromField(
                         context,
                          controller: emailcontroller,
                          label: 'email',
                          TextInputtype: TextInputType.emailAddress,
                          PrefixIcon: Icons.email),
                      const SizedBox(height: 17,),
                      CustomTesxtFromField(
                        context,
                        obsecure: LoginCupit.get(context).Obsecure,
                        sufixpress:(){
                          LoginCupit.get(context).Obsecurepassword();
                        },
                        controller: passwordcontroller,
                        label: 'password',
                        TextInputtype: TextInputType.text,
                        PrefixIcon: Icons.lock,
                        SufixIcon:Icons.visibility,
                      ),
                      const SizedBox(height: 25,),
                      CustomButtom(context, title: 'Login', press: (){
                        if(formkey.currentState.validate())
                        {
                          LoginCupit.get(context).LoginMethod(email: emailcontroller.text, password: passwordcontroller.text);
                        }
                      }),
                      const SizedBox(height: 25,),
                      Center(
                        child: RichText(text: TextSpan(
                          text: 'dont have an account?',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context){
                                   return RegisterScreen();
                                }));
                                }
                                )
                          ]
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
