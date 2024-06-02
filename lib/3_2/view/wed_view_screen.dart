import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../provider/wed_view_provider.dart';
import 'compentes/app_bar.dart';

TextEditingController txtSearchedText = TextEditingController();

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<WebProvider>(context);
    final providerFalse = Provider.of<WebProvider>(context, listen: false);

    return Scaffold(
      appBar: WebAppBar(providerTrue, providerFalse),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri('https://www.google.com/'),
            ),
            onWebViewCreated: (controller) =>
            providerTrue.webViewController = controller,
            onProgressChanged: (controller, progress) =>
                providerFalse.onProgressChanged(progress),
          ),
          if (providerTrue.progress < 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                value: providerTrue.progress,
                color: Colors.blueAccent,
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration:
        BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(providerTrue.icons!.length,
                    (index) => providerFalse.icons![index])
          ],
        ),
      ),
    );
  }
}