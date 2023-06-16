import 'package:flutter/material.dart';
import 'CardPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Product> _products = [
    Product('Blusa Rosa', 50.0),
    Product('Calça Jeans', 120.0),
    Product('Sobretudo', 300.0),
    Product('Salto alto', 150.0),
    Product('Relogio', 400.0),
    Product('Brinco', 80.0),
    Product('Colar', 90.0)
  ];
  List<Product> _selectedProducts = [];

  void _addToCart(Product product) {
    setState(() {
      _selectedProducts.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F9), // Cor de fundo da tela
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 90),
            Text(
              'Escolha seu visual:',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFFCF4D6F),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = _products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$ ${product.price.toStringAsFixed(2)}'),
                    trailing: ElevatedButton(
                      onPressed: () => _addToCart(product),
                      child: Text('Adicionar'),
                    ),
                  );
                },
              ),
            ),
            if (_selectedProducts.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CardPage(selectedProducts: _selectedProducts)),
                  );
                },
                child: Text('Ir para o Carrinho'),
              ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}
