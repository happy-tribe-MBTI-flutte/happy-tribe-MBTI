import 'dart:convert';
import 'package:mbti/widget/music.dart';
import 'package:motion/motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: resultDrink()));
}

class resultDrink extends StatelessWidget {
  const resultDrink({
    super.key,
    this.mbti,
  });
  final mbti;

  @override
  Widget build(BuildContext context) {
    print("mbti : " + mbti);
    var selectedMBTI;

    Future MbtiJsonDecode() async {
      String data = await rootBundle.loadString('drink_img/drink.json');
      selectedMBTI = jsonDecode(data);
      if (selectedMBTI != null) {
        selectedMBTI = selectedMBTI["${mbti.toUpperCase()}"];
        print(selectedMBTI.keys);
        return selectedMBTI;
      } else {
        return null;
      }
    }

    return FutureBuilder(
      future: MbtiJsonDecode(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
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
                        Color.fromARGB(227, 255, 117,
                            214), // Use the custom gold color here
                        Colors.yellowAccent.shade100,
                        Color.fromARGB(255, 252, 251, 247),
                      ],
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.all(20),
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(
                                      futureDate['img1'],
                                      width: 120,
                                      height: 120,
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
                              margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade500),
                              ),
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.grey.shade500),
                                      right: BorderSide(
                                          color: Colors.grey.shade500)),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.network(
                                        futureDate['img2'],
                                        width: 120,
                                        height: 120,
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
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 500,
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(
                                  20), // 숫자는 원하는 둥근 정도에 따라 조절하세요.
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(20),
                                child: ResultMusic(mbti: mbti.toUpperCase())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // floatingActionButton: FloatingActionButton.extended(
            //   onPressed: () {

            //   },
            //   label: const Text('다시 테스트 하기', style: TextStyle(color: Colors.yellow),),
            //   backgroundColor: Color.fromARGB(255, 55, 55, 55),
            // ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        }
      },
    );
  }
}
