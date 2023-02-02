import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/screens/home/post.dart';
import 'settings.dart';
LoginCupit l = LoginCupit();
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context)=>LoginCupit(),
        child: BlocConsumer<LoginCupit,AppStatust>(
          listener: (context,state){
            if(state is AppGoToAddPostScreenState)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AddNewPost();
                }));
              }
          },
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(LoginCupit.get(context).titles[LoginCupit.get(context).CurrentIndex],style: Theme.of(context).textTheme.headline1,),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: Colors.black,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,)),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: LoginCupit.get(context).CurrentIndex,
                onTap: (value){
                  LoginCupit.get(context).ChangeCurrentIndex(value);
                },
                items: const[
                  BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 28,),label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline,size: 28,),label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.post_add,size: 28,),label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp,size: 28,),label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person,size: 28,),label: ''),
                ],
              ),
              body: LoginCupit.get(context).Screens[LoginCupit.get(context).CurrentIndex],
            );
          },
        )
      ),
    );
  }
}
