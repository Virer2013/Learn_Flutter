
import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewLocalPage extends StatefulWidget {
  const WebViewLocalPage({Key? key}) : super(key: key);

  @override
  _WebViewLocalPageState createState() => _WebViewLocalPageState();
}

class _WebViewLocalPageState extends State<WebViewLocalPage> {
  late WebViewPlusController _webController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Local'),
      ),
      body: WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'assets/index.html',
        onWebViewCreated: (controller) {
          _webController = controller;
          // loadLocalHTML();
        },
      ),
    );
  }

  // void loadLocalHTML() async {
  //   final html = await rootBundle.loadString('assets/index.html');
  //   final url = Uri.dataFromString(
  //     html,
  //     mimeType: 'text/html',
  //     encoding: Encoding.getByName('utf-8'),
  //   ).toString();

  //   _webController.loadUrl(url);
  // }

  // final html = '''<!DOCTYPE html>
  // <html>
  // <body>

  // <h1>This is heading 1</h1>
  // <h2>This is heading 2</h2>
  // <h3>This is heading 3</h3>
  // <h4>This is heading 4</h4>
  // <h5>This is heading 5</h5>
  // <h6>This is heading 6</h6>

  // </body>
  // </html>''';
}
