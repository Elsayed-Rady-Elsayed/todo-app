import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/controller/cashhelper.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/appstatus.dart';
import 'package:todoapp/models/messagmodel.dart';
import 'package:todoapp/models/postmodel.dart';
import 'package:todoapp/models/usermodel.dart';
import 'package:todoapp/screens/home/home.dart';
import '../main.dart';
import '../screens/home/chats.dart';
import '../screens/home/homeposts.dart';
import '../screens/home/post.dart';
import '../screens/home/settings.dart';
import '../screens/home/users.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LoginCupit extends Cubit<AppStatust> {
  LoginCupit() : super(AppInitalState());

  static LoginCupit get(context) => BlocProvider.of(context);

  bool Obsecure = true;

  void Obsecurepassword() {
    Obsecure = !Obsecure;
    emit(AppObsecurestate());
  }

  void Register({
    String email,
    String password,
    String name,
    String phone,
  }) {
    emit(AppLoadingRegisterstate());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('hello');
      CreateUsre(email: email, name: name, phone: phone, uid: value.user.uid);
      print(value.user.email);
      emit(AppsucessRegisterstate());
    }).catchError((onError) {
      emit(ApperrorRegisterstate());
    });
  }

  void LoginMethod({
    String email,
    String password,
  }) {
    emit(AppLoadingLoginstate());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(AppsucessLoginstate(value.user.uid));
    }).catchError((onError) {
      emit(ApperrorLoginstate());
    });
  }

  void CreateUsre({
    String email,
    String name,
    String phone,
    String uid,
  }) {
    UserModel model = UserModel(
        name: name,
        uid: uid,
        phone: phone,
        email: email,
        isEmailVerified: false,
        bio: 'no bio',
        cover:
            'https://images.unsplash.com/photo-1578237486000-e2f9595113cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MTM5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        image:
            'https://images.unsplash.com/photo-1579119159780-51419861f69f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(Appsucesscreateuserstate());
    }).catchError((onError) {
      emit(Apperrorcreateuserstate());
    });
  }

  UserModel user;

  String username;
  String userimage;
  String bio;
  String phone;
  // CachHelper.savedata(key: 'login',value: state.uid);
  void GetUserData() async {
    emit(AppLoadinggetuserstate());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      user = UserModel.fromMap(value.data());
      uid = user.uid;
      username = user.name;
      userimage = user.image;
      bio = user.bio;
      phone = user.phone;
      CachHelper.savedata(key: 'name', value: username);
      CachHelper.savedata(key: 'userimage', value: userimage);
      emit(Appsucessgetuserstate());
    }).catchError((onError) {
      emit(Apperrorgetuserstate());
    });
  }

  String cashedName = CachHelper.getdata(key: 'name');
  String cashedimage = CachHelper.getdata(key: 'userimage');
  void emiteditprofilescreen() {
    GetUserData();
  }

  int CurrentIndex = 0;

  void ChangeCurrentIndex(int value) {
    GetUserData();
    if (value == 2) {
      emit(AppGoToAddPostScreenState());
    } else {
      CurrentIndex = value;
      emit(AppBottemNavBarState());
    }
  }

  List<Widget> Screens = [
    PostsHome(),
    ChatsScreen(),
    AddNewPost(),
    UsersScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'New Post',
    'People you may know',
    'Profile'
  ];

  File profileimage;
  final profilepicker = ImagePicker();
  Future getProfileImage() async {
    final pickedFile =
        await profilepicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileimage = File(pickedFile.path);
      emit(AppProfileImagePickerfoundState());
    } else {
      print('No image selected.');
      emit(AppProfileImagePickerNotfoundState());
    }
  }

  File coverimage;
  final coverpicker = ImagePicker();
  Future getcopverImage() async {
    final pickedFile = await coverpicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverimage = File(pickedFile.path);
      emit(AppCoverImagePickerfoundState());
    } else {
      print('No image selected.');
      emit(AppCoverImagePickerNotfoundState());
    }
  }

  void UplodeProfileImage(
    context, {
    String newname,
    String phone,
    String newbio,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileimage.path).pathSegments.last}')
        .putFile(profileimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        UPDateUserData(
          context,
          newbio: newbio,
          newname: newname,
          phone: phone,
          cover: value,
        );
        emit(uploadProfileImagesucessState());
        GetUserData();
        print(value);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return home();
        }), (route) => false);
      }).catchError((onError) {
        emit(uploadProfileImageerrorState());
      });
    }).catchError((e) {
      emit(uploadProfileImageerrorState());
    });
  }

  void UplodeCovermage(context, {String newname, String phone, String newbio}) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverimage.path).pathSegments.last}')
        .putFile(coverimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(uploadcoverImagesucessState());
        GetUserData();
        print(value);
        UPDateUserData(
          context,
          newbio: newbio,
          newname: newname,
          phone: phone,
          image: value,
        );
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return home();
        }), (route) => false);
      }).catchError((onError) {
        emit(uploadcoverImageerrorState());
      });
    }).catchError((e) {
      emit(uploadcoverImageerrorState());
    });
  }

  void UpdataUserDataimages(
    context, {
    String newname,
    String phone,
    String newbio,
  }) {
    if (coverimage != null) {
      UplodeCovermage(context);
    } else if (profileimage != null) {
      UplodeProfileImage(context);
    } else if (coverimage != null && profileimage != null) {
    } else {
      UPDateUserData(context, phone: phone, newname: newname, newbio: newbio);
    }
  }

  void UPDateUserData(
    context, {
    String newname,
    String phone,
    String newbio,
    String cover,
    String image,
  }) {
    UserModel model = UserModel(
      name: newname,
      phone: phone,
      email: user.email,
      uid: user.uid,
      isEmailVerified: false,
      bio: newbio,
      cover: cover ?? user.cover,
      image: image ?? user.image,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update(model.toMap())
        .then((value) {
      GetUserData();
      emit(Appsucessgetuserstate());
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return home();
      }), (route) => false);
    }).catchError((onError) {});
  }

  File postimage;

  final postpicker = ImagePicker();

  Future getpostImage() async {
    final pickedFile = await postpicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postimage = File(pickedFile.path);
      emit(AppGetImagePickerSuccessfullyState());
    } else {
      print('No image selected.');
      emit(AppGetImagePickererrorState());
    }
  }

  void CloseTheImageInpost() {
    postimage = null;
    emit(AppclosetheimageofpostyState());
  }

  void uplodePost({
    String ptext,
    String pdate,
    String pimage,
  }) {
    GetUserData();
    PostModel model = PostModel(
      name: cashedName,
      uid: uid,
      image: cashedimage,
      PostText: ptext,
      PostDate: pdate,
      Postimage: pimage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      GetUserData();

      emit(AppCreatePostSuccessfullyState());
      //getPosts();
    }).catchError((onError) {});
  }

  void UplodePostWithImage({
    String ptext,
    String pdate,
  }) {
    GetUserData();
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postimage.path).pathSegments.last}')
        .putFile(postimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        uplodePost(
          ptext: ptext,
          pdate: pdate,
          pimage: value,
        );
        emit(AppCreatePostSuccessfullyState());
        //getPosts();
      }).catchError((onError) {});
    }).catchError((onError) {});
  }

  List<PostModel> posts = [];

  List<String> postsid = [];

  List<int> likes = [];

  List<PostModel> myPosts = [];

  void getPosts() {
    GetUserData();
    posts = [];
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('PostDate')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          if (element.data()['uid'] == uid) {
            myPosts.add(PostModel.fromMap(element.data()));
          }
          postsid.add(element.id);
          posts.add(PostModel.fromMap(element.data()));
          likes.add(value.docs.length);
          emit(AppGetPostssucessState());
        }).catchError((onError) {});
      });
      emit(AppGetPostssucessState());
    }).catchError((onError) {});
  }

  void LikePost(String postid) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('likes')
        .doc(user.uid)
        .set({
      'likes': true,
    }).then((value) {
      emit(AppLikePostSucessState());
    }).catchError((onError) {
      emit(AppLikePosterrorState());
    });
  }

  List<UserModel> users = [];
  void GetAllUsers() {
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uid'] != uid) {
          users.add(UserModel.fromMap(element.data()));
        }
      });
      emit(AppGetUsersSucessState());
    }).catchError((onError) {
      emit(AppGetUserserrorState());
    });
  }

  void SendMessage({
    String resiverid,
    String datetime,
    String mytext,
  }) {
    MessageModel model = MessageModel(
      datetime: datetime,
      resiverid: resiverid,
      text: mytext,
      senderid: uid,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc(resiverid)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(AppsucessSendMessage());
    }).catchError((onError) {
      emit(ApperrorSendMessage());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(resiverid)
        .collection('chats')
        .doc(uid)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(AppsucessSendMessage());
    }).catchError((onError) {
      emit(ApperrorSendMessage());
    });
  }
  List<MessageModel> messages = [];
  void GetMessages({
    String resiverid,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc(resiverid)
        .collection('messages')
        .orderBy('datetime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromMap(element.data()));
      });
      emit(AppsucessgetMessage());
    });
  }
}
