import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/article_models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({super.key, required this.article});
  final Article article;

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.article.articleUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
