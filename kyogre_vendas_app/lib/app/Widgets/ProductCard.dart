import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productDescription;
  final double productPrice;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: 380,
            height: 170,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    productImage,
                    width: 80,
                    height: 150,
                  ),
                ),
                Container(
                  width: 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productDescription,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${productPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),

                        //!Change here
                        const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.minus,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
