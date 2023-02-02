import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/models/usermodel.dart';
import 'package:todoapp/widgets/messagepartoffriend.dart';
import 'package:todoapp/widgets/mymessagepart.dart';
class ChatScreenDetails extends StatelessWidget {
UserModel model;

ChatScreenDetails({this.model});
var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      LoginCupit.get(context).GetMessages(resiverid: model.uid);
      return SafeArea(
          child: BlocConsumer<LoginCupit,AppStatust>(
            listener: (context,state){},
            builder: (context,state){
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back,color: Colors.black,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  leadingWidth: 40,
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(model.image),
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                body: ConditionalBuilder(
                  condition: LoginCupit.get(context).messages.length>=0,
                  builder: (context)=>Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.only(bottom: 10),
                              physics:BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                            var message = LoginCupit.get(context).messages[index];
                            if(uid==message.senderid) {
                              return mymessage(message);
                            } else {
                              return frienmessage(message);
                            }
                          },
                              separatorBuilder: (context,state)=>SizedBox(height: 5,),
                              itemCount: LoginCupit.get(context).messages.length),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 15,height: 10,),
                              Expanded(
                                child: TextFormField(
                                  controller: controller,
                                  style: TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'type your message',
                                      hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)
                                  ),
                                ),
                              ),
                              Container(
                               // margin: EdgeInsets.all(3),
                                color: Colors.blue,
                                child: IconButton(onPressed: (){
                                  print(controller.text);
                                  LoginCupit.get(context).SendMessage(
                                    mytext: controller.text,
                                    datetime: DateTime.now().toString(),
                                    resiverid: model.uid,
                                  );
                                  controller.text='';
                                },
                                    icon: Icon(Icons.send,color: Colors.white,)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator(),),
                )
              );
            },
          )
      );
    });
  }
}
