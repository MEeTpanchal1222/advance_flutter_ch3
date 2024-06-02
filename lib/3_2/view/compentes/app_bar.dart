import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../provider/wed_view_provider.dart';


AppBar WebAppBar(WebProvider providerTrue, WebProvider providerFalse) {
  return AppBar(
    toolbarHeight: 90,
    title: SizedBox(
      height: 41,
      child: TextField(
        onSubmitted: (value) {
          providerFalse.updateSearchedText(value);
          providerFalse.webViewController!.loadUrl(
              urlRequest: URLRequest(
                  url: WebUri(
                      "https://www.google.com/search?q=${providerFalse.searchedText}&rlz=1C1ONGR_enIN1095IN1095&oq=hi&gs_lcrp=EgZjaHJvbWUqDggAEEUYJxg7GIAEGIoFMg4IABBFGCcYOxiABBiKBTIGCAEQRRg7Mg0IAhAAGIMBGLEDGIAEMg0IAxAuGIMBGLEDGIAEMhAIBBAAGIMBGLEDGIAEGIoFMg0IBRAAGIMBGLEDGIAEMhYIBhAuGIMBGMcBGLEDGNEDGIAEGIoFMgcIBxAAGIAEMgcICBAAGIAEMhAICRAuGIMBGLEDGIAEGIoF0gEJMTIzNmowajE1qAIJsAIB&sourceid=chrome&ie=UTF-8")));
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.only(top: 5, left: 15),
          hintText: "Search Here",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              )),
        ),
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {}, icon: Icon(Icons.star_border_purple500_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.file_download_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
    ],
  );
}