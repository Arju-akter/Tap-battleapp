import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redScore = 50;
  int bluScore = 50;

  void blueScoreUpdate() {
    setState(() {
      bluScore += 1;
      redScore -= 1;
    });
  }

  void restartGame() {
    setState(() {
      bluScore = 50;
      redScore = 50;
    });
  }

  void redScoreUpdate() {
    setState(() {
      redScore += 1;
      bluScore -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redScore,
                  child: InkWell(
                    onTap: redScoreUpdate,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  flex: bluScore,
                  child: InkWell(
                    onTap: blueScoreUpdate,
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            if (redScore >= 100 || bluScore >= 100)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.purple.withOpacity(0.5),
                child: Center(
                  child: Text(
                    "${redScore >= 100 ? "Red" : "Blue"} won",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                ),
              ),
            Container(),
            Center(
              child: ElevatedButton(
                onPressed: restartGame,
                child: Text("Restart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
