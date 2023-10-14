import 'dart:convert';

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
    var selectedMBTI;

    Future MbtiJsonDecode() async {
      String data = await rootBundle.loadString('Drink_img/drink.json');
      selectedMBTI = jsonDecode(data);
      if (selectedMBTI != null) {
        selectedMBTI = selectedMBTI['INFP'];
        print(selectedMBTI.keys);
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
          var futureDate = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Container(
                    width: 380,
                    height: 800,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.white,
                          Color.fromARGB(255, 227, 214, 105),
                        ],
                        center: Alignment(-0.5, 1)
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Column(
                    children: [
                      Text('WHIT TRAVLE',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      ),
                      //술추천 1
                      SizedBox(
                        width: 390,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 40, 10, 0), padding: EdgeInsets.only(left:10, right:10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black), 
                            ),
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              decoration: BoxDecoration(
                                border: Border( left:BorderSide(color: Colors.black), right:BorderSide(color: Colors.black)),    
                              ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(futureDate['img1'],
                                height: 80,
                                ),
                                Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Text("${futureDate['recommendation']}",
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                                      ),
                                      Center(
                                        child: Wrap(
                                          children:[
                                            Text("${futureDate['explanation1']}",
                                          style: TextStyle(fontSize: 11,
                                          ),
                                          textWidthBasis: TextWidthBasis.parent
                                          ),
                                          ] 
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      //술추천 2
                      SizedBox(
                        width: 390,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 40, 10, 40), padding: EdgeInsets.only(left:10, right:10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),            
                            ),
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              decoration: BoxDecoration(
                              border: Border( left:BorderSide(color: Colors.black), right:BorderSide(color: Colors.black)),    
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(futureDate['img2'],
                                  height: 80,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Text("${futureDate['Other recommendations']}",
                                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                                        ),
                                        Center(
                                          child: Wrap(
                                            children:[
                                              Text("${futureDate['explanation2']}",
                                            style: TextStyle(fontSize: 11,
                                            ),
                                            textWidthBasis: TextWidthBasis.parent
                                            ),
                                            ] 
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]
                              ),
                            ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          width: 500,
                          height: 300, 
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),          
                            ),
                        ),
                      ),
                      ],
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
