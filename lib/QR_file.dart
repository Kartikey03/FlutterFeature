import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AnimatedQRCodeDisplay extends StatefulWidget {
  final String message;
  final String title;
  final double qrSize;
  final Color qrColor;
  final Color emptyColor;
  final TextStyle? messageStyle;
  final Widget backWidget;

  const AnimatedQRCodeDisplay({
    super.key,
    required this.message,
    this.title = "QR Code Display",
    this.qrSize = 300.0,
    this.qrColor = Colors.black,
    this.emptyColor = Colors.white70,
    this.messageStyle,
    this.backWidget = const Center(
      child: Text(
        'Tap to scan',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  });

  @override
  _AnimatedQRCodeDisplayState createState() => _AnimatedQRCodeDisplayState();
}

class _AnimatedQRCodeDisplayState extends State<AnimatedQRCodeDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showingQR = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: 1.0, // Start with the controller at the end
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    setState(() {
      if (_showingQR) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _showingQR = !_showingQR;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleCard,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi * _controller.value),
                    alignment: Alignment.center,
                    child: _controller.value >= 0.5
                        ? Transform(
                            transform: Matrix4.identity()..rotateY(pi),
                            alignment: Alignment.center,
                            child: Card(
                              elevation: 8,
                              child: Container(
                                width: widget.qrSize,
                                height: widget.qrSize,
                                padding: const EdgeInsets.all(16),
                                child: widget.backWidget,
                              ),
                            ),
                          )
                        : Card(
                            elevation: 8,
                            child: Container(
                              width: widget.qrSize,
                              height: widget.qrSize,
                              padding: const EdgeInsets.all(16),
                              child: CustomPaint(
                                size: Size.square(widget.qrSize),
                                painter: QrPainter(
                                  data: widget.message,
                                  version: QrVersions.auto,
                                  color: widget.qrColor,
                                  emptyColor: widget.emptyColor,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _showingQR ? widget.message : 'Tap card to reveal QR code',
              style: widget.messageStyle ??
                  const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
