import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/widgets/chatitem.dart';
class ChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginCupit()..GetAllUsers(),
    child: BlocConsumer<LoginCupit,AppStatust>(
      listener: (context, state){},
      builder: (context, state){
        return ListView.separated(itemBuilder: (context,index){
          useruid = LoginCupit.get(context).users[index].uid;
          return  ChatPart(LoginCupit.get(context).users[index],context);
        },
            separatorBuilder: (context,index)=>SizedBox(height: 5,),
            itemCount: LoginCupit.get(context).users.length);//LoginCupit.get(context).users.length);
      },
    ),
    );
  }
}
