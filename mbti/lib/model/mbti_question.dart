import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MbtiQuestion {
  String question;
  Obtion options;
  MbtiQuestion({
    required this.question,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'options': options.toMap(),
    };
  }

  factory MbtiQuestion.fromMap(Map<String, dynamic> map) {
    return MbtiQuestion(
      question: map['question'] as String,
      options: Obtion.fromMap(map['options'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MbtiQuestion.fromJson(String source) => MbtiQuestion.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Obtion {
  String a;
  String b;
  Obtion({
    required this.a,
    required this.b,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'a': a,
      'b': b,
    };
  }

  factory Obtion.fromMap(Map<String, dynamic> map) {
    return Obtion(
      a: map['a'] as String,
      b: map['b'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Obtion.fromJson(String source) => Obtion.fromMap(json.decode(source) as Map<String, dynamic>);
}
