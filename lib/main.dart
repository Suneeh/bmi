import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  int age = 21;
  double height = 1.65;
  double weight = 65;
  double bmi = 0;

  void calcBmi() {
    bmi = weight / (height * height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
              child: Text(
                "Herzlich willkommen zu Suneeh's BMI Kalkulator",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: Text(
                "Das ist meine erste Flutter App - gebaut mit ein paar sehr interessanten Widgets. Geschlecht und Alter spielen aktuell noch keine Rolle, da es im Internet kaum Informationen dazu gibt, wie sei den BMI beeinflussen. Den Code hierzu findest du in meinem GitHub: github.com/Suneeh/bmi",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Geschlecht",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip3D(
                  onSelected: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  onUnSelected: () {},
                  selected: isMale == false,
                  child: const Icon(
                    Icons.female,
                    color: Colors.red,
                    size: 36.0,
                  ),
                ),
                ChoiceChip3D(
                  onSelected: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  onUnSelected: () {},
                  selected: isMale == true,
                  child: const Icon(
                    Icons.male,
                    color: Colors.blue,
                    size: 36.0,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Alter",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      age -= 1;
                      calcBmi();
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  age.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      age += 1;
                      calcBmi();
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Gewicht: $weight kg",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Slider(
              value: weight,
              min: 40,
              max: 140,
              onChanged: (double value) {
                setState(() {
                  weight = ((value * 10).round()) / 10;
                  calcBmi();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Größe: ${(height * 100).round() / 100} m",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Slider(
              value: height,
              min: 1.35,
              max: 2.15,
              onChanged: (double value) {
                setState(() {
                  height = value;
                  calcBmi();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Dein BMI ist ${((bmi * 10).round() / 10).toString()}",
                style: const TextStyle(fontSize: 35),
              ),
            )
          ],
        ),
      ),
    );
  }
}
