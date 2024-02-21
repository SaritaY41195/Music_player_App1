import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_app1/widgets/player_button_widget.dart';
import '../models/song_model.dart';
import '../screens/seek_bar_data_screen.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    super.key,
    required Stream<SeekBarDataScreen> seekBarDataStream,
    required this.audioPlayer,required this.song,
  }) : _seekBarDataStream = seekBarDataStream;

  final Song song;
  final Stream<SeekBarDataScreen> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.title,  style: Theme.of(context)
          .textTheme.titleLarge!
          .copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
          Text(song.title,  style: Theme.of(context)
              .textTheme.titleSmall!
              .copyWith(color: Colors.white),),
          const SizedBox(height: 20,),
          StreamBuilder<SeekBarDataScreen>(
              stream: _seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChangedEnd: audioPlayer.seek,
                );
              }),
          PlayerButton(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.settings, color: Colors.white,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.cloud_download, color: Colors.white,)),
            ],
          ),
        ],
      ),
    );
  }
}


