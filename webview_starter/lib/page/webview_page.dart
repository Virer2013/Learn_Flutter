import 'package:flutter/material.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () async {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () async {},
          ),
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan, size: 32),
        onPressed: () async {},
      ),
    );
  }
}
