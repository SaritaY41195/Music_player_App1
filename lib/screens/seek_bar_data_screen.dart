import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SeekBarDataScreen {
  final Duration position;
  final Duration duration;

  const SeekBarDataScreen({required this.position, required this.duration});
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;
  const SeekBar(
      {super.key,
      required this.position,
      required this.duration,
      this.onChanged,
      this.onChangedEnd});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;

  String _formateDuration(Duration?  duration){
    if(duration == null){
      return '--:--';
    }
    else{
      String minutes = duration.inMinutes.toString().padLeft(2,'0');
      String seconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formateDuration(widget.position), style:const TextStyle(color: Colors.white),),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 5,
              thumbShape: const RoundSliderThumbShape(
                disabledThumbRadius: 4.0,
                enabledThumbRadius: 4.0,
              ),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 10,
              ),
              activeTrackColor: Colors.white.withOpacity(0.2),
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.white,
              overlayColor: Colors.white,
            ),
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(
                _dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble(),
              ),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if(widget.onChanged != null){
                  widget.onChanged!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
              },
              onChangeEnd: (value){
                setState(() {
                  _dragValue = value;
                });
                if(widget.onChangedEnd != null){
                  widget.onChangedEnd!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        Text(_formateDuration(widget.duration), style:const TextStyle(color: Colors.white),),
      ],
    );
  }
}
