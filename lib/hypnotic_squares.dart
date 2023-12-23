import 'dart:math';

import 'package:flutter/material.dart';

class HypnoticSquare extends StatefulWidget {
  const HypnoticSquare({super.key});

  @override
  State<HypnoticSquare> createState() => _HypnoticSquareState();
}

class _HypnoticSquareState extends State<HypnoticSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(painter: HypnoticSquarePainter()),
    );
  }
}

class HypnoticSquarePainter extends CustomPainter {

  double initRectSize = 100;
  final int totalRect = 9;
  final int margin = 1;
  @override
  void paint(Canvas canvas, Size size) {
    initRectSize = (size.width / 15);
      for(double i = 0; i < size.width; i += initRectSize + margin){
        for(double j = 0; j < size.height; j += initRectSize + margin){
          _draw_square(canvas, i, j, initRectSize);
        }
      }
  }

  _draw_square(Canvas canvas, double x, double y, double width) {
    Random random = Random();
    if (width <= 1) return;
    Rect rect = Offset(x, y) & Size(width, width);
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth= 0.5
      ..color = _randomColor();
    canvas.drawRect(rect, paint);
    double sizeDeffer = (initRectSize / totalRect);
    x = x + (sizeDeffer / 2 * random.nextDouble() + 2);
    y = y + (sizeDeffer / 2 * random.nextDouble() + 2);
    return _draw_square(canvas, x, y, width - sizeDeffer);
  }

  Color _randomColor() {
    var palette = Colors.accents;
   // var palette = [const Color(0x86a789),const Color(0xb2c8ba),const Color(0xd2e3c8),const Color(0xebf3e8)];

    int randomIndex = Random().nextInt(palette.length);
    return palette[randomIndex];
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
