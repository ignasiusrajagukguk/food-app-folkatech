import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/colors.dart';
import 'package:food_app_folkatech/common/string_format/string_format.dart';
import 'package:food_app_folkatech/model/product_model.dart';
import 'package:food_app_folkatech/common/text_widget/text_widget.dart';

class JobListContent {
  static Widget foodCard(Product product, Function() onClick) {
    return InkWell(
        onTap: onClick,
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 8, left: 10, top: 8, right: 10),
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: ConstColors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: ConstColors.dark50.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ],
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product.cover ?? '',
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
              const SizedBox(
                height: 5,
              ),
              TextWidget.smallBold(product.name ?? ''),
              const SizedBox(
                height: 5,
              ),
              TextWidget.smallX(
                  'Rp. ${StringFormat.decimal(product.price ?? 0)}')
            ]),
          ),
        ));
  }
}
