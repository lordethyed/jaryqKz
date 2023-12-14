import 'package:flutter/material.dart';

class NextTimeTile extends StatelessWidget {
  const NextTimeTile({super.key, required this.title, required this.time});
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(title),
          ),
          Text(time),
        ],
      ),
    );
  }
}