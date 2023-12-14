import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/question_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuestionReadPage extends StatefulWidget {
  const QuestionReadPage({super.key, required this.question});
  final Question question;

  @override
  State<QuestionReadPage> createState() => _QuestionReadPageState();
}

class _QuestionReadPageState extends State<QuestionReadPage> {
  late WebViewController _controller;


  @override
  void initState() {
    _controller = WebViewController()..loadRequest(Uri.parse(widget.question.siteLink));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.question.title)
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}