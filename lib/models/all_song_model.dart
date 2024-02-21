import 'package:music_player_app1/models/song_model.dart';

class Allsongs{
  final String title;
  final List<Song> song;
  final String imageUrl;

  const Allsongs(
      {required this.title, required this.song, required this.imageUrl});
}

