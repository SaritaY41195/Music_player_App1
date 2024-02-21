import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song_model.dart';
import '../widgets/background_filter_widget.dart';
import '../widgets/music_player_widget.dart';
import 'seek_bar_data_screen.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  final Song song;
  const SongScreen({super.key, required this.song});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  // Song song = Song.songs[0];

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
          children: [
        AudioSource.uri(
            Uri.parse('asset:///${widget.song.url}'),),
      ]),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarDataScreen> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarDataScreen>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarDataScreen(
          position: position,
          duration: duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.song.coverUrl,
            fit: BoxFit.cover,
          ),
          const BackgroundFilterWidget(),
          MusicPlayer(
              song: widget.song,
              seekBarDataStream: _seekBarDataStream,
              audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}

