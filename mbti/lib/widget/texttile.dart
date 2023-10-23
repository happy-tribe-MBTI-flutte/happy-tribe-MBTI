import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextTile extends StatefulWidget {
  const TextTile({
    super.key,
    required this.name,
    required this.git,
  });
  final String name;
  final String git;

  @override
  State<TextTile> createState() => _TextTileState();
}

class _TextTileState extends State<TextTile> {
  @override
  Widget build(BuildContext context) {
    @override
    final Uri url = Uri.parse(widget.git);

    Future<void> launchUrls() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Card(
      color: Colors.white,
      child: ListTile(
        tileColor: Colors.white,
        // textColor: Colors.white,
        leading: Image.asset("assets/main/github.png"),
        title: Text(widget.name),
        subtitle: Text(widget.git),
        onTap: () {
          launchUrls();
        },
      ),
    );
  }
}
