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
        selectedMBTI = selectedMBTI['INTJ'];
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
            body: Container(
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
                      SizedBox(
                    width: 390,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 40, 50, 0), padding: EdgeInsets.only(left:10, right:10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), 
                                     
                        ),
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                    style: TextStyle(fontSize: 11,),
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
           SizedBox(
                    width: 390,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 40, 50, 0), padding: EdgeInsets.only(left:10, right:10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), 
                                     
                        ),
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                    style: TextStyle(fontSize: 11,),
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
