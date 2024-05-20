import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPreviewPage extends StatefulWidget {
  final String url;

  const WebPreviewPage({
    super.key,
    required this.url,
  });

  @override
  State<WebPreviewPage> createState() => _WebPreviewPageState();
}

class _WebPreviewPageState extends State<WebPreviewPage> {
  InAppWebViewController? webController;

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      // javaScriptEnabled: false,
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  @override
  void dispose() {
    webController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Preview'),
        ),
        body: InAppWebView(
          initialSettings: settings,
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          onWebViewCreated: (controller) {
            setState(() {
              webController = controller;
            });
          },
        ));
  }
}
