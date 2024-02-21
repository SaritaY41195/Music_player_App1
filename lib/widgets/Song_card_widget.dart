import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/song_model.dart';
import '../screens/song_screen.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.songs,
  });

  final Song songs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(songs.coverUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 2,
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SongScreen(song: songs)));
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 10.0),
              width: MediaQuery.sizeOf(context).width * 0.37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(songs.title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,color: Colors.purple),),
                        Text(songs.description, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),),
                      ],
                    ),
                   const Icon(Icons.play_circle,color: Colors.purple,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
