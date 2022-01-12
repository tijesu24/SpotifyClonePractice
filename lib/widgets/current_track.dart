import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/_model.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.all(7),
      child: Row(
        children: [
          _TrackInfo(),
          const Spacer(),
          _PlayerControls(),
          const Spacer(),
          _OtherControls()
        ],
      ),
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().currentSong;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shuffle),
              padding: EdgeInsets.only(),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
              padding: EdgeInsets.only(),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_circle_outline),
              padding: EdgeInsets.only(),
              iconSize: 34,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
              padding: EdgeInsets.only(),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.repeat),
              padding: EdgeInsets.only(),
              iconSize: 20,
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),
                    color: Colors.grey[800])),
            SizedBox(
              width: 8,
            ),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().currentSong;
    if (selected == null)
      return const SizedBox(
        width: 40,
      );
    else
      return Row(
        children: [
          Image.asset(
            'assets/lofigirl.jpg',
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selected.title,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  selected.artist,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.grey[300], fontSize: 12),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded)),
        ],
      );
  }
}

class _OtherControls extends StatelessWidget {
  const _OtherControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.devices_outlined),
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.volume_up_outlined),
          iconSize: 20,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.grey[800])),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen),
          iconSize: 20,
        ),
      ],
    );
  }
}
