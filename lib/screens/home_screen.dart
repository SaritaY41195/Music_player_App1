import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../commom/custom_appbar.dart';
import '../models/playlist_model.dart';
import '../models/song_model.dart';
import '../widgets/Song_card_widget.dart';
import '../widgets/discover_screen.dart';
import '../widgets/playlist_card_widget.dart';
import '../widgets/section_header_screen.dart';
import 'Profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Song> songs = Song.songs;
  List<Playlist> playLists = Playlist.playlists;

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
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff9f006c),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined),
              label: 'Profile',
              activeIcon: ProfileScreen(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold,color: Colors.white,),
                    ),
                    Text(
                      "Enjoy your favourite music",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold,color: Colors.white,),
                    ),
                    const SizedBox(height: 30.0,),
                    const DiscoverScreen(),
                    const SizedBox(height: 15.0,),
                    Column(
                      children: [
                        SectorHeaderScreen(title: "Trending music",),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.27,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: songs.length,
                              itemBuilder: (context, index){
                                return SongCard(songs: songs[index]);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              SectorHeaderScreen(title: "Playlists",),
                              ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 10.0),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: playLists.length,
                                  itemBuilder: (context, index){
                                    return PlaylistCardWidget(playLists: playLists[index]);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







