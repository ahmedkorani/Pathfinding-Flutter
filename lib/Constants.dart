import 'package:flutter/material.dart';

const appTitle = 'Pathfinding Visualizer';

/*
  This function converts colors,
  from hexadecimal form to integers used by flutter,
  review these StackOverFlow questions for better understanding.

  First Link:
  https://stackoverflow.com/questions/50381968/flutter-dart-convert-hex-color-string-to-color/50382196

  Second Link:
  https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
 */
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

// App bar color
final appBarColor = hexToColor('#34495e');

//Background color
final backgroundColor = hexToColor('#bfe0f9');

final selectedTileColor = hexToColor('#0c3547');

final notSelectedTileColor = hexToColor('#ffffff');

final buttonColor = hexToColor('#48c9b0');

final startNodeColor = Colors.green;

final endNodeColor = Colors.red;