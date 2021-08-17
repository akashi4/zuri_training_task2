import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutHNG extends StatelessWidget {
  const AboutHNG({Key? key}) : super(key: key);
  static const _link = 'https://internship.zuri.team/';

  void _launchBrowser(context) async {
    try {
      await canLaunch(_link);
      await launch(_link, forceSafariVC: true, forceWebView: false);
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("couldn't launch the browser")));
      throw 'couldn\'t lauch $_link';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  height: screenSize.height / 3,
                  width: screenSize.width / 3,
                  image: AssetImage('assets/images/zuri.png'),
                ),
                Image(
                  height: screenSize.height / 3,
                  width: screenSize.width / 3,
                  image: AssetImage('assets/images/hng.png'),
                ),
              ],
            ),
            Container(
              child: Text(""),
            ),
            TextButton(
                onPressed: () {
                  _launchBrowser(context);
                },
                child: Text('Link to hng website'))
          ],
        ),
      ),
    );
  }
}
