import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../3_2/provider/wed_view_provider.dart';
import '../../3_2/view/compentes/app_bar.dart';



TextEditingController txtSearchedText = TextEditingController();

class internetScreen extends StatelessWidget {
  const internetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<WebProvider>(context);
    final providerFalse = Provider.of<WebProvider>(context, listen: false);
    InAppWebViewController? webViewController;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WebAppBar(providerTrue, providerFalse),
      body: Stack(
        children: [
          StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data!.contains(ConnectivityResult.mobile)) {
          return   AppWebView(providerTrue, providerFalse);
        } else if (snapshot.data!.contains(ConnectivityResult.wifi)) {
          return   AppWebView(providerTrue, providerFalse);
        } else {
          return Center(
            child: Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    child: Image.asset(
                      "assets/no_internet.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        webViewController?.reload() ?? null;
                      },
                      child: Text(
                        "Retry",
                        style: TextStyle(
                            fontFamily: 'arial',
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          );
        }

      },
          ),

          if(providerTrue.progress < 1)
              Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  value: providerTrue.progress,
                  color: Colors.blueAccent,
                ),),
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

  InAppWebView  AppWebView(WebProvider providerTrue, WebProvider providerFalse) {
    return InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri('https://www.google.com/'),
          ),
          onWebViewCreated: (controller) =>
          providerTrue.webViewController = controller,
          onProgressChanged: (controller, progress) =>
              providerFalse.onProgressChanged(progress),
        );
  }
}