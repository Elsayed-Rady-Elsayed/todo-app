class MessageModel{
  String senderid;
  String resiverid;
  String datetime;
  String text;

  MessageModel({
    this.senderid,
    this.resiverid,
    this.datetime,
    this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderid': this.senderid,
      'resiverid': this.resiverid,
      'datetime': this.datetime,
      'text': this.text,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderid: map['senderid'],
      resiverid: map['resiverid'],
      datetime: map['datetime'],
      text: map['text'],
    );
  }
}