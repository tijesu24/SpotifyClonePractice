import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/_model.dart';
import 'package:flutter_spotify_ui/screens/playlist_screen.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/side_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(Size(700, 650));
  }
  runApp(ChangeNotifierProvider(
      create: (context) => CurrentTrackModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      scaffoldBackgroundColor: const Color(0xFF121212),
      backgroundColor: const Color(0xFF121212),
      primaryColor: Colors.black,
      // TODOaccentColor: const Color(0xFF1DB954),
      iconTheme: const IconThemeData().copyWith(color: Colors.white),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline2: const TextStyle(
          color: Colors.white,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 12.0,
          color: Colors.grey[300],
          fontWeight: FontWeight.w500,
          letterSpacing: 2.0,
        ),
        bodyText1: TextStyle(
          color: Colors.grey[300],
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
        bodyText2: TextStyle(
          color: Colors.grey[300],
          letterSpacing: 1.0,
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: themeData.copyWith(
          colorScheme:
              themeData.colorScheme.copyWith(secondary: Color(0xFF1DB954))),
      home: Shell(),
      themeMode: ThemeMode.dark,
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SideMenu(),
                Expanded(
                    child: PlaylistScreen(
                  playlist: lofihiphopPlaylist,
                ))
              ],
            ),
          ),
          CurrentTrack()
        ],
      ),
    );
  }
}
