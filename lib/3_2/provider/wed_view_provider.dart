


import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebProvider extends ChangeNotifier {
  InAppWebViewController? webViewController;
  double progress = 0;
  String searchedText = '';

  List? icons;

  WebProvider() {
    icons = [
      IconButton(
          onPressed: () {
            webViewController?.goBack() ?? null;
          },
          icon: Icon(Icons.arrow_back_ios)),
      IconButton(
          onPressed: () {
            webViewController?.goForward() ?? null;
          },
          icon: Icon(Icons.arrow_forward_ios)),
      IconButton(
          onPressed: () {
            webViewController?.reload() ?? null;
          },
          icon: Icon(Icons.refresh)),
      IconButton(onPressed: () {}, icon: Icon(Icons.looks_one_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
    ];
  }
  void onProgressChanged(int progress) {
    this.progress = progress / 100;
    notifyListeners();
  }

  void updateSearchedText(String text) {
    searchedText = text;
    notifyListeners();
  }
}
