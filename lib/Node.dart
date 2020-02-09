import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pathfinding_flutter/Constants.dart';
import 'package:pathfinding_flutter/Position.dart';

class Node {
  Color color;

  Position position;

  int g, h, f;

  bool isStartNode;
  bool isEndNode;

  //TODO remove these static variables from here, because they don't belong to this class
  static bool isStartNodePicked = false;
  static bool isEndNodePicked = false;

  Node(this.color, this.position) {
    isStartNode = false;
    isEndNode = false;
    this.g = 0;
    this.h = 0;
    this.f = 0;
  }

  void setStartNode() {
    isStartNode = true;
    this.color = startNodeColor;

    isStartNodePicked = true;
  }

  void setEndNode() {
    isEndNode = true;
    this.color = endNodeColor;

    isEndNodePicked = true;
  }

  //TODO fix this function after removing static variables
  void clearNode() {
    this.color = notSelectedTileColor;
    isStartNode = false;
    isEndNode = false;

    isStartNodePicked = false;
    isEndNodePicked = false;
  }
}
