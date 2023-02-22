import 'dart:async';
import 'dart:io';

import 'package:Veris/core/models/study_module_model.dart';
import 'package:Veris/core/models/study_section_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class ModuleDatabaseProvider {
  static final ModuleDatabaseProvider db = ModuleDatabaseProvider();
  late Database _database;
  bool _dbReady = false;

  Future<Database> get database async {
    if (_dbReady) {
      return _database;
    }
    _database = await getDatabaseInstance();
    _dbReady = true;
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "study-protocol-local-11.db");
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE StudyTask ("
          "id integer primary key AUTOINCREMENT,"
          "uuid TEXT,"
          "moduleIndex integer,"
          "studyId TEXT,"
          "name TEXT,"
          "type TEXT,"
          "hidden integer,"
          "unlockAfter TEXT,"
          "sticky integer,"
          "stickyLabel TEXT,"
          "alertTitle TEXT,"
          "alertMessage TEXT,"
          "timeout integer,"
          "timeoutAfter integer,"
          "time TEXT,"
          "locale TEXT,"
          "completed integer,"
          "options TEXT"
          ")");
      await db.execute("CREATE TABLE StudySection ("
          "id integer primary key AUTOINCREMENT,"
          "moduleId TEXT,"
          "name TEXT,"
          "questions TEXT,"
          "completedAt TEXT"
          ")");
    });
  }

  // Methods for working with module db
  addStudyTaskToDatabase(StudyTask module) async {
    final db = await database;
    var raw = await db.insert(
      "StudyTask",
      module.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updateStudyTask(StudyTask module) async {
    final db = await database;
    var response = await db.update("StudyTask", module.toMap(),
        where: "id = ?", whereArgs: [module.id]);
    return response;
  }

  Future<StudyTask?> getStudyTaskById(int id) async {
    final db = await database;
    var response =
        await db.query("StudyTask", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? StudyTask.fromMap(response.first) : null;
  }

  Future<List<StudyTask>> getAllStudyTasks() async {
    final db = await database;
    var response = await db.query("StudyTask");
    List<StudyTask> list = response.map((c) => StudyTask.fromMap(c)).toList();
    return list;
  }

  deleteStudyTaskWithId(int id) async {
    final db = await database;
    return db.delete("StudyTask", where: "id = ?", whereArgs: [id]);
  }

  deleteAllStudyTasks() async {
    final db = await database;
    db.delete("StudyTask");
  }

  // Methods for working with section db
  addStudySectionToDatabase(StudySection module) async {
    final db = await database;
    var raw = await db.insert(
      "StudySection",
      module.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updateStudySection(StudySection module) async {
    final db = await database;
    var response = await db.update("StudySection", module.toMap(),
        where: "id = ?", whereArgs: [module.id]);
    return response;
  }

  Future<StudySection?> getStudySectionById(int id) async {
    final db = await database;
    var response =
        await db.query("StudySection", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? StudySection.fromMap(response.first) : null;
  }

  Future<List<StudySection>> getAllStudySectionsByModuleId(
      String moduleId) async {
    final db = await database;
    var response = await db
        .query("StudySection", where: "moduleId = ?", whereArgs: [moduleId]);
    List<StudySection> list =
        response.map((c) => StudySection.fromMap(c)).toList();
    return list;
  }

  deleteStudySectionWithId(int id) async {
    final db = await database;
    return db.delete("StudySection", where: "id = ?", whereArgs: [id]);
  }

  deleteAllStudySections() async {
    final db = await database;
    db.delete("StudySection");
  }
}
