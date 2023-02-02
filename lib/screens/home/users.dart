import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/widgets/chatitem.dart';
import 'package:todoapp/widgets/followuseritem.dart';
class UsersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginCupit()..GetAllUsers(),
      child: BlocConsumer<LoginCupit,AppStatust>(
        listener: (context, state){},
        builder: (context, state){
          return ListView.separated(itemBuilder: (context,index){
            useruid = LoginCupit.get(context).users[index].uid;
            return Row(
              children: [
                followuseritem(LoginCupit.get(context).users[index],context),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: RaisedButton(onPressed: (){

                  },color: Colors.blue,child: const Text('Follow',style: TextStyle(color: Colors.white),),),
                )
              ],
            );
          },
              separatorBuilder: (context,index)=>SizedBox(height: 5,),
              itemCount: LoginCupit.get(context).users.length);//LoginCupit.get(context).users.length);
        },
      ),
    );
  }
}
