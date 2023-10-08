// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(resultTravel());
}

class resultTravel extends StatelessWidget {
  const resultTravel({super.key, this.mbti});
  final mbti;

  @override
  Widget build(BuildContext context) {
    var selectedMBTI;
    Future MbtiJsonDecode() async {
      String data = await rootBundle.loadString('travel_img/newTravel.json');
      selectedMBTI = jsonDecode(data);
      if (selectedMBTI != null) {
        selectedMBTI = selectedMBTI['INTP'];
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
          return CircularProgressIndicator(); // 데이터 로딩 중인 경우 로딩 스피너 표시
        } else if (snapshot.hasError) {
          return Text('에러 Error: ${snapshot.error}');
        } else {
          var futureDate = snapshot.data; // 데이터를 가져옴
          return Scaffold(
            body: Center(
              child: Container(
                height: 844,
                width: 390,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color.fromARGB(255, 245, 245, 170), Colors.red]),
                  image: DecorationImage(
                    alignment: AlignmentDirectional.center,
                    fit: BoxFit.cover,
                    image: AssetImage("travel_img/background1.png"),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          decoration: BoxDecoration(
                              // border:
                              //     Border(bottom: BorderSide(color: Colors.grey)),
                              ),
                          child: Text('${futureDate['title']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 45),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey)
                            ),
                        child: Center(
                            child: Text(
                          "${mbti.toUpperCase()}",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 175,
                        margin: EdgeInsets.symmetric(horizontal: 45),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.blue),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image(
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: double.infinity,
                                  image: NetworkImage(futureDate['img'])),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('한국 ',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("${futureDate['Domestic']}",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Image(
                                    image: AssetImage('page_img/airplane.png'),
                                    fit: BoxFit.cover),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('외국 ',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(futureDate['Overseas'],
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(futureDate['explanation'],
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 175,
                        margin: EdgeInsets.symmetric(horizontal: 45),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  futureDate['explanation'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                                if (futureDate['explanation'].length > 10)
                                  TextButton(
                                      onPressed: () {}, child: Text('더보기...'))
                              ],
                            ),
                          )),
                        ),
                      )
                    ]),
              ),
            ),
          );
        }
      },
    );
  }
}
