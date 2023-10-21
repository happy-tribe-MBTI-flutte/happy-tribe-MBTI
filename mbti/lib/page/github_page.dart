import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbti/widget/texttile.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubPage extends StatelessWidget {
  const GithubPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(String _url) async {
      final Uri geturl = Uri.parse(_url);
      if (!await launchUrl(geturl)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
              color: Color.fromARGB(221, 253, 166, 252),
              image: DecorationImage(
                  image: AssetImage('page_img/m_img.png'), fit: BoxFit.cover)),
          child: Column(
            children: [
              AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black, size: 40,
                  //색변경
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Expanded(
                child: ListView(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 70),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only( bottom: 30),
                          child: Column(
                            children: [
                              Text("MAKERS",
                                  style: GoogleFonts.anton(fontSize: 50)),
                              TextButton(
                                  onPressed: () {
                                    _launchUrl(
                                        'https://github.com/happy-tribe-MBTI-project-flutter/happy-tribe-MBTI');
                                  },
                                  child: Text('8vengers Organizations'))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      TextTile(
                        name: "조영",
                        git: "https://github.com/gitjoyoung",
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
