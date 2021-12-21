import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import '../constants.dart';

class WebviewScreenIframe extends StatefulWidget {
  static const routeName = '/webview-iframe';

  @override
  State<WebviewScreenIframe> createState() => _WebviewScreenIframeState();
}

class _WebviewScreenIframeState extends State<WebviewScreenIframe> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    final selectedUrl = ModalRoute.of(context).settings.arguments as String;

    int a = 10;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        backgroundColor: kBackgroundColor,
      ),

      body: Column(
          children: [
            if(a > 9)...[
              Expanded(
                child: WebView(
                  initialUrl: Uri.dataFromString(
                      '<html><body><iframe style="height: 100%;width:100%" src="$selectedUrl"></iframe></body></html>',
                      mimeType: 'text/html')
                      .toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              ),
            ]else...[
              Text("A is less than or Equal to 10")
            ]
          ]),
    );
  }
}
