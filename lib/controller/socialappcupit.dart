// class EditProfileScreen extends StatefulWidget {
//
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           titleSpacing: 0,leadingWidth: 10,
//           title: const Text('edit profile',style: TextStyle(color: Colors.black),),
//           actions: [
//             IconButton(onPressed: (){
//               setState(() {
//                 EditProfileScreen();
//               });
//             }, icon: Icon(Icons.camera,color: Colors.black,)),
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: Center(child: TextButton(onPressed: (){},child: const Text('UPDATE'),)),
//             )
//           ],
//         ),
//         body: BlocProvider(
//           create: (context)=>LoginCupit()..GetUserData(),
//           child: BlocConsumer<LoginCupit,AppStatust>(
//             listener: (context,state){},
//             builder: (context,state){
//               nameController.text = LoginCupit.get(context).user.name;
//               bioController.text = LoginCupit.get(context).user.bio;
//               return  state is Appsucessgetuserstate? Center(child: CircularProgressIndicator(),) :
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 230,
//                     child: Stack(
//                       alignment: AlignmentDirectional.bottomStart,
//                       children: [
//                         Align(
//                           alignment: AlignmentDirectional.topCenter,
//                           child: Stack(
//                             alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Card(
//                                 child: Image(
//                                   height: 170,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                   image:LoginCupit.get(context).profileimage == null? NetworkImage(LoginCupit.get(context).user.cover):
//                                   FileImage(LoginCupit.get(context).profileimage),
//                                 ),
//                               ),
//                               CircleAvatar(
//                                   backgroundColor: Colors.blue,
//                                   radius: 20,
//                                   child: Center(child: IconButton(onPressed: (){
//                                     LoginCupit.get(context).getProfileImage();
//                                   },
//                                     icon: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 25,),))),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Stack(
//                             alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 55,
//                                 backgroundImage:LoginCupit.get(context).coverimage==null?NetworkImage(LoginCupit.get(context).user.image):
//                                 FileImage(LoginCupit.get(context).coverimage),
//                               ),
//                               CircleAvatar(
//                                   backgroundColor: Colors.blue,
//                                   radius: 20,
//                                   child: Center(
//                                     child: IconButton(icon:Icon(Icons.camera_alt_outlined,color: Colors.white,size: 20,),onPressed: (){
//                                       LoginCupit.get(context).getcopverImage();
//                                     },),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           left: 130,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 90),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(LoginCupit.get(context).user.name,style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 18),),
//                                   Text(LoginCupit.get(context).user.bio,style: Theme.of(context).textTheme.caption,),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: [
//                         CustomTesxtFromField(
//                           context,
//                           controller: nameController,
//                           label: 'name',
//                           obsecure: false,
//                           PrefixIcon: Icons.drive_file_rename_outline,
//                           TextInputtype: TextInputType.name,
//                         ),
//                         SizedBox(height: 15,),
//                         CustomTesxtFromField(
//                           context,
//                           controller: bioController,
//                           label: 'Bio',
//                           obsecure: false,
//                           PrefixIcon: Icons.workspaces_outline,
//                           TextInputtype: TextInputType.name,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
