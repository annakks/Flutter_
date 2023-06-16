import 'package:flutter/material.dart';

import 'DashboardPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Simula validação de login
    if (username == 'annakks' && password == '1234') {
      // Navega para a tela de dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      // Exibe mensagem de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Login'),
          content: Text('Nome de usuário ou senha inválidos.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F9), // Cor dominante 60%
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.checkroom,
                size: 90,
                color: Color(0xFF8A003C), //// cor secundaria 30%
              ),
              SizedBox(height: 5),
              Text(
                'Boutique da Carol',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFA88FAC), /// cor secundária
                  shadows: [
                    Shadow(
                      color: Color(0xFF8A003C),
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Nome de usuário',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _login,
                child: Text('Logar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
