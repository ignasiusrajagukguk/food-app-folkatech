import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/colors.dart';
import 'package:food_app_folkatech/common/text_widget/text_widget.dart';

class SlidingUpMenu extends StatelessWidget {
  final bool isCollapsed;
  SlidingUpMenu({super.key, required this.isCollapsed});

  final List iconList = [
    {'title': 'Candy', 'asset': 'assets/images/candy.png'},
    {'title': 'Chocolate', 'asset': 'assets/images/chocolate.png'},
    {'title': 'Coffee', 'asset': 'assets/images/coffee.png'},
    {'title': 'Drink', 'asset': 'assets/images/drink.png'},
    {'title': 'Rice', 'asset': 'assets/images/rice.png'},
    {'title': 'Salad', 'asset': 'assets/images/salad.png'},
    {'title': 'Steak', 'asset': 'assets/images/steak.png'},
    {'title': 'Doughnut', 'asset': 'assets/images/doughnut.png'},
    {'title': 'Pizza', 'asset': 'assets/images/pizza.png'},
    {'title': 'Fruits', 'asset': 'assets/images/fruits.png'},
    {'title': 'Sambal', 'asset': 'assets/images/sambal.png'},
    {'title': 'Cheese', 'asset': 'assets/images/cheese.png'},
    {'title': 'Nuts', 'asset': 'assets/images/nuts.png'},
  ];

  @override
  Widget build(BuildContext context) {
    if (isCollapsed) return collapsedWidget(context);
    return expandedWidget();
  }

  Widget collapsedWidget(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ConstColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Container(
                height: 5,
                width: 134,
                decoration: BoxDecoration(
                  color: ConstColors.gray30,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                collapsedMenu(0),
                collapsedMenu(1),
                collapsedMenu(2),
                collapsedMenu(3),
              ],
            ),
          ],
        ));
  }

  Widget expandedWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        TextWidget.mainBold('Our Menu'),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: ConstColors.green20,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              children: <Widget>[
                ...iconList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Image.asset(
                                e['asset'],
                                height: 30,
                              ),
                            ),
                          ),
                          TextWidget.smallXX(e['title'])
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget collapsedMenu(int index) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Image.asset(
                iconList[index]['asset'],
                height: 30,
              ),
            ),
          ),
          TextWidget.smallXX(iconList[index]['title'])
        ],
      ),
    );
  }
}
