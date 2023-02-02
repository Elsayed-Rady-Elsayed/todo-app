class PostModel{
  String name;
  String uid;
  String image;
  String Postimage;
  String PostDate;
  String PostText;

  PostModel(
      {this.name,
      this.uid,
      this.image,
      this.Postimage,
      this.PostDate,
      this.PostText});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'uid': this.uid,
      'image': this.image,
      'Postimage': this.Postimage,
      'PostDate': this.PostDate,
      'PostText': this.PostText,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      image: map['image'] as String,
      Postimage: map['Postimage'] as String,
      PostDate: map['PostDate'] as String,
      PostText: map['PostText'] as String,
    );
  }
}