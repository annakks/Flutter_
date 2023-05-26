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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100),
          Text(
            'Selecione os Produtos:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}
