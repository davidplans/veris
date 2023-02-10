class StudySection {
  int? id;
  String moduleId;
  String name;
  String? questions;
  String completedAt;

  StudySection({
    this.id,
    required this.moduleId,
    required this.name,
    this.questions,
    required this.completedAt,
  });

  factory StudySection.fromMap(Map<String, dynamic> json) => StudySection(
        id: json["id"],
        moduleId: json["moduleId"],
        name: json["name"],
        questions: json["questions"],
        completedAt: json["completedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "moduleId": moduleId,
        "name": name,
        "questions": questions,
        "completedAt": completedAt,
      };
}
