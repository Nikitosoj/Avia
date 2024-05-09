import 'package:avia/features/home/domain/music_fly_model.dart';
import 'package:flutter/material.dart';

import 'flight_to_music.dart';

class MusicScroll extends StatefulWidget {
  const MusicScroll({super.key, required this.myItem});
  final MusicFlyModelList myItem;

  @override
  State<MusicScroll> createState() => _MusicScrollState();
}

class _MusicScrollState extends State<MusicScroll> {
  final List<String> imageUrls = [
    'lib/core/assets/images/music_1.png',
    'lib/core/assets/images/music_3.png',
    'lib/core/assets/images/music_2.png'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.myItem.music.length,
      itemBuilder: (context, index) {
        return FlightToMusic(
            myItem: widget.myItem.music[index], imageUrl: imageUrls[index]);
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
