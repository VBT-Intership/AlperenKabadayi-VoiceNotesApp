import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(VoiceNotes());
}

bool istapped = false;
int deger = 0;
int degermod = 0;
int degerreal = 0;

class VoiceNotes extends StatefulWidget {
  const VoiceNotes({
    Key key,
  }) : super(key: key);

  @override
  _VoiceNotesState createState() => _VoiceNotesState();
}

class _VoiceNotesState extends State<VoiceNotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Voice Notes " + " $istapped"),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: MainContainer(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                if (istapped) {
                  istapped = false;
                } else {
                  istapped = true;
                }

                deger++;
                degermod = deger % 2;
                degerreal += degermod;
              });
            },
            child: Icon(Icons.mic)),
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Visibility(visible: istapped, child: LottieAnimationWidget()),
        VoiceNotesText(),
        VoicesViewWidget()
      ],
    ));
  }
}

class VoicesViewWidget extends StatelessWidget {
  const VoicesViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 250,
        child: Expanded(
            flex: 2,
            child: Container(
                color: Colors.yellowAccent,
                child: Card(
                  child: Text("your total notes: " + "$degerreal "),
                ))));
  }
}

class VoiceNotesText extends StatelessWidget {
  const VoiceNotesText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        width: 200,
        color: Colors.blueAccent,
        child: Expanded(
          flex: 2,
          child: Container(
            child: Text("My Voice Notes"),
            alignment: Alignment.center,
          ),
        ));
  }
}

class LottieAnimationWidget extends StatelessWidget {
  const LottieAnimationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      color: Color(int.parse("0xfffefdca")),
      child: Expanded(
        flex: 2,
        child: Column(
          children: <Widget>[
            Container(
              width: 500,
              height: 100,
              color: Color(int.parse("0xfffefdca")),
              child: Lottie.asset("assets/record.json"),
            ),
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20.0)),
              // color: Colors.white,
              child: Text("recording: 10"),
            ),
          ],
        ),
      ),
    );
  }
}
