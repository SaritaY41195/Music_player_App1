import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButton extends StatefulWidget {
  const PlayerButton({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
            stream: widget.audioPlayer.sequenceStateStream,
            builder: (context, index){
          return IconButton(
              onPressed: widget.audioPlayer.hasPrevious
              ? widget.audioPlayer.seekToPrevious
              : null, icon: const Icon(Icons.skip_previous, color: Colors.white, size: 55,));
        }),
        StreamBuilder(
            stream: widget.audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final playerState = snapshot.data;
                final processingSate = playerState!.processingState;
                if (processingSate == ProcessingState.loading ||
                    processingSate == ProcessingState.buffering) {
                  return Container(
                    width: 64.0,
                    height: 64.0,
                    margin: const EdgeInsets.all(10.0),
                    child: const CircularProgressIndicator(),
                  );
                } else if (!widget.audioPlayer.playing) {
                  return IconButton(
                      onPressed: widget.audioPlayer.play,
                      iconSize: 75,
                      icon: const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                      ));
                } else if (processingSate == ProcessingState.completed){
                  return IconButton(
                      onPressed: () => widget.audioPlayer.seek(Duration.zero,
                          index: widget.audioPlayer.effectiveIndices!.first),
                      iconSize: 75,
                      icon: const Icon(
                        Icons.replay_circle_filled_outlined,
                        color: Colors.white,
                      ));
                }else {
                return IconButton(
                    onPressed: widget.audioPlayer.pause,
                    iconSize: 75,
                    icon: const Icon(
                      Icons.pause_circle,
                      color: Colors.white,
                    ));
              }
              } else {
                return const CircularProgressIndicator();
              }
            }),
        StreamBuilder<SequenceState?>(
            stream: widget.audioPlayer.sequenceStateStream,
            builder: (context, index){
              return IconButton(
                  onPressed: widget.audioPlayer.hasNext
                      ? widget.audioPlayer.seekToNext
                      : null, icon: const Icon(Icons.skip_next, color: Colors.white, size: 55,));
            }),
      ],
    );
  }
}