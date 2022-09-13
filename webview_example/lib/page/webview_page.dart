import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions {
  clearCache,
  clearCookies,
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webController;
  double progress = 0;

  late bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webController.canGoBack()) {
          _webController.goBack();
        } else {
          log('Нет записи в истории');
        }

        // Stay App
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await _webController.canGoBack()) {
                  _webController.goBack();
                } else {
                  log('Нет записи в истории');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await _webController.canGoForward()) {
                  _webController.goForward();
                } else {
                  log('Нет записи в истории');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () => _webController.reload(),
            ),
            PopupMenuButton<MenuOptions>(
              onSelected: (value) {
                switch (value) {
                  case MenuOptions.clearCache:
                    _onClearCache(_webController, context);
                    break;
                  case MenuOptions.clearCookies:
                    _onClearCookies(context);
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuItem<MenuOptions>>[
                const PopupMenuItem(
                  value: MenuOptions.clearCache,
                  child: Text('Удалить кеш'),
                ),
                const PopupMenuItem(
                  value: MenuOptions.clearCookies,
                  child: Text('Удалить Cookies'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.black,
            ),
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://flutter.dev',
                onWebViewCreated: (controller) {
                  _webController = controller;
                },
                onProgress: (progress) {
                  this.progress = progress / 100;
                  setState(() {});
                },
                onPageStarted: (url) {
                  log('Новый сайт: $url');
                  // if (url.contains('https://flutter.dev')) {
                  //   Future.delayed(const Duration(microseconds: 300), () {
                  //     _webController.runJavascriptReturningResult(
                  //       "document.getElementsByTagName('footer')[0].style.display='none'",
                  //     );
                  //   });
                  // }
                },
                onPageFinished: (url) {
                  log('Страница полностью загружена');
                  if (url.contains('https://m.facebook.com/')) {
                    if (isSubmitting) {
                      _webController.loadUrl('https://m.facebook.com/');
                      isSubmitting = false;
                    }
                  }
                },
                navigationDelegate: (request) {
                  if (request.url.startsWith('https://m.youtube.com')) {
                    log('Навигация заблоктрована к $request');
                    return NavigationDecision.prevent;
                  }
                  log('Навигация разрешена к $request');
                  return NavigationDecision.navigate;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan, size: 32),
          onPressed: () async {
            const email = '';
            const pass = '';

            _webController.runJavascriptReturningResult(
              "document.getElementById('m_login_email').value='$email'",
            );

            _webController.runJavascriptReturningResult(
              "document.getElementById('m_login_password').value='$pass'",
            );

            await Future.delayed(const Duration(seconds: 1));
            isSubmitting = true;
            await _webController.runJavascriptReturningResult(
              "document.forms[0].submit()",
            );
            // final currentUrl = await _webController.currentUrl();
            // log('Предыдущий сайт: $currentUrl');
            // _webController.loadUrl('https://www.youtube.com');
            // _webController.runJavascriptReturningResult(
            //   "document.getElementsByTagName('footer')[0].style.display='none'",
            // );
          },
        ),
      ),
    );
  }

  void _onClearCookies(BuildContext context) async {
    final bool hadCookies = await CookieManager().clearCookies();
    String message = 'Cookies удалены';
    if (!hadCookies) {
      message = 'Cookies все были очищены';
    }
    //  https://docs.flutter.dev/deployment/android#reviewing-the-build-configuration
    if (!mounted) return; // Проверяем, что виджет смонтирован
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _onClearCache(WebViewController controller, BuildContext context) async {
    await _webController.clearCache();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Кеш очищен')),
    );
  }
}
