import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Image.asset(
            playlist.imageURL,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYLIST",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(playlist.name,
                    style: Theme.of(context).textTheme.headline2),
                const SizedBox(
                  height: 16,
                ),
                Text(playlist.creator,
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    "Created by ${playlist.creator} ⦁ ${playlist.songs.length} songs, ${playlist.duration} ",
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        _PlaylistButton(followers: playlist.followers)
      ],
    );
  }
}

class _PlaylistButton extends StatelessWidget {
  final String followers;
  const _PlaylistButton({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                primary: Theme.of(context).iconTheme.color,
                textStyle: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontSize: 12, letterSpacing: 2)),
            onPressed: () {},
            child: Text("Play"))
      ],
    );
  }
}
