import 'package:flutter/material.dart';
import 'package:test/page/DashboardPage.dart';

import 'LoginPage.dart';

class FinishPage extends StatelessWidget {
  final double totalPrice;

  FinishPage({required this.totalPrice, required List<Product> selectedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F9), // Cor dominante 60%
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xFFCF4D6F)
        ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.checkroom,
                  size: 90,
                  color: Color(0xFF8A003C),
                ),
                SizedBox(height: 5),
                Text(
                  'Boutique da Carol',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFA88FAC),
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
                Text(
                  'Valor total da compra:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60),
                Text(
                  'Pedido Confirmado',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFCF4D6F),
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Agradedemos a Preferencia!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFCF4D6F),
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Voltar'),
                ),
              ],
            ),
          ),
        )
    );
  }
}
