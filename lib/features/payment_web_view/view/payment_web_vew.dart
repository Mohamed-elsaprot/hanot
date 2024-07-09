import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../success_sucreen/success_screen.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({Key? key, required this.link}) : super(key: key);
  final String link;
  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (x){
            if(x.url!.contains('success')){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessScreen()));
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller,),
    );
  }
}
