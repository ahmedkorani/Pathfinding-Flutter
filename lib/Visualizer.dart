import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pathfinding_flutter/Constants.dart';
import 'package:pathfinding_flutter/CustomRenderWidget.dart';

import 'Node.dart';

class Visualizer extends StatefulWidget {
  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<Visualizer> {
  final key = GlobalKey();

  List<List<Node>> mazeMatrix;
  int iMazeLength;
  int jMazeLength;

  @override
  void initState() {
    iMazeLength = 20;
    jMazeLength = iMazeLength * iMazeLength;
    mazeMatrix = new List.generate(iMazeLength, (_) => List(jMazeLength));

    for (int i = 0; i < iMazeLength; i++)
      for (int j = 0; j < jMazeLength; j++)
        mazeMatrix[i][j] = new Node(color: notSelectedTileColor);

    super.initState();
  }

  Widget appBar() {
    return AppBar(
      title: Text(appTitle),
      backgroundColor: appBarColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          tooltip: "Reset Board",
          onPressed: () {
            _clearSelectedTiles();
          },
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          tooltip: "Start Pathfinding",
          onPressed: () {},
        ),
      ],
    );
  }

  _detectTapedItem(PointerEvent event) {
    final RenderBox box = key.currentContext.findRenderObject();
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);

    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        final target = hit.target;

        if (target is CustomRenderBox) {
          final int index = target.index;
          int x, y = 0;
          x = (index / iMazeLength).floor();
          y = (index % iMazeLength);

          if (mazeMatrix[x][y].color == notSelectedTileColor) {
            setState(() {
              mazeMatrix[x][y].color = selectedTileColor;
            });
          }
          //To delete tiles
//          else if (mazeMatrix[x][y].color == selectedTileColor){
//            setState(() {
//              mazeMatrix[x][y].color = notSelectedTileColor;
//            });
//          }
        }
      }
    }
  }

  void _clearSelectedTiles() {
    mazeMatrix.forEach((List<Node> list) {
      list.forEach((Node node) {
        setState(() {
          node.clearNode();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: backgroundColor,
      body: Listener(
        onPointerDown: _detectTapedItem,
        onPointerMove: _detectTapedItem,
        child: GridView.builder(
          key: key,
          itemCount: jMazeLength,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: iMazeLength,
            childAspectRatio: 100 / 145,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            int x, y = 0;
            x = (index / iMazeLength).floor();
            y = (index % iMazeLength);
            mazeMatrix[x][y].x = x;
            mazeMatrix[x][y].y = y;
            return CustomRenderWidget(
              index: index,
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    if (!Node.isStartNodePicked)
                      mazeMatrix[x][y].setStartNode();
                    else if(!Node.isEndNodePicked)
                      mazeMatrix[x][y].setEndNode();
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.ease,//TODO Change the animation
                  duration: Duration(milliseconds: 500),
                  color: mazeMatrix[x][y].color,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
