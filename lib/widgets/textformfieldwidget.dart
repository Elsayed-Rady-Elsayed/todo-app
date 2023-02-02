import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget CustomTesxtFromField(context,{
    TextEditingController controller, String label,
  IconData SufixIcon,bool obsecure = false, TextInputType TextInputtype,
   IconData PrefixIcon,var sufixpress
})=> TextFormField(
  controller: controller,
  obscureText: obsecure,
  keyboardType: TextInputtype,
  validator: (value){
    if(value.isEmpty) {
      return 'enter your $label';
    }
  },
  style: const TextStyle(
    color: Colors.black,
    fontSize: 20,
  ),
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.circular(10),
    ),
    label: Text(label),
    prefixIcon: Icon(PrefixIcon),
    hintText: 'enter your $label',
    contentPadding: EdgeInsets.all(25),
    suffixIcon: IconButton(icon: Icon(SufixIcon),onPressed:sufixpress,),
  ),
);