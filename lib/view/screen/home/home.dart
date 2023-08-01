import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/colors.dart';
import 'package:food_app_folkatech/common/router/routes.dart';
import 'package:food_app_folkatech/provider/product_list_provider.dart';
import 'package:food_app_folkatech/view/screen/detail_pruduct/detail_product.dart';
import 'package:food_app_folkatech/view/widget/food_card.dart';
import 'package:food_app_folkatech/view/widget/refresh_indicator.dart';
import 'package:food_app_folkatech/view/widget/sliding_up_menu.dart';
import 'package:provider/provider.dart';
import 'package:food_app_folkatech/common/text_widget/text_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ProductListProvider>(context, listen: false).getAllProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ConstColors.white,
            leadingWidth: 64,
            titleSpacing: 0,
            title: Center(
              child: TextWidget.mainBold(
                'List Food',
              ),
            ),
          ),
          body: SlidingUpPanel(
            header: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 5,
                width: 134,
                decoration: BoxDecoration(
                  color: ConstColors.gray30,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            slideDirection: SlideDirection.UP,
            parallaxEnabled: true,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            collapsed: SlidingUpMenu(
              isCollapsed: true,
            ),
            panelBuilder: (sc) {
              return SlidingUpMenu(
                isCollapsed: false,
              );
            },
            body: CupertinoPageScaffold(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        image: AssetImage('assets/images/food_bg.jpeg'),
                        fit: BoxFit.cover)),
                child: Consumer<ProductListProvider>(
                    builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return RefreshIndicatorWidget.main(
                    onRefresh: () =>
                        Provider.of<ProductListProvider>(context, listen: false)
                            .getAllProduct(),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: GridView.builder(
                        itemCount: provider.productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return JobListContent.foodCard(
                              provider.productList[index],
                              () => Navigator.pushNamed(
                                  context, Routes.detailProduct,
                                  arguments: ProductDetailArgument(
                                      product: provider.productList[index])));
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),
          )),
    );
  }
}
