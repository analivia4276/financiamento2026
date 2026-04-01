import 'package:flutter/material.dart';
import 'financiamento.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/logo.jpg",
                width: 150,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                child: Text("Entrar"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Financiamento(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}