import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '3_1/view/intrnet_check_screen.dart';
import '3_2/provider/wed_view_provider.dart';
import '3_2/view/wed_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WebProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/webView',
        routes: {
          '/no_internet': (context) => internetScreen(),
          '/webView': (context) => WebViewScreen()
        },
      ),
    );
  }
}