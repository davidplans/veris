class StudyTask {
  int? id;
  String uuid;
  int moduleIndex;
  String studyId;
  String name;
  String type;
  int hidden;
  String unlockAfter;
  int sticky;
  String? stickyLabel;
  String? alertTitle;
  String? alertMessage;
  int timeout;
  int timeoutAfter;
  String time;
  String locale;
  int completed;
  String? options;

  StudyTask({
    this.id,
    required this.uuid,
    required this.moduleIndex,
    required this.studyId,
    required this.name,
    required this.type,
    required this.hidden,
    required this.unlockAfter,
    required this.sticky,
    required this.stickyLabel,
    required this.alertTitle,
    required this.alertMessage,
    required this.timeout,
    required this.timeoutAfter,
    required this.time,
    required this.locale,
    required this.completed,
    this.options,
  });

  factory StudyTask.fromMap(Map<String, dynamic> json) => StudyTask(
        id: json["id"],
        uuid: json["uuid"],
        moduleIndex: json["moduleIndex"],
        studyId: json["studyId"],
        name: json["name"],
        type: json["type"],
        hidden: json["hidden"],
        unlockAfter: json["unlockAfter"],
        sticky: json["sticky"],
        stickyLabel: json["stickyLabel"],
        alertTitle: json["alertTitle"],
        alertMessage: json["alertMessage"],
        timeout: json["timeout"],
        timeoutAfter: json["timeoutAfter"],
        time: json["time"],
        locale: json["locale"],
        completed: json["completed"],
        options: json["options"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "moduleIndex": moduleIndex,
        "studyId": studyId,
        "name": name,
        "type": type,
        "hidden": hidden,
        "unlockAfter": unlockAfter,
        "sticky": sticky,
        "stickyLabel": stickyLabel,
        "alertTitle": alertTitle,
        "alertMessage": alertMessage,
        "timeout": timeout,
        "timeoutAfter": timeoutAfter,
        "time": time,
        "locale": locale,
        "completed": completed,
        "options": options,
      };
}
