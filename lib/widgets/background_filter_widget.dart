import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BackgroundFilterWidget extends StatelessWidget {
  const BackgroundFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black.withOpacity(0.0),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),
              //Color(0xfff39060),
              // Color(0xffffb56b),
            ],
            stops: const [0.1, 0.4, 0.6]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff1f005c).withOpacity(0.8),
              Color(0xff5b0060).withOpacity(0.8),
              Color(0xff870160).withOpacity(0.8),
              Color(0xffac255e).withOpacity(0.8),
              Color(0xffca485c).withOpacity(0.8),
              Color(0xffe16b5c).withOpacity(0.8),
              //Color(0xfff39060),
              // Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
      ),
    );
  }
}