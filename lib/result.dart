import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

 const Result(this.resultScore, this.resetQuiz);

  String get resultText {
    String text;
    if (resultScore < 4) {
      text = 'Perfectly!';
    } else if (resultScore < 10) {
      text = 'You are awesome & innocent';
    } 
     else if (resultScore < 15) {
      text = 'You are really ... strange ???!!!';
    }else {
      text = 'Whyyyy :(';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: resetQuiz,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green[700] ?? Colors.lightGreenAccent),               
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}