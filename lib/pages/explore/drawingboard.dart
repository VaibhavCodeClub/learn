import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawingBoardPage extends StatelessWidget {
  const DrawingBoardPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DrawingBoard();
  }
}

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({Key? key}) : super(key: key);

  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  bool isEraser = false;
  List<DrawingPoint?> drawingPoints = [];
  List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawing Board"),
        actions: [
          TextButton.icon(
            onPressed: () => setState(() => drawingPoints = []),
            icon: Icon(Icons.clear),
            label: Text("Clear Board"),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xfff7f2fa),
            ),
        ),
          SizedBox(
            width: 10,
          ),
        ],
    ),

      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = isEraser? Color(0xfffef7ff) : selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              });
            },

            onPanUpdate: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = isEraser? Color(0xfffef7ff) : selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              });
            },

            onPanEnd: (details) {
              setState(() {
                drawingPoints.add(null);
              });
            },

            child: CustomPaint(
              painter: _DrawingPainter(drawingPoints),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),

          Positioned(
            top: 20,
            right: 10,
            left: 10,
            child: Row(
              children: [
                Slider(
                  min: 0,
                  max: 40,
                  value: strokeWidth,
                  onChanged: (val) => setState(() => strokeWidth = val),
                ),
                SizedBox(
                    width: 50
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isEraser =!isEraser;
                      if (isEraser) {
                        selectedColor = Color(0xfffef7ff);
                      }
                    });
                  },
                    icon: Icon(FontAwesomeIcons.eraser),
                  label: Text("Eraser"),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              colors.length,
                  (index) => _buildColorChoser(colors[index]),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildColorChoser(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
          isEraser = false;
        });
      },
      child: Container(
        height: isSelected ? 47 : 40,
        width: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
            color: Colors.white,
            width: 3,
          )
              : null,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> drawingPoints;

  _DrawingPainter(this.drawingPoints);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(
          drawingPoints[i]!.offset,
          drawingPoints[i + 1]!.offset,
          drawingPoints[i]!.paint,
        );
      } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          [drawingPoints[i]!.offset],
          drawingPoints[i]!.paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}
