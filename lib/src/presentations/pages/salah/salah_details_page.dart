import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/salah_card_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SalahDetailsPage extends StatefulWidget {
  const SalahDetailsPage({super.key, required this.salahCard});
  final SalahCard salahCard;

  @override
  State<SalahDetailsPage> createState() => _SalahDetailsPageState();
}

class _SalahDetailsPageState extends State<SalahDetailsPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.salahCard.videoLink)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.salahCard.title),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.salahCard.desc),
            Text(widget.salahCard.content),
            const SizedBox(
              height: 15,
            ),
            const Text('Толығырақ осы видеодан біле аласыздар'),
            YoutubePlayer(controller: _controller)
          ],
        ),
      )),
    );
  }
}
