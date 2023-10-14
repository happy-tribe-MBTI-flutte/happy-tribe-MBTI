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
    final Uri _url = Uri.parse(widget.git);

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Card(
      color: Colors.white,
      child: ListTile(
        tileColor: Colors.white,
        // textColor: Colors.white,
        leading: Image.asset("main/github.png"),
        title: Text(widget.name),
        subtitle: Text(widget.git),
        onTap: () {
          _launchUrl();
        },
      ),
    );
  }
}
