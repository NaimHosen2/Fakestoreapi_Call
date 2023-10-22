import 'package:fakestoreapi/Api.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  int id;
  ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Deteils"),
      ),
      body: FutureBuilder(
        future: ProductService().getSingleProducts(widget.id ),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                child: Image.network(snapshot.data["image"]),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
