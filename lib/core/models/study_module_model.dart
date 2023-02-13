class StudyModule {
  int? id;
  String studyId;
  String uuid;
  String name;
  String type;
  String condition;
  String alerts;
  String unlockAfter;
  String? options;

  StudyModule({
    this.id,
    required this.studyId,
    required this.uuid,
    required this.name,
    required this.type,
    required this.condition,
    required this.alerts,
    required this.unlockAfter,
    this.options,
  });

  factory StudyModule.fromMap(Map<String, dynamic> json) => StudyModule(
        id: json["id"],
        studyId: json["studyId"],
        uuid: json["uuid"],
        name: json["name"],
        type: json["type"],
        condition: json["condition"],
        alerts: json["alerts"],
        unlockAfter: json["unlockAfter"],
        options: json["options"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "studyId": studyId,
        "uuid": uuid,
        "name": name,
        "type": type,
        "condition": condition,
        "alerts": alerts,
        "unlockAfter": unlockAfter,
        "options": options,
      };
}
