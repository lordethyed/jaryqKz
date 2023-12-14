import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookReadPage extends StatefulWidget {
  const BookReadPage({super.key, required this.book});
  final Book book;

  @override
  State<BookReadPage> createState() => _BookReadPageState();
}

class _BookReadPageState extends State<BookReadPage> {
  late WebViewController _controller;


  @override
  void initState() {
    _controller = WebViewController()..loadRequest(Uri.parse(widget.book.bookLink));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(widget.book.bookName),
            Text(widget.book.bookAuthor),
          ],
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}