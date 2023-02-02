import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ImageOfHome(context)=>Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 10,
  margin: EdgeInsets.all(8),
  child: Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children:  [
      const Card(
        child: Image(
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://images.unsplash.com/photo-1579119159780-51419861f69f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('communicate with friends',style: Theme.of(context).textTheme.subtitle1,),
      )
    ],
  ),
);