import 'package:flutter/material.dart';
import 'package:test/page/DashboardPage.dart';

import 'LoginPage.dart';

class FinishPage extends StatelessWidget {
  final double totalPrice;

  FinishPage({required this.totalPrice, required List<Product> selectedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store,
              size: 80,
              color: Colors.pink,
            ),
            SizedBox(height: 16),
            Text(
              'Valor total da compra:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$ ${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Text(
              'Pedido Confirmado!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
