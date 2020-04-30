import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'quizBrain.dart';
// TO ACCESS THE QUESTIONS IN THE QUIZ_BRAIN FILE WE NED TO CREATE A QUIZ_BRAIN OBJECT
QuizBrain quizBrain = QuizBrain();
void main(){
  runApp(
    Quizzy(),
  );
}

class Quizzy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo.shade700,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade900,
          title: Text(
            'Quizzy',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontFamily: 'AbrilFatface'
            ),
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void playSound(){
    //play a correct sound when the right answer is pressed
    //play a buzzed no sound when an incorrect answer is pressed
  }
  List<Icon> scoreKeeper = [];  //Has a list of Icons that keep the score
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Center(
            child: Container(
              child: Text(
                quizBrain.questions[questionNumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ), // has the questions container
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green.shade400,
              textColor: Colors.white,
              onPressed: (){
                bool correctAnswer = quizBrain.questions[questionNumber].answer;
                if(correctAnswer == true){
                  print('the user got it right');
                }
                else{
                  print('the user got it wrong');
                }
                setState(() {
                  //The user pressed true. We will do something here
                  questionNumber++;
                });
                playSound();
              },
              child: Text(
                'True',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ),
        ), // the true button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red.shade400,
              textColor: Colors.white,
              onPressed: (){
                bool correctAnswer = quizBrain.questions[questionNumber].answer;
                if(correctAnswer == false){
                  print('the user got it right');
                }
                else{
                  print('the user got it wrong');
                }
                setState(() {
                  //The user pressed false. We will do something here
                });
                questionNumber = questionNumber + 1;
                playSound();
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ), // the false button
        Row(
          children: scoreKeeper,
        )

      ],
    );
  }
}