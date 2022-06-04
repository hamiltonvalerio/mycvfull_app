import 'package:flutter/material.dart';
import 'package:mycvfull_app/pages/contato/contato.dart';
import 'package:mycvfull_app/pages/curriculo/curriculo.dart';
import 'package:mycvfull_app/pages/experiencia/experiencia.dart';
import 'package:mycvfull_app/pages/formacao/formacao.dart';
import 'package:mycvfull_app/pages/home/home.dart';
import 'package:mycvfull_app/pages/login/login.dart';
import 'package:mycvfull_app/pages/sobre/sobre.dart';
import 'package:mycvfull_app/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ContatoPageRoute:
      return _getPageRoute(ContatoPage());
    case CurriculoPageRoute:
      return _getPageRoute(CurriculoPage());
    case ExperienciaPageRoute:
      return _getPageRoute(ExperienciaPage());
    case FormacaoPageRoute:
      return _getPageRoute(FormacaoPage());
    case HomePageRoute:
      return _getPageRoute(HomePage());
    case LoginPageRoute:
      return _getPageRoute(LoginPage());
    case SobrePageRoute:
      return _getPageRoute(SobrePage());
    default:
      return _getPageRoute(HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
