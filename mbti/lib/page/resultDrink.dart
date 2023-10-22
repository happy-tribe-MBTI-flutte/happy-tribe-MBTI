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
        selectedMBTI = selectedMBTI['ENFP'];
        if (kDebugMode) {
          print(selectedMBTI.keys);
        }
        return selectedMBTI;
      } else {
        return null;
      }
    }

    return FutureBuilder(
      future: mbtiJsonDecode(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('에러 Error: ${snapshot.error}');
        } else {
          var futureDate = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 844,
                  width: 390,
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            'WHIT TRAVLE',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                          ),
                          //술추천 1
                          SizedBox(
                            width: 390,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 50, 5, 30),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Container(
                                height: 100,
                                margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(
                                      futureDate['img1'],
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.fill,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 120,
                                        child: Column(
                                          children: [
                                            Text(
                                              "${futureDate['recommendation']}",
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    "${futureDate['explanation1']}",
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      letterSpacing: 0.5,
                                                    ),
                                                    textWidthBasis:
                                                        TextWidthBasis.parent,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                border: Border.all(color: Colors.black),
                              ),
                              child: Container(
                                height: 100,
                                margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black)),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.network(
                                        futureDate['img2'],
                                        width: 100,
                                        height: 120,
                                        fit: BoxFit.fill,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: 120,
                                          child: Column(
                                            children: [
                                              Text(
                                                "${futureDate['Other recommendations']}",
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Center(
                                                child: Wrap(children: [
                                                  Text(
                                                      "${futureDate['explanation2']}",
                                                      style: const TextStyle(
                                                        fontSize: 11,
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
                          SizedBox(
                            child: Container(
                              width: 500,
                              height: 250,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                              ),
                              child: ResultMusic(mbti: mbti.toUpperCase()),
                            ),
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
