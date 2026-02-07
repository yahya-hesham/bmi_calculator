import 'package:bmi_calculator/screens/secreen2.dart';
import 'package:flutter/material.dart';
//import 'dart:async'; // Required for Timer

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int count = 0;

  Color activeColor = Color(0xFFeb1555);
  Color inactiveColor = Color(0xFF1d1e33);

  int selectedGender = 0;

  double height = 170;

  int age = 0;

  int weight = 60;

  double bmi = 0;
  void bmiCalculate(double h, int w) {
    double heightMeters = h / 100;
    bmi = w / (heightMeters * heightMeters);
  }

  List<String> avgNames = [
    'SEVERE THININNESS',
    'MODERATE THININNESS',
    'MILD THININNESS',
    'NORMAL',
    'OVERWEIGHT',
    'OBESE CLASS I',
    'OBESE CLASS II',
    'OBESE CLASS III',
  ];
  String avg = 'normal';
  void avgCalculate(double bmi) {
    if (bmi < 16) {
      avg = avgNames[0];
    } else if ( bmi < 17) {
      avg = avgNames[1];
    } else if (bmi < 18.5) {
      avg = avgNames[2];
    } else if (bmi < 25) {
      avg = avgNames[3];
    } else if (bmi < 30) {
      avg = avgNames[4];
    } else if (bmi < 35) {
      avg = avgNames[5];
    } else if ( bmi < 40) {
      avg = avgNames[6];
    } else {
      avg = avgNames[7];
    }
  }

  //////////////////////////////////////////////// ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0a0c21),
      appBar: AppBar(
        title: Center(
          child: Text("Bmi Calculator", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color(0xFF0a0c21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  },
                  child: Container(
                    width: 180,
                    height: 200,
                    decoration: BoxDecoration(
                      color: selectedGender == 1 ? activeColor : inactiveColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.male_rounded,
                          size: 150,
                          color: Colors.white,
                        ),

                        Text(
                          "male",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 2;
                    });
                  },
                  child: Container(
                    width: 180,
                    height: 200,
                    decoration: BoxDecoration(
                      color: selectedGender == 2 ? activeColor : inactiveColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.female_sharp,
                          size: 150,
                          color: Colors.white,
                        ),

                        Text(
                          "female",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 380,
              height: 180,
              decoration: BoxDecoration(
                color: inactiveColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "$height cm",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        //trackHeight: 2,
                        //thumbShape: RoundSliderThumbShape(
                        //enabledThumbRadius: 15.0,
                        //),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                        thumbColor: Color(0xFFeb1555),
                        activeTrackColor: Color(0xFFeb1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 130,
                        max: 230,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round().toDouble();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ///////////////////////////////////////////////////////////////////
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 180,
                  height: 200,
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Age",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "$age",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Row(
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              elevation: 6,
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF313255),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            Spacer(),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              elevation: 6,
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF313255),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 180,
                  height: 200,
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 10),

                        Text(
                          "weight",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "$weight",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),

                        Row(
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF313255),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            Spacer(),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              elevation: 6,
                              constraints: BoxConstraints.tightFor(
                                height: 50,
                                width: 50,
                              ),
                              fillColor: Color(0xFF313255),
                              shape: CircleBorder(),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    bmiCalculate(height, weight);
                    avgCalculate(bmi);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Secreen2(bmi: bmi, avg: avg, avgNames: avgNames),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(375, 70),
                    backgroundColor: activeColor,
                  ),
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
