import 'package:block_project/featurs/home/data/data_model.dart';
import 'package:block_project/featurs/home/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel productDataModel;

  final HomeBloc homeBloc;
  const ProductCard({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Image.network(
              productDataModel.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(productDataModel.name,style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800
          ),),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price.toString()}',style:  TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800
              ),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductAddWishlistButtonEvent(clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductAddCartButtonEvent(clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
