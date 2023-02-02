class UserModel{
   String name;
   String uid;
   String phone;
   String email;
   String image;
   String cover;
   String bio;
   bool isEmailVerified;

  UserModel({ this.name,
     this.uid,
     this.phone,
     this.isEmailVerified,
     this.email,
    this.image,
    this.bio,
    this.cover
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'uid': this.uid,
      'phone': this.phone,
      'email': this.email,
      'isEmailVerified': this.isEmailVerified,
      'image': this.image,
      'bio': this.bio,
      'cover': this.cover,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      uid: map['uid'],
      phone: map['phone'],
      email: map['email'],
      isEmailVerified: map['isEmailVerified'],
      image: map['image'],
      bio: map['bio'],
      cover: map['cover'],
    );
  }
}