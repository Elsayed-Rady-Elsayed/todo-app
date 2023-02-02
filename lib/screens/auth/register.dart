
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/screens/auth/login.dart';
import 'package:todoapp/screens/home/home.dart';
import 'package:todoapp/widgets/buttomwidget.dart';
import 'package:todoapp/widgets/textformfieldwidget.dart';
import 'package:todoapp/widgets/toastmessage.dart';
class RegisterScreen extends StatelessWidget {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  GlobalKey<FormState>formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCupit(),
      child: BlocConsumer<LoginCupit,AppStatust>(
        listener: (context,state){
          if(state is Appsucesscreateuserstate){
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){
              return LoginScreen();
            }), (route) => false);
          }
          else if(state is Apperrorcreateuserstate)
          {
            CustomToast(message: 'you enterd wrong data please check it again');
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Register and have fun with us in this community!',
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
                      const SizedBox(height: 17,),
                      CustomTesxtFromField(
                          context,
                          controller: namecontroller,
                          label: 'name',
                          TextInputtype: TextInputType.name,
                          PrefixIcon: Icons.person),
                      const SizedBox(height: 17,),
                      CustomTesxtFromField(
                        context,
                          controller: phonecontroller,
                          label: 'phone',
                          TextInputtype: TextInputType.phone,
                          PrefixIcon: Icons.phone),
                      const SizedBox(height: 25,),
                      CustomButtom(context, title: 'Resgister', press: (){
                        if(formkey.currentState.validate())
                        {
                          LoginCupit.get(context).Register(email: emailcontroller.text, password: passwordcontroller.text,
                              name: namecontroller.text, phone: phonecontroller.text);
                        }
                      })
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
