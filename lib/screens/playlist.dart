import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player_app1/screens/song_screen.dart';
import '../models/playlist_model.dart';

class PlaylistData extends StatefulWidget {
  final Playlist playLists;
  const PlaylistData({super.key, required this.playLists});

  @override
  State<PlaylistData> createState() => _PlaylistDataState();
}

class _PlaylistDataState extends State<PlaylistData> {
  bool isPlay = true;
  List<bool> _isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            //Color(0xfff39060),
            // Color(0xffffb56b),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Playlist', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.playLists.imageUrl,
                  height: 250,
                  width: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.playLists.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isPlay = !isPlay;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Container(
                  height: 35,
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Stack(children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      left:
                          isPlay ? 0 : MediaQuery.sizeOf(context).width * 0.4,
                      child: Container(
                        height: 35,
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xff5b0060),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Play',
                              style: TextStyle(
                                fontSize: 20,
                                color:
                                    isPlay ? Colors.white : Color(0xff5b0060),
                              ),
                            ),
                            Icon(
                              Icons.play_circle,
                              color: isPlay ? Colors.white : Color(0xff5b0060),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Shuffle',
                              style: TextStyle(
                                fontSize: 20,
                                color:
                                    isPlay ? Color(0xff5b0060) : Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.shuffle,
                              color: isPlay ? Color(0xff5b0060) : Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  child:
                      isPlay
                 ? ListView.builder(
                      itemCount: widget.playLists.song.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            width: MediaQuery.sizeOf(context).width * 0.15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.playLists.song[index].coverUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          title: Text(
                            widget.playLists.song[index].title,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            widget.playLists.song[index].description,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.white54),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SongScreen(song: widget.playLists.song[index])));
                            },
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ),
                        );
                      })
                 : ListView.builder(
                          itemCount: widget.playLists.song.length,
                          itemBuilder: (context, index) {
                            // var list = widget.playLists.song;
                            // final shuffleList = list.shuffle();
                            return ListTile(
                              leading: Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                width: MediaQuery.sizeOf(context).width * 0.15,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(widget.playLists.song[index].coverUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              title: Text(
                                widget.playLists.song[index].title,
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                widget.playLists.song[index].description,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.white54),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SongScreen(song: widget.playLists.song[index])));
                                },
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
