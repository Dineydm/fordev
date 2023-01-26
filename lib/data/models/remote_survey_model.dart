import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

import '../../data/http/http.dart';

class RemoteSurveyModel {
  final String id;
  final String question;
  final String date;
  final bool didAnswer;

  RemoteSurveyModel({
    @required this.id,
    @required this.question,
    @required this.date,
    @required this.didAnswer,
  });

  factory RemoteSurveyModel.fromJson(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['id', 'question', 'data', 'didAnswer'])) {
      throw HttpError.invalidData;
    }

    return RemoteSurveyModel(
      id: json['id'],
      question: json['question'],
      date: json['date'],
      didAnswer: json['didAnswer'],
    );
  }

  SurveyEntity toEntity() => SurveyEntity(
        id: this.id,
        question: this.question,
        dateTime: DateTime.parse(this.date),
        didAnswer: this.didAnswer,
      );
}
