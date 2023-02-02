import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomButtom(context,{ String title,var press}) => MaterialButton(
      onPressed: press,
      height: 45,
      color: Colors.blue,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      minWidth: MediaQuery.of(context).size.width,
    );
