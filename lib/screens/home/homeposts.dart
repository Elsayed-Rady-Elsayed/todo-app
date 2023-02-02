import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/widgets/buildpostitem.dart';

import '../../widgets/imageofhome.dart';
class PostsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCupit()..getPosts()..GetUserData(),
      child: BlocConsumer<LoginCupit,AppStatust>(
        listener: (context,state){},
        builder: (context,state){
          return LiquidPullToRefresh(
            color: Colors.blue,
            height: 150,
            onRefresh: ()async{
              await LoginCupit.get(context).getPosts();
            },
            child: ConditionalBuilder(
              condition: LoginCupit.get(context).posts.length>=0 && LoginCupit.get(context).posts.length!=0,
              builder: (context)=>SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ImageOfHome(context),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return BuildPostItem(LoginCupit.get(context).posts[index],index,context);
                          },
                          separatorBuilder: (context,index)=>const SizedBox(height: 1,), itemCount: LoginCupit.get(context).posts.length)
                    ],
                  ),
                ),
              fallback: (context)=>const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
