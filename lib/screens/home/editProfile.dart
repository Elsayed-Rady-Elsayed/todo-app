import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/login_cubit.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/widgets/buttomwidget.dart';
import 'package:todoapp/widgets/textformfieldwidget.dart';
class EditProfileScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context)=>LoginCupit()..GetUserData(),
          child: BlocConsumer<LoginCupit,AppStatust>(
            listener: (context,state){},
            builder: (context,state){
              nameController.text = LoginCupit.get(context).username;
              bioController.text = LoginCupit.get(context).bio;
              phoneController.text = LoginCupit.get(context).phone;
              return state is AppLoadinggetuserstate? Center(child: CircularProgressIndicator(),) :
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){

                      LoginCupit.get(context).UPDateUserData(
                        context,
                        newname: nameController.text,
                        newbio: bioController.text,
                        phone: phoneController.text,
                        // cover: ,
                        // profile: ,
                      );
                    }, child: Text('UPDATE')),
                    SizedBox(height: 5,),
                    Container(
                      height: 230,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Card(
                                  child: Image(
                                    height: 170,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    image:LoginCupit.get(context).profileimage == null? NetworkImage(LoginCupit.get(context).user.cover):
                                    FileImage(LoginCupit.get(context).profileimage),
                                  ),
                                ),
                                CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 20,
                                    child: Center(child: IconButton(onPressed: (){
                                      LoginCupit.get(context).getProfileImage();
                                    },
                                      icon: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 25,),))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 55,
                                  backgroundImage:LoginCupit.get(context).coverimage==null?NetworkImage(LoginCupit.get(context).user.image):
                                  FileImage(LoginCupit.get(context).coverimage),
                                ),
                                CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 20,
                                    child: Center(
                                      child: IconButton(icon:Icon(Icons.camera_alt_outlined,color: Colors.white,size: 20,),onPressed: (){
                                        LoginCupit.get(context).getcopverImage();
                                      },),
                                    )),
                              ],
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
                                    Text(LoginCupit.get(context).user.name,style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 18),),
                                    Text(LoginCupit.get(context).user.bio,style: Theme.of(context).textTheme.caption,),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if(LoginCupit.get(context).profileimage!=null||LoginCupit.get(context).coverimage!=null)
                        Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          if(LoginCupit.get(context).profileimage!=null)
                              Expanded(child: CustomButtom(context,title: 'update cover',press: (){

                                LoginCupit.get(context).UplodeProfileImage(
                                  context,
                                  phone: phoneController.text,
                                  newname: nameController.text,
                                  newbio: bioController.text,
                                );
                                LoginCupit.get(context).GetUserData();
                              })),
                          SizedBox(width: 6,),
                          if(LoginCupit.get(context).coverimage!=null)
                          Expanded(child: CustomButtom(context,title: 'update profile',press: (){
                            LoginCupit.get(context).UplodeCovermage(
                              context,
                              phone: phoneController.text,
                              newname: nameController.text,
                              newbio: bioController.text,
                            );
                            LoginCupit.get(context).GetUserData();
                          })),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          CustomTesxtFromField(
                            context,
                            controller: nameController,
                            label: 'name',
                            obsecure: false,
                            PrefixIcon: Icons.drive_file_rename_outline,
                            TextInputtype: TextInputType.name,
                          ),
                          SizedBox(height: 15,),
                          CustomTesxtFromField(
                            context,
                            controller: bioController,
                            label: 'Bio',
                            obsecure: false,
                            PrefixIcon: Icons.workspaces_outline,
                            TextInputtype: TextInputType.name,
                          ),
                          SizedBox(height: 15,),
                          CustomTesxtFromField(
                            context,
                            controller: phoneController,
                            label: 'phone',
                            obsecure: false,
                            PrefixIcon: Icons.phone,
                            TextInputtype: TextInputType.phone,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

