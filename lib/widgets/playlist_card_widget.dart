import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/playlist_model.dart';
import '../screens/playlist.dart';

class PlaylistCardWidget extends StatefulWidget {
  const PlaylistCardWidget({
    super.key,
    required this.playLists,
  });

  final Playlist playLists;

  @override
  State<PlaylistCardWidget> createState() => _PlaylistCardWidgetState();
}

class _PlaylistCardWidgetState extends State<PlaylistCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaylistData(playLists: widget.playLists,)));
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xff870160).withOpacity(0.6),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                widget.playLists.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.playLists.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '${widget.playLists.song.length.toString()} songs',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ),
             const Icon(
                Icons.play_circle,
                color: Colors.white,
               size: 30,
              ),
          ],
        ),
      ),
    );
  }
}
