import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qrcode',
      home: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  int tmr = 0;
  final img = QrImage(
    data: 'This is a simple QR code',
    version: QrVersions.auto,
    size: 200,
    backgroundColor: Colors.white,
    gapless: false,
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (tmr < 61) {
        setState(() {
          tmr++;
        });
      } else {
        tmr = 71;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR CODE GENERATOR'),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue,
        body: Center(
          child: tmr % 2 == 0 ? img : null,
        ));
  }
}
/*appBar: AppBar(
          title: Text('QR CODE GENERATOR'),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue,
        body: Center(
            child: tmr %2 == 0 ? QrImage(
          data: 'This is a simple QR code',
          version: QrVersions.auto,
          size: 200,
          backgroundColor: Colors.white,
          gapless: false,
        ): Text('safsaf') ,)

        int tmr = 10;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        tmr--;
      });
    })*/