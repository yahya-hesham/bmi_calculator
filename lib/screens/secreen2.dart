import 'package:flutter/material.dart';
//import 'screen1.dart';

class Secreen2 extends StatelessWidget {
  final double bmi;
  final String avg;
  final List avgNames;
  const Secreen2({
    super.key,
    required this.bmi,
    required this.avg,
    required this.avgNames,
  });

  String getFeedbackText(String avg) {
    if (avg == avgNames[0] || avg == avgNames[1] || avg == avgNames[2]) {
      return "Eat More";
    } else if (avg == avgNames[3]) {
      return "Great job ! Keep it up!";
    } else {
      return "Eat Less";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0a0c21),
      appBar: AppBar(
        title: Text("Bmi Result", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0a0c21),
        centerTitle: true,
        automaticallyImplyLeading: false,
        
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(avg, style: TextStyle(color: Color(0xFF68eeac), fontSize: 30)),
            SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              getFeedbackText(avg),
              style: TextStyle(color: Color(0xFF92939c), fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
