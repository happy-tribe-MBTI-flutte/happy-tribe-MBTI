import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
              color: Color.fromARGB(221, 253, 166, 252),
              image: DecorationImage(
                  image: AssetImage('page_img/m_img.png'), fit: BoxFit.cover)),
          child: ListView(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 70),
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Text("MAKERS", style: GoogleFonts.anton(fontSize: 50)),
                  ),
                ),
                SizedBox(height: 120),
                TextTile(
                  name: "조영",
                  git: "https://github.com/gitjoyoung",
                ),
                SizedBox(
                  height: 20,
                ),
                TextTile(
                  name: "오정현",
                  git: "https://github.gcom/jeonghyun77",
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
      ),
    );
  }
}
