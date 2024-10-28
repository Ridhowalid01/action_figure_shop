import 'package:action_figure_shop/icons/status_badge.dart';
import 'package:action_figure_shop/models/product_list.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:action_figure_shop/utils/dimensions.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController _pageController = PageController();
  var _currentPage = 0.0;

  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
        // print("Current page value = " + _currentPage.toString());
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            "Details",
            style: TextStyle(
                fontSize: Dimensions.font26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(top:Dimensions.height16 , right: Dimensions.width10, bottom: Dimensions.height8),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: Dimensions.iconSize32,
                )),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(top: Dimensions.height16, left: Dimensions.width10, bottom: Dimensions.height8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: Dimensions.iconSize32,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.height10),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              itemCount: widget.product.imageUrls.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  child: index==0
                  ? Hero(
                    tag: "thumbnail-${widget.product.id}",
                    child: Image.network(
                      widget.product.imageUrls[index],
                      fit: BoxFit.cover,
                      // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      //   return Icon(
                      //       Icons.error,
                      //     size: Dimensions.iconSize32,
                      //   ); // tampilkan ikon error atau widget lainnya
                      // },
                    ),
                  ) : Image.network(
                    widget.product.imageUrls[index],
                    fit: BoxFit.cover,
                    // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    //   return Icon(
                    //       Icons.error,
                    //     size: Dimensions.iconSize32,
                    //   ); // tampilkan ikon error atau widget lainnya
                    // },
                  ),
                );
              },
            )),
            SizedBox(
              height: Dimensions.height10,
            ),
            DotsIndicator(
              dotsCount: widget.product.imageUrls.length,
              position: _currentPage,
              decorator: DotsDecorator(
                activeColor: Colors.black,
                color: Colors.white,
                size: Size.square(Dimensions.height8),
                activeSize: Size(Dimensions.width16, Dimensions.height8),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(Dimensions.radius5)),
                activeShape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(Dimensions.radius5)),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Expanded(
                child: Padding(
              padding:
                  EdgeInsets.all(Dimensions.height10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: Dimensions.font20,
                                      ),
                                      Text(widget.product.rating.toStringAsFixed(1)),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      const Text("|"),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      Text("${widget.product.totalReviews} Reviews")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        size: Dimensions.iconSize20,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      Text("${widget.product.totalSold} Sold")
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: StatusBadge(
                                  status: widget.product.status,
                                  minWidthBox: Dimensions.width80,
                                  maxWidthBox: Dimensions.width120,
                                  statusFontSize: Dimensions.font12,
                                  horizontalPadding: Dimensions.width6,
                                  verticalPadding: Dimensions.height2,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavourite = !isFavourite;
                                  });
                                },
                                icon: Icon(
                                  isFavourite
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_outline,
                                  size: Dimensions.iconSize24,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.height10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: Dimensions.font20),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          children: [
                            Text(
                              " • Characters : ",
                              style: TextStyle(fontSize: Dimensions.font14),
                            ),
                            Text(
                              widget.product.nameCharacter,
                              style: TextStyle(
                                  fontSize: Dimensions.font14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        Row(
                          children: [
                            Text(
                              " • Series : ",
                              style: TextStyle(fontSize: Dimensions.font14),
                            ),
                            Flexible(
                                child: Text(
                                  widget.product.nameSeries,
                                  style: TextStyle(
                                      fontSize: Dimensions.font14, fontWeight: FontWeight.bold),
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
