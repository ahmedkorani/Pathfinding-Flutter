import 'dart:ui';

import 'package:flutter/material.dart';

import 'Constants.dart';

class Node {
  Color color;

  int x, y;

  bool isStartNode;
  bool isEndNode;

  static bool isStartNodePicked = false;
  static bool isEndNodePicked = false;

  Node({this.color, x, y}){
    isStartNode = false;
    isEndNode = false;
  }

  void setStartNode() {
    isStartNode = true;
    this.color =  startNodeColor;

    isStartNodePicked = true;
  }

  void setEndNode() {
    isEndNode = true;
    this.color = endNodeColor;

    isEndNodePicked = true;
  }

  void clearNode() {
    this.color = notSelectedTileColor;
    isStartNode = false;
    isEndNode = false;

    isStartNodePicked = false;
    isEndNodePicked = false;
  }
}
