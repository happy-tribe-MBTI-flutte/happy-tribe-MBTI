import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: resultDrink()));
}

class resultDrink extends StatelessWidget {
  const resultDrink({super.key, this.mbti,});
  final mbti;
  

  @override
  Widget build(BuildContext context) {
    var selectedMBTI;

    Future MbtiJsonDecode() async {
      String data = await rootBundle.loadString('Drink_img/dink.json');
      selectedMBTI = jsonDecode(data);
      if (selectedMBTI != null) {
        selectedMBTI = selectedMBTI[mbti];
        return selectedMBTI;
      } else {
        return null;
      }
    }

    return FutureBuilder(
      future: MbtiJsonDecode(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Text('에러 Error: ${snapshot.error}');
        }else{
          var futureDate = snapshot,data;
          return Scaffold(
              body: 
                Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('page_img/r_img2.png'),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 190,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 40, 50, 0), padding: EdgeInsets.only(left:20, right:20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),  
                        ),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0), padding: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),  
                        ),
                        ),
                        ),
                      Container(
                          margin: EdgeInsets.fromLTRB(50, 40, 50, 0), padding: EdgeInsets.only(left:20, right:20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),  
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0), padding: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),  
                          ),
                          ),
                        ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    ();
                  },
                  label: const Text('다시 테스트 하기'),
                  backgroundColor: Colors.blue[600],
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          
          );
        }
      },
    );
  }
}