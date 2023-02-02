import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/messagmodel.dart';

Widget frienmessage(MessageModel model)=>Align(
  alignment: AlignmentDirectional.topStart,
  child: Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(20),
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Text(model.text,style: TextStyle(fontWeight: FontWeight.w600),),
    ),
  ),
);