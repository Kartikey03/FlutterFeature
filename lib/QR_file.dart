import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeDisplay extends StatefulWidget {
  final String message;
  final String title;
  final String assetImagePath;
  final double qrSize;
  final double embeddedImageSize;
  final Color qrColor;
  final Color emptyColor;
  final TextStyle? messageStyle;
  final Widget loadingWidget;

  const QRCodeDisplay({
    super.key,
    required this.message,
    this.title = "QR Code Display",
    this.assetImagePath = 'assets/images/ln.png',
    this.qrSize = 300.0,
    this.embeddedImageSize = 70.0,
    this.qrColor = Colors.black,
    this.emptyColor = Colors.white70,
    this.messageStyle,
    this.loadingWidget = const CircularProgressIndicator(),
  });

  @override
  _QRCodeDisplayState createState() => _QRCodeDisplayState();
}

class _QRCodeDisplayState extends State<QRCodeDisplay> {
  Future<ui.Image> _loadImage() async {
    final completer = Completer<ui.Image>();
    try {
      final data = await rootBundle.load(widget.assetImagePath);
      ui.decodeImageFromList(data.buffer.asUint8List(), completer.complete);
    } catch (e) {
      completer.completeError('Failed to load image: $e');
    }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final qrCode = FutureBuilder(
      future: _loadImage(),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: widget.qrSize,
            width: widget.qrSize,
            child: Center(
              child: Text('Error loading image: ${snapshot.error}'),
            ),
          );
        }

        if (!snapshot.hasData) {
          return SizedBox(
            height: widget.qrSize,
            width: widget.qrSize,
            child: Center(child: widget.loadingWidget),
          );
        }

        return CustomPaint(
          size: Size.square(widget.qrSize),
          painter: QrPainter(
            data: widget.message,
            version: QrVersions.auto,
            color: widget.qrColor,
            emptyColor: widget.emptyColor,
            embeddedImage: snapshot.data,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size.square(widget.embeddedImageSize),
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.qrSize,
              child: qrCode,
            ),
            const SizedBox(height: 30),
            Text(
              widget.message,
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