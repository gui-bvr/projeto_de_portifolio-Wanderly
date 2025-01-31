import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/splash-image.png',
            height: 250,
          ),
          SizedBox(height: 20),
          Text(
            'Bem vindo ao Wanderly!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 20),
          Text(
            'Um aplicativo de geração de roteiros de viagem personalizados, utilizando inteligência artificial para criar experiências únicas e adaptadas ao perfil de cada viajante.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 30),
          //         MaterialButton(
          //           elevation: 0,
          //           height: 50,
//            onPressed: () {
//              Get.to(LoginScreen()); // Navegação com GetX
          //           },
          //          color: Colors.green,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 20)),
          Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
      //         ),
      //       ],
      //     ),
    );
  }
}
