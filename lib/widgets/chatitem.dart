import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/usermodel.dart';
import 'package:todoapp/screens/home/chatmessage.dart';

Widget ChatPart(UserModel model,context) => Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ChatScreenDetails(model: model,);
          }));
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(model.image),
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
