import 'package:inserdeaf/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:inserdeaf/data/database-helper.dart';

class UserDao {
  static const String tableSql =
      'CREATE TABLE $_tableUser($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_name TEXT, $_surname TEXT, $_email TEXT, $_senha TEXT, $_phone TEXT);';
  static const String _tableUser = 'Users';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _surname = 'surname';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _phone = 'phone';
  Future<int> save(User user) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = user.toMap();
    return db.insert(_tableUser, userMap);
  }

  // Future<int> saveUser(User user) async {
  //   final Database db = await getDatabase();
  //   print(user.name);
  //   int res = await db.insert('Users', user.toMap());
  //   List<Map> list = await db.rawQuery('SELECT * FROM Users');
  //   print(list);
  //   return res;
  // }
  Future<int> insert(User user) async {
    final Database db = await getDatabase();
    int id = await db.insert(_tableUser, user.toMap());
    print('inserted1: $id');
    return id;
  }

  Future<User> find(String email, String senha) async {
    final Database db = await getDatabase();
    List<Map> user = await db.query(_tableUser,
        columns: [_email, _senha],
        where: "$_email = ? and $_senha = ?",
        whereArgs: [email, senha]);
    //db.execute("SELECT user.email user.password FROM users WHERE user.email = email AND user.password = password") LIMIT 1;
    print("procurando usuário...");
    print(user);
    if (user.length >= 1)
      return User(
        user[0]['id'],
        user[0]['name'],
        user[0]['surname'],
        user[0]['email'],
        user[0]['senha'],
        user[0]['phone'],
      );
    return null;
  }

  Future<User> auth(String email, String senha) async {
    User hasUser = await find(email, senha);
    if (hasUser != null) return hasUser;
    return null;
  }
}