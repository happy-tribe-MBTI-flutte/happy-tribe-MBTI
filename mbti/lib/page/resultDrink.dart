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
        selectedMBTI = selectedMBTI['ENFP'];
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
            backgroundColor: Colors.white,
            body: Text('test')
            
            // Center(
            //   child: SingleChildScrollView(
            //     child: Container(
            //       height: 820,
            //       width: 400,
            //       child: Card(
            //         margin: EdgeInsets.all(20),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: Column(
            //             children: [
            //               Text(
            //                 'WHIT TRAVLE',
            //                 style: TextStyle(
            //                     fontSize: 32, fontWeight: FontWeight.bold),
            //               ),
            //               Container(
            //                 margin: EdgeInsets.all(10),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.black)),
            //               ),
            //               //술추천 1
            //               SizedBox(
            //                 width: 390,
            //                 child: Container(
            //                   margin: EdgeInsets.fromLTRB(5, 50, 5, 30),
            //                   padding: EdgeInsets.only(left: 10, right: 10),
            //                   decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.black),
            //                   ),
            //                   child: Container(
            //                     height: 100,
            //                     margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
            //                     decoration: BoxDecoration(
            //                       border: Border(
            //                           left: BorderSide(color: Colors.black),
            //                           right: BorderSide(color: Colors.black)),
            //                     ),
            //                     child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceAround,
            //                         children: [
            //                           Image.network(
            //                             futureDate['img1'],
            //                             width: 100,
            //                             height: 120,
            //                             fit: BoxFit.fill,
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.all(10.0),
            //                             child: Container(
            //                               width: 120,
            //                               child: Expanded(
            //                                 child: Column(
            //                                   children: [
            //                                     Text(
            //                                       "${futureDate['recommendation']}",
            //                                       style: TextStyle(
            //                                           fontSize: 11,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                     Center(
            //                                       child: Wrap(children: [
            //                                         Text(
            //                                             "${futureDate['explanation1']}",
            //                                             style: TextStyle(
            //                                               fontSize: 11,
            //                                               letterSpacing: 0.5,
            //                                             ),
            //                                             textWidthBasis:
            //                                                 TextWidthBasis
            //                                                     .parent),
            //                                       ]),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ),
            //                           )
            //                         ]),
            //                   ),
            //                 ),
            //               ),
            //               //술추천 2
            //               SizedBox(
            //                 width: 390,
            //                 child: Container(
            //                   margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
            //                   padding: EdgeInsets.only(left: 10, right: 10),
            //                   decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.black),
            //                   ),
            //                   child: Container(
            //                     height: 100,
            //                     margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
            //                     decoration: BoxDecoration(
            //                       border: Border(
            //                           left: BorderSide(color: Colors.black),
            //                           right: BorderSide(color: Colors.black)),
            //                     ),
            //                     child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceAround,
            //                         children: [
            //                           Image.network(
            //                             futureDate['img2'],
            //                             width: 100,
            //                             height: 120,
            //                             fit: BoxFit.fill,
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.all(10.0),
            //                             child: Container(
            //                               width: 120,
            //                               child: Column(
            //                                 children: [
            //                                   Text(
            //                                     "${futureDate['Other recommendations']}",
            //                                     style: TextStyle(
            //                                         fontSize: 11,
            //                                         fontWeight:
            //                                             FontWeight.bold),
            //                                   ),
            //                                   Center(
            //                                     child: Wrap(children: [
            //                                       Text(
            //                                           "${futureDate['explanation2']}",
            //                                           style: TextStyle(
            //                                             fontSize: 11,
            //                                             letterSpacing: 0.5,
            //                                           ),
            //                                           textWidthBasis:
            //                                               TextWidthBasis
            //                                                   .parent),
            //                                     ]),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           )
            //                         ]),
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 child: Container(
            //                   width: 500,
            //                   height: 250,
            //                   decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.black87),
            //                   ),
            //                   child: ResultMusic(mbti: mbti.toUpperCase()),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
           
           
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
