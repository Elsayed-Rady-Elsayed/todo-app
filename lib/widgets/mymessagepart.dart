import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/messagmodel.dart';

Widget mymessage(MessageModel model)=> Align(
  alignment: AlignmentDirectional.topEnd,
  child: Container(
    decoration: BoxDecoration(
      color: Colors.blue[400],
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(model.text,style: TextStyle(fontWeight: FontWeight.w600),),
    ),
  ),
);
