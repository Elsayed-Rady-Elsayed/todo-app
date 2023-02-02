import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/models/usermodel.dart';
class profilescreen extends StatelessWidget {
UserModel model;

profilescreen({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context)=>LoginCupit()..GetUserData()..GetAllUsers()..getPosts(),
          child: BlocConsumer<LoginCupit,AppStatust>(
            listener: (context,state){},
            builder: (context,state){
              return state is AppLoadinggetuserstate? Center(child: CircularProgressIndicator(),) :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 230,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Card(
                            child: Image(
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: NetworkImage(model.cover),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 55,
                              backgroundImage: NetworkImage(model.image)
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 130,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 90),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(model.name,style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 18),),
                                  Text(model.bio,style: Theme.of(context).textTheme.caption,),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child:
                      Column(children:  [
                        Text('${LoginCupit.get(context).myPosts.length}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                        Text('Posts',style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                      ],
                      )
                      ),
                      Expanded(child:
                      Column(children: [
                        Text('${LoginCupit.get(context).myPosts.length}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                        const Text('Likes',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                      ],
                      )
                      ),
                      Expanded(child:
                      Column(children:  [
                        Text('${LoginCupit.get(context).users.length}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                        const Text('Followers',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                      ],
                      )
                      ),
                      Expanded(child:
                      Column(children:  [
                        Text('${LoginCupit.get(context).users.length}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                        const Text('Friends',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                      ],
                      )
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
