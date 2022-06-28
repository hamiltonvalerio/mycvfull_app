import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycvfull_app/constants/style.dart';
import 'package:mycvfull_app/pages/admin/admin.dart';
import 'package:mycvfull_app/services/auth_service.dart';
import 'package:mycvfull_app/widgets/custom_text.dart';
import 'package:mycvfull_app/routing/routes.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<int> attemptLogIn(String username, String password) async {
    var authService = await AuthService.getInstance();
    return authService!.authenticateUser(username, password);
  }

  _acessarAdminPage(BuildContext context, String username) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AdminHomePage(username: username)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Painel de administração",
                    color: lightGrey,
                    size: 30,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      CustomText(
                        text: "Lembrar",
                        color: Colors.black,
                        size: 14,
                        weight: FontWeight.normal,
                      ),
                    ],
                  ),
                  CustomText(
                    text: "Recuperar senha!",
                    color: active,
                    size: 14,
                    weight: FontWeight.normal,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  var username = _usernameController.text;
                  var statusCode =
                      await attemptLogIn(username, _passwordController.text);
                  if (statusCode == 200) {
                    _acessarAdminPage(context, username);
                  } else {
                    displayDialog(
                        context, "Erro:", "Login ou senha não conferem.");
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: active, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Login",
                    color: Colors.white,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getNameRoute() => "Login";
}
