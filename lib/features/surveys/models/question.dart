class Question {
  String question_id;
  String question_text;
  String question_type;
  // List questions;
  bool isRequired;
  bool isModal;
  bool isRadio;
  bool isShuffle;
  // List suggestions;
  Question(
      {required this.question_text,
      required this.question_id,
      required this.question_type,
      // this.questions,
      this.isRequired = false,
      this.isRadio = false,
      this.isModal = false,
      this.isShuffle = false});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    return Question(
      question_id: parsedJson['id'],
      question_text: parsedJson['text'],
      question_type: parsedJson['type'],
      // questions: parsedJson['options'],
      isRequired: parsedJson['required'],
      isRadio: parsedJson['radio'] == null ? false : parsedJson['radio'],
      isModal: parsedJson['modal'] == null ? false : parsedJson['modal'],
      isShuffle: parsedJson['shuffle'] == null ? false : parsedJson['shuffle'],
      // studentName: parsedJson['name'],
      // studentScores: parsedJson['score']
    );
  }
}
