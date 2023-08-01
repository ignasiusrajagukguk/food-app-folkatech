import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/colors.dart';
import 'package:food_app_folkatech/common/string_format/string_format.dart';
import 'package:food_app_folkatech/model/product_model.dart';
import 'package:food_app_folkatech/common/text_widget/text_widget.dart';
import 'package:food_app_folkatech/view/widget/ratings.dart';

class ProductDetailArgument {
  Product? product;

  ProductDetailArgument({required this.product});
}

class ProductDetail extends StatefulWidget {
  final ProductDetailArgument argument;
  const ProductDetail({super.key, required this.argument});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstColors.white,
        leadingWidth: 64,
        titleSpacing: 0,
        title: TextWidget.mainBold(
          widget.argument.product?.name ?? '',
        ),
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: ConstColors.dark50,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.argument.product?.cover ?? '',
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('assets/images/empty_food.png');
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                TextWidget.mediumBold(
                  "Rp. ${StringFormat.decimal(widget.argument.product?.price ?? 0)}",
                ),
                const SizedBox(height: 10),
                const Ratings(),
                const SizedBox(height: 20),
                TextWidget.smallBold('Description :'),
                TextWidget.smallXParagraph(
                  "${widget.argument.product?.desc}",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
