import 'package:flutter/material.dart';

import 'FinishPage.dart';
import 'DashboardPage.dart';

class CardPage extends StatefulWidget {
  final List<Product> selectedProducts;

  CardPage({required this.selectedProducts});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  Map<Product, int> _productQuantityMap = {};

  @override
  void initState() {
    super.initState();
    _updateProductQuantityMap();
  }

  void _updateProductQuantityMap() {
    _productQuantityMap.clear();
    for (var product in widget.selectedProducts) {
      if (_productQuantityMap.containsKey(product)) {
        _productQuantityMap[product] = _productQuantityMap[product]! + 1;
      } else {
        _productQuantityMap[product] = 1;
      }
    }
  }

  void _removeProduct(Product product) {
    setState(() {
      widget.selectedProducts.remove(product);
      _updateProductQuantityMap();
    });
  }

  void _clearSelection() {
    setState(() {
      widget.selectedProducts.clear();
      _updateProductQuantityMap();
    });
  }

  void _finish() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FinishPage(selectedProducts: widget.selectedProducts, totalPrice: _calculateTotalPrice())),
      );
  }

  double _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var entry in _productQuantityMap.entries) {
      var product = entry.key;
      var quantity = entry.value;
      totalPrice += product.price * quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seu Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _productQuantityMap.length,
              itemBuilder: (context, index) {
                final product = _productQuantityMap.keys.elementAt(index);
                final quantity = _productQuantityMap[product]!;
                return ListTile(
                  title: Text('${product.name} (Qtd: $quantity)'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeProduct(product),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Valor total da compra:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${_calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _clearSelection,
                  child: Text('Limpar'),
                ),
                ElevatedButton(
                  onPressed: _finish,
                  child: Text('Finalizar Comprar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
