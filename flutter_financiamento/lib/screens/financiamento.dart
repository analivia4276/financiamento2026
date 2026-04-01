import 'package:flutter/material.dart';
import 'dart:math';

class Financiamento extends StatefulWidget {
  const Financiamento({super.key});

  @override
  State<Financiamento> createState() => _FinanciamentoState();
}

class _FinanciamentoState extends State<Financiamento> {
  double valor = 0.0;
  double juros = 0.0;
  int parcelas = 0;
  double taxas = 0.0;

  double calcularMontante() {
    double i = juros / 100;
    return (valor + taxas) * pow((1 + i), parcelas);
  }

  double calcularParcela() {
    if (parcelas == 0) return 0;
    return calcularMontante() / parcelas;
  }

  void resultado() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(
          "Valor total: R\$ ${calcularMontante().toStringAsFixed(2)}\n"
          "Valor da parcela: R\$ ${calcularParcela().toStringAsFixed(2)}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simulador de Financiamento"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Valor do financiamento"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  valor = double.tryParse(value) ?? 0.0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Taxa de juros (%)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  juros = double.tryParse(value) ?? 0.0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Número de parcelas"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  parcelas = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Taxas extras"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  taxas = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  resultado();
                },
                child: Text("Calcular"),
              ),
              SizedBox(height: 20),
              Text(
                "Valor total: R\$ ${calcularMontante().toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Valor da parcela: R\$ ${calcularParcela().toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Sair"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}