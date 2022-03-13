import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qrcode',
      home: MainScreen(),
    );
  }
}

/*class Qr {
  String qrCode;
  Qr({required this.qrCode});
}*/

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController t1 = TextEditingController();

  /*var rrow = Row(
    children: [
      // ignore: prefer_const_constructors
      TextField(),
      ElevatedButton(onPressed: null, child: null)
    ],
  );*/
  late String qrCode;
  @override
  void initState() {
    super.initState();
    t1.addListener(() {
      qrCode = t1.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR CODE GENERATOR'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Write your qr code data here",
              ),
              TextField(
                controller: t1,
              ),
              ElevatedButton(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.immersiveSticky);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Screen2(
                              qrCode: qrCode,
                            )));
                  },
                  child: Text("Create Qr Code"))
            ],
          ),
        )
        /*body: Center(
          child: tmr % 2 == 0 ? img : null,
        )*/
        );
  }
}

class Screen2 extends StatefulWidget {
  final String qrCode;
  const Screen2({Key? key, required this.qrCode}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int tmr = 0;
  /*final img = QrImage(
    data: widget.qrCode,
    version: QrVersions.auto,
    size: 200,
    backgroundColor: Colors.white,
    gapless: false,
  );*/
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (tmr < 61) {
        setState(() {
          tmr++;
        });
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainScreen()));
        tmr = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: tmr % 2 == 0
              ? QrImage(
                  data: widget.qrCode,
                  version: QrVersions.auto,
                  size: 200,
                  backgroundColor: Colors.white,
                  gapless: false,
                )
              : null,
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
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);