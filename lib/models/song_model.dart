class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  const Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
});

  static List<Song> songs = [
    const Song(
        title: 'Attention',
        description: 'Attention',
        url: 'assets/music/attention.mp3',
        coverUrl: 'assets/images/attention.jpeg',
    ),
    const Song(
        title: 'Freedom',
        description: 'Freedom',
        url: 'assets/music/freedom.mp3',
        coverUrl: 'assets/images/freedom.jpeg',
    ),
    const Song(
        title: 'Love',
        description: 'Love',
        url: 'assets/music/love.mp3',
        coverUrl: 'assets/images/love.jpeg',
    ),
    const Song(
      title: 'Nature',
      description: 'Nature',
      url: 'assets/music/nature.mp3',
      coverUrl: 'assets/images/nature.jpeg',
    ),
    const Song(
      title: 'Chill',
      description: 'Chill',
      url: 'assets/music/Chill.mp3',
      coverUrl: 'assets/images/chill.jpeg',
    ),

  ];
}