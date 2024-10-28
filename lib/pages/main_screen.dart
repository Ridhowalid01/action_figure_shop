import 'package:action_figure_shop/pages/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:action_figure_shop/models/product_list.dart';
import 'package:action_figure_shop/icons/status_badge.dart';
import 'package:action_figure_shop/utils/dimensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    // print("Current height is "+ MediaQuery.of(context).size.height.toString());
    // print("Current height is "+ MediaQuery.of(context).size.width.toString());
    // print(Dimensions.height10);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: Dimensions.toolbarHeight60,
          title: Padding(
            padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10),
            child: Text(
              // 'Explore ${MediaQuery.of(context).size.width}',
              "Explore",
              style: TextStyle(
                  fontSize: Dimensions.font26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height16, right: Dimensions.width10, bottom: Dimensions.height8),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                  icon: Icon(
                    isGridView ? Icons.list : Icons.grid_view_outlined,
                    color: Colors.black,
                    size: Dimensions.iconSize32,
                  )),
            ),
          ],
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return isGridView
                ? const ProductGridView(gridCount: 2)
                : const ProductListView();
          } else if (constraints.maxWidth <= 800) {
            return const ProductGridView(
              gridCount: 3,
            );
          } else if (constraints.maxWidth <= 1100) {
            return const ProductGridView(
              gridCount: 4,
            );
          } else if (constraints.maxWidth <= 1400) {
            return const ProductGridView(
              gridCount: 5,
            );
          } else {
            return const ProductGridView(
              gridCount: 6,
            );
          }
        }));
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height20),
      child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final Product product = productList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(product: product,);
                }));
              },
              child: Card(
                color: Colors.white,
                elevation: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.height5),
                          child: Hero(
                              tag: "thumbnail-${product.id}",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(Dimensions.radius10),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset(
                                    product.imageThumbnail,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              )),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.height8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.font20,
                                    color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Text(
                                'IDR ${product.price}',
                                style: TextStyle(
                                    fontSize: Dimensions.font18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatusBadge(status: product.status),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: Dimensions.iconSize20,
                                      ),
                                      Text(
                                        product.rating.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: Dimensions.font14,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.gridCount});

  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height8),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: Dimensions.height12,
        mainAxisSpacing: Dimensions.width12,
        childAspectRatio: 0.65,
        children: productList.map((product) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(product: product,);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Hero(
                          tag: "thumbnail-${product.id}",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                product.imageThumbnail,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.height3),
                        child: SizedBox(
                            child: StatusBadge(
                          status: product.status,
                          minWidthBox: Dimensions.width80,
                          maxWidthBox: Dimensions.width120,
                          statusFontSize: Dimensions.font12,
                          horizontalPadding: Dimensions.width6,
                          verticalPadding: Dimensions.height2,
                        )),
                      )
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.height8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: Dimensions.font20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'IDR ${product.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: Dimensions.iconSize20,
                                ),
                                Text(product.rating.toStringAsFixed(1))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
