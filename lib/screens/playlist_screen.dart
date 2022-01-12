import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(Icons.chevron_left, size: 20),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(Icons.chevron_right, size: 20),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              icon: Icon(Icons.account_circle_outlined),
              label: Text("Tijesunimi Adebiyi")),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(),
              icon: Icon(Icons.keyboard_arrow_down)),
          SizedBox(width: 20)
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFAF1018), Theme.of(context).backgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.3])),
        child: Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              children: [
                PlaylistHeader(playlist: widget.playlist),
                TracksList(tracks: widget.playlist.songs)
              ],
            )),
      ),
    );
  }
}
