import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mbti/widget/music.dart';
// import 'package:motion/motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(MaterialApp(home: ResultDrink()));
// }

class ResultDrink extends StatelessWidget {
  const ResultDrink({
    super.key,
    this.mbti,
  });
  final dynamic mbti;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("mbti: $mbti");
    }

    Future mbtiJsonDecode() async {
      String data = await rootBundle.loadString('drink_img/drink.json');
      var selectedMBTI = jsonDecode(data);
      if (selectedMBTI != null) {
        selectedMBTI = selectedMBTI["${mbti.toUpperCase()}"];
        print(selectedMBTI.keys);
        return selectedMBTI;
      } else {
        return null;
      }
    }

    return FutureBuilder(
      future: mbtiJsonDecode(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.amber,
          ));
        } else if (snapshot.hasError) {
          return Text('에러 Error: ${snapshot.error}');
        } else {
          var futureDate = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  height: 830,
                  width: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 1, -0.1],
                      colors: [
                        Colors.yellowAccent.shade100,
                        Color.fromARGB(227, 255, 117, 214),
                        Color.fromARGB(255, 252, 251, 247),
                      ],
                    ),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'WHIT TRAVLE',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          //술추천 1
                          Container(
                            width: 390,
                            margin: EdgeInsets.fromLTRB(5, 50, 5, 30),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              decoration: BoxDecoration(
                                border: Border(
                                    left:
                                        BorderSide(color: Colors.grey.shade500),
                                    right: BorderSide(
                                        color: Colors.grey.shade500)),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      futureDate['img1'],
                                      width: 120,
                                      height: 110,
                                      fit: BoxFit.fill,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 120,
                                        child: ListView(
                                          children: [
                                            Text(
                                              "${futureDate['recommendation']}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Center(
                                              child: Wrap(children: [
                                                Text(
                                                    "${futureDate['explanation1']}",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      letterSpacing: 0.5,
                                                    ),
                                                    textWidthBasis:
                                                        TextWidthBasis.parent),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          //술추천 2
                          SizedBox(
                            width: 390,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                          
                                border: Border.all(color: Colors.grey.shade500),
                              ),
                              child: Container(
                                height: 100,
                                margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                                decoration: BoxDecoration(
                           
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.grey.shade500),
                                      right: BorderSide(
                                          color: Colors.grey.shade500)),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        futureDate['img2'],
                                        width: 120,
                                        height: 110,
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 120,
                                          child: ListView(
                                            children: [
                                              Text(
                                                "${futureDate['Other recommendations']}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Center(
                                                child: Wrap(children: [
                                                  Text(
                                                      "${futureDate['explanation2']}",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        letterSpacing: 0.5,
                                                      ),
                                                      textWidthBasis:
                                                          TextWidthBasis
                                                              .parent),
                                                ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 500,
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // 그림자 색상 및 투명도
                                  spreadRadius: 5, // 그림자 확산 반경
                                  blurRadius: 7, // 그림자의 흐림 정도
                                  offset: Offset(0, 5), // 그림자 위치 (수평, 수직)
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                  20), // 숫자는 원하는 둥근 정도에 따라 조절하세요.
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ResultMusic(mbti: mbti.toUpperCase())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

    
          );
        }
      },
    );
  }
}
