import '../../../common_ui/Widgets/rating_bar.dart';
import '../../../common_ui/cards/product_details_card.dart';
import '../../../data/models/product.dart';
import 'package:flutter/material.dart';


class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce'),
        leading: BackButton(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsCard(product: product),
                SizedBox(height: 8),
                Text(
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 4),
                Text(product.description, style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                SizedBox(height: 10),
                Text(
                  "Price : \$${product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 12),
                Text(
                  "Colors : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                SizedBox(height: 40, child: colorsSlider()),
                SizedBox(height: 20),
                addToCartButton(),
                SizedBox(height: 4),
                buyNowButton(),
                SizedBox(height: 8),
                Divider(),
                Text(
                  " Reviews (300)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 4),
                RatingsBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buyNowButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Buy Now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container addToCartButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Add To Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  ListView colorsSlider() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.red,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.green,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
