import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MbtiTravel {
String title;
String img;
String explanation;
String Overseas;
String Domestic;
String expl;
String expl_Add;
  MbtiTravel({
    required this.title,
    required this.img,
    required this.explanation,
    required this.Overseas,
    required this.Domestic,
    required this.expl,
    required this.expl_Add,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'img': img,
      'explanation': explanation,
      'Overseas': Overseas,
      'Domestic': Domestic,
      'expl': expl,
      'expl_Add': expl_Add,
    };
  }

  factory MbtiTravel.fromMap(Map<String, dynamic> map) {
    return MbtiTravel(
      title: map['title'] as String,
      img: map['img'] as String,
      explanation: map['explanation'] as String,
      Overseas: map['Overseas'] as String,
      Domestic: map['Domestic'] as String,
      expl: map['expl'] as String,
      expl_Add: map['expl_Add'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MbtiTravel.fromJson(String source) => MbtiTravel.fromMap(json.decode(source) as Map<String, dynamic>);
}