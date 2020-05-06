import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

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
  void playSound(bool answer){
    final player = AudioCache();
    if(answer == true){
      player.play('true.mp3');
    }
    else{
      player.play('false.mp3');
    }
  }
  Image alertImage(){
    double score = (100 * scoreCount) / quizBrain.questionLength();
    if(score > 80.0){
      return Image.asset('images/mirage-success.png');
    }
    else{
      return Image.asset('images/fogg-success-1.png');
    }
  }
  List<Icon> scoreKeeper = [];  //Has a list of Icons that keep the score
  int scoreCount = 0;
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if(quizBrain.getCurrentQuestionNumber() == quizBrain.questionLength() - 1){
        Alert(
            context: context,
            image : alertImage(),
            title: "Quizzy",
            desc: "You have reached the end of quiz. \n Your score : $scoreCount",
            buttons: [
            DialogButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "PLAY AGAIN!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              width: 150,
            )
          ],
        ).show();
        scoreKeeper = [];
        scoreCount = 0;
        quizBrain.setCurrentQuestion(0);
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
          scoreCount++;
          playSound(true);
        }
        else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
          playSound(false);
        }
        quizBrain.incrementQuestion();
      }
    });
  }

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
                quizBrain.getQuestion(),
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
                checkAnswer(true);
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
                checkAnswer(false);
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