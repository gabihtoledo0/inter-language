import 'package:Inserdeaf/pages/primaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
// import 'models/user.dart';
// import 'models/interpreter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // iniciando banco de dados
  UserDao userDao = UserDao();
  InterpreterDao intepreterDao = InterpreterDao();
  // inserindo um usuário
  // userDao.insert(User(1, "Gabriela", "Toledo Prado", "gabi@gabi", "12345678", "11943567893", "Caieiras"));
  // intepreterDao.insert(Interpreter(1, "Felipe", "Oliveira", "felipe@felipe", "senha123", "11943567893", "São Paulo", "sou um estudante"));
  // inicializando o app
  runApp(LoginApp(
    userDao: userDao,
    interpreterDao: intepreterDao,
  ));
}

class LoginApp extends StatelessWidget {

  final UserDao userDao;
  final InterpreterDao interpreterDao;

  LoginApp({
    this.userDao,
    this.interpreterDao,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimaryScreen(),
    );
  }
}
