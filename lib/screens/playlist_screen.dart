import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlaylistHeaderScreen extends StatelessWidget {
  const PlaylistHeaderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Playlists",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: (){}, child: Text("View More", style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontWeight: FontWeight.bold),),),
      ],
    );
  }
}