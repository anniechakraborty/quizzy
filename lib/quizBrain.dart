import 'questions.dart';
// underscore in front of a variable name makes the variable private. We do this so that the variable cannot be accessed
// outside of the class and also so that it's values cannot be changed.
class QuizBrain{

  int _questionNumber = 0;
  int _questionBankLength = 0;
  List<Questions> _questions = [
    Questions(q : 'Q1 : You can lead a cow downstairs but not upstairs', a:  false),
    Questions(q : 'Q2 : Approximately one quarter of human bones are in the feet', a: true),
    Questions(q : 'Q3 : A slug\'s blood is green', a: true),
    Questions(q : 'Q4 : Some cats are actually allergic to humans', a: true),
    Questions(q : 'Q5 : Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a : true),
    Questions(q : 'Q6 : It is illegal to pee in the Ocean in Portugal.', a : true),
    Questions(q : 'Q7 : No piece of square dry paper can be folded in half more than 7 times.', a : false),
    Questions(q : 'Q8 : In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', a : true),
    Questions(q : 'Q9 : The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', a : false),
    Questions(q : 'Q10 : The total surface area of two human lungs is approximately 70 square metres.', a : true),
    Questions(q : 'Q11 : Google was originally called \"Backrub\".', a : true),
    Questions(q : 'Q12 : Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', a : true),
    Questions(q : 'Q13 : In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', a : true)
  ];
  void incrementQuestion(){
    int q = questionLength();
    if(_questionNumber < q - 1){      //checking if teh question bank has any more questions to serve
      _questionNumber++;
    }
  }
  int questionLength(){
    _questionBankLength = _questions.length;
    return _questionBankLength;
  }
  int getCurrentQuestionNumber(){
    return _questionNumber;
  }
  void setCurrentQuestion(int value){
    _questionNumber = value;
  }
  String getQuestion(){
    return _questions[_questionNumber].question;
  }
  bool getAnswer(){
    return _questions[_questionNumber].answer;
  }
}