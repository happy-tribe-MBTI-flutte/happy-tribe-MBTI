import 'package:flutter/material.dart';
import 'package:mbti/widget/texttile.dart';

class GithubPage extends StatelessWidget {
  const GithubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, size: 40,
          //색변경
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('main/gitback.gif'), fit: BoxFit.cover)),
        child: ListView(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
            children: [
              SizedBox(height: 70),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "만든이들",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextTile(name: "조영", git: "https://github.com/gitjoyoung"),
              SizedBox(
                height: 20,
              ),
              TextTile(
                name: "오정현",
                git: "https://github.com/jeonghyun77",
              ),
              SizedBox(
                height: 20,
              ),
              TextTile(
                name: "임동욱",
                git: "https://github.com/dongwook1179",
              ),
              SizedBox(
                height: 20,
              ),
              TextTile(
                name: "손성민",
                git: "https://github.com/sungmmmm",
              ),
            ]),
      ),
    );
  }
}
