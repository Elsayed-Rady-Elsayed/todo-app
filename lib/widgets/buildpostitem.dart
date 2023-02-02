import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/postmodel.dart';
Widget BuildPostItem(PostModel model,index,context)=>Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 10,
  margin: EdgeInsets.all(8),
  child: Padding(
    padding:EdgeInsets.all(7.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('${model.image}'),
              radius: 30,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${model.name}',style: Theme.of(context).textTheme.subtitle2,),
                      SizedBox(width: 5,),
                      Icon(Icons.check_circle,color: Colors.blue,size: 15,)
                    ],
                  ),
                  Text('${model.PostDate}',style: Theme.of(context).textTheme.caption,),
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        Text(''
            '${model.PostText}',style:Theme.of(context).textTheme.bodyText1,),
        SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: [
              Container(
                height: 20,
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  minWidth: 1,
                  child: Text('#flutter',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue),),
                ),
              ),
              Container(
                height: 20,
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  minWidth: 1,
                  child: Text('#flutter',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue),),
                ),
              ),
              Container(
                height: 20,
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  minWidth: 1,
                  child: Text('#flutter',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue),),
                ),
              ),
              Container(
                height: 20,
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  minWidth: 1,
                  child: Text('#flutter',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue),),
                ),
              ),
            ],
          ),
        ),
        if(model.Postimage!='')
          Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    '${model.Postimage}'),
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.star_rate_outlined,color: Colors.red,size: 20,),
                      Text('${LoginCupit.get(context).likes[index]}',style: Theme.of(context).textTheme.caption.copyWith(fontSize: 15,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.comment,color: Colors.amber,size: 20,),
                      Text('0',style: Theme.of(context).textTheme.caption,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('${model.image}'),
                        radius: 18,
                      ),
                      SizedBox(width: 10,),
                      Text('write a comment..........',style: Theme.of(context).textTheme.caption.copyWith(fontSize: 15),)
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              InkWell(
                onTap: (){
                  LoginCupit.get(context).LikePost(LoginCupit.get(context).postsid[index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star_border,color: Colors.red,size: 20,),
                    SizedBox(width: 5,),
                    Text('Like',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);