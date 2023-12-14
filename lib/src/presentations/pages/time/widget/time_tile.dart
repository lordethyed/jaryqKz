import 'package:flutter/material.dart';

class TimeTile extends StatelessWidget {
  const TimeTile({super.key, required this.title, required this.time});
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: Text(title),
        trailing: Text(time),
      ),
    );
  }
}
