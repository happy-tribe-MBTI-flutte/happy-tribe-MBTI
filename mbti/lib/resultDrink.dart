import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: resultDrink(),));
}

class resultDrink extends StatelessWidget {
  const resultDrink({super.key, this.mbti,});

 final mbti;
 

  @override
  Widget build(BuildContext context) {
    var mmm = 'mbti';
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
              margin: EdgeInsets.fromLTRB(50, 40, 50, 0), padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),  
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 40, 50, 0), padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
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
}