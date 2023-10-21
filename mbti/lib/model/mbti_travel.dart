import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MbtiTravel {
  String title;
  List img;
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
      img: List.from((map['img'] as List)),
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

void main() {
  var data = {
    "title": "사색가",
    "img": [
      "travel_assets/travel_img/intp.jpeg",
      "travel_assets/travel_img/intp담양.jpg"
    ],
    "explanation": "논리적이고 사색적인 유형으로, 학문적인 환경과 철학적인 장소가 어울립니다.",
    "Overseas": "스웨덴",
    "Domestic": "담양",
    "expl":
        "INTP 유형은 과학, 기술, 연구, 철학, 예술 등 다양한 분야에서 빛을 발하는데 능하며, 복잡한 문제를 해결하고 혁신적인 아이디어를 제시하는 데 능력을 발휘합니다. 그러나 때로는 감정을 무시하거나 다른 사람들과의 사회적 관계에서 어려움을 겪을 수 있으므로, 감정적인 측면도 발전시키는 것이 중요합니다.",
    "expl_Add":
        "INTP 유형은 '논리적인 사색가'로 알려진 개성적인 유형 중 하나입니다. 이들은 분석적이고 논리적인 사고를 가지며, 독창적인 아이디어와 개념을 탐구하는 것을 즐깁니다."
  };

  Future<void> MbtiJsonDecode() async {
    try {
      final MbtiTravel mbtiModel = MbtiTravel.fromMap(data);
      if (mbtiModel != null) {
        print(mbtiModel.img[0]); // 모델의 title 출력 예시
      } else {
        print("데이터가 null입니다.");
      } // 모델의 title 출력 예시
    } catch (e) {
      print("오류 발생: $e");
    }
  }

  // 함수 호출
  MbtiJsonDecode();
}
