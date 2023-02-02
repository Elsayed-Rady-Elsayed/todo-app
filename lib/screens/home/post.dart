import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/screens/home/home.dart';
import 'package:todoapp/screens/home/homeposts.dart';
class AddNewPost extends StatelessWidget {
TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginCupit(),
    child: BlocConsumer<LoginCupit,AppStatust>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
            title: Text('Add New Post',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
            actions: [
              TextButton(onPressed: (){
               if(LoginCupit.get(context).postimage !=null) {
                  LoginCupit.get(context).UplodePostWithImage(
                      ptext: controller.text,
                      pdate: DateTime.now().toString(),
                    );
                } else {
                  LoginCupit.get(context).uplodePost(
                    ptext: controller.text,
                    pdate: DateTime.now().toString(),
                  );
               }
              }, child: Text('Post',style: TextStyle(fontSize: 18),),)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      NetworkImage(LoginCupit.get(context).cashedimage),
                      radius: 30,
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LoginCupit.get(context).cashedName,style: Theme.of(context).textTheme.subtitle2,),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'what is on your mind ?',
                      hintStyle: TextStyle(fontSize: 17),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(LoginCupit.get(context).postimage!=null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Card(
                        child: Image(
                          height: 350,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image:FileImage(LoginCupit.get(context).postimage),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20,
                            child: Center(child: IconButton(onPressed: (){
                              LoginCupit.get(context).CloseTheImageInpost();
                            },
                              icon: Icon(Icons.close,color: Colors.white,size: 25,),))),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Icon(Icons.image,color: Colors.blue,),
                        TextButton(onPressed: (){
                          LoginCupit.get(context).getpostImage();
                        }, child: Text('Add Image')),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                    Expanded(child: TextButton(onPressed: (){}, child: Text('# tags'))),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
    );
  }
}
