import 'package:flutter_application_1/model/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: constant_identifier_names
const String TBL_TODO = "tbl_todoList";

/// 안드로이드, iphone에는 공통으로 SQLite라는 RDBMS가 내장되어있다
/// 규모는 매우 작지만 phone에서 DB를 SQL 을 사용하여 관리할수 있도록
/// 여러가지 명령어를 제공한다
///  기본적인 기능만으로 다소 사용이 불편하여 sqflite.dart를 사용하여 관리한다
class TodoService {
  // 변수이름에 under score를 붙이면 이 변수는 private라는 의미
  // late 키워드는 아직 변수를 초기화 시키지 않았지만, 이 값은 null이 아니다라는 선언
  // 즉, 곧 이 변수는 누군가로 부터 초기화(값 부여)를 할 것이다
  late Database _database;
  final String createTable = """
  CREATE TABLE  $TBL_TODO(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sdate TEXT,
    stime TEXT,
    content TEXT,
    complete INTEGER
  )
  """;

  /// Future
  /// 함수(method)의 return type으로 사용하는 키워드
  /// 이 함수는 언젠가 실행될 것이고, return 값이 null 이 아니다라는 선언
  /// JS Promise 키워드와 같은 역할을 한다
  /// 비동동기 방식 함수에 주로 사용한다.

  // 보이드 리턴
  Future<void> onCreateTable(db, version) async {
    return db.execute(createTable);
  }

  Future<void> onUpgradeTable(db, oldVersion, newVersion) async {
    if (newVersion > oldVersion) {
      final db = await database;
      final batch = db.batch();
      batch.execute("DROP TABLE $TBL_TODO");
      batch.execute(createTable);
      await batch.commit();
    }
  }

  //Database 리턴
  Future<Database> initDatabase() async {
    // 실제 핸드폰에 DB가 저장되는 경로(path)가져오기
    String dbPath = await getDatabasesPath();
    // 저장될 database 파일 설정 -> create table
    var dbFile = join(dbPath, "todo.dbf");
    return await openDatabase(
      dbFile,
      onCreate: onCreateTable,
      onUpgrade: onUpgradeTable,
      version: 7,
    );
  }

  /// _database private 변수를 외부에서 사용하기 위한 getter method
  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  Future<int> insert(Todo todo) async {
    final db = await database;
    return await db.insert(TBL_TODO, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(TBL_TODO, where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    final db = await database;
    return db
        .update(TBL_TODO, todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
  }

// 비동기 방식으로 select 하여 데이터를 return 하고 있음
  Future<List<Todo>> selectAll() async {
    final db = await database;
    final List<Map<String, dynamic>> todoList = await db.query(TBL_TODO);
    // select한 데이터(resultSet)를 TodoList<Todo> 로 변환하기
    return List.generate(
      todoList.length,
      (index) => Todo(
        id: todoList[index]["id"],
        sdate: todoList[index]["sdate"],
        stime: todoList[index]["stime"],
        content: todoList[index]["content"],
        complete: todoList[index]["complete"] == 1 ? true : false,
      ),
    );
  }
}
