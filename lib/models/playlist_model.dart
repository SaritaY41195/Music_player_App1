import 'package:music_player_app1/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> song;
  final String imageUrl;

  const Playlist(
      {required this.title, required this.song, required this.imageUrl});

  static List<Playlist> playlists = [
   Playlist(
      title: "Hip Hop R&B Mix",
      song: Song.songs,
      imageUrl: 'https://fastly.picsum.photos/id/817/200/200.jpg?hmac=c7RMfV0IboK5oZwkIxQ9Ofx8Bml5x-j42i9DKdKrTwo',
    ),
    Playlist(
      title: "Rack & Roll",
      song: Song.songs,
      imageUrl: 'https://fastly.picsum.photos/id/43/200/200.jpg?hmac=gMoEYpdjrHoRnKoyIdtTknuqyCQDTC8exwLaKHpMv6E',

  ),
    Playlist(
      title: "Techno",
      song: Song.songs,
      imageUrl: 'https://fastly.picsum.photos/id/251/200/200.jpg?hmac=_yKttpPQLBisFkKPMRolKUyfZ89QQpENncPdrg8a1J0',
    ),
  ];
}