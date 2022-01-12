import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? currentSong;
  void selectSong(Song selected) {
    currentSong = selected;
    notifyListeners();
  }
}
