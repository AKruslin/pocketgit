import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenInWebButton extends StatelessWidget {
  const OpenInWebButton({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          try {
            launch(url);
          } catch (e) {}
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))),
        child: const Text('Open in Web'));
  }
}
