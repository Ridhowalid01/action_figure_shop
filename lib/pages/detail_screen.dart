import 'package:action_figure_shop/icons/status_badge.dart';
import 'package:action_figure_shop/models/product_list.dart';
import 'package:action_figure_shop/utils/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 900) {
        return DetailMobileScreen(product: product);
      } else {
        return DetailWebScreen(product: product);
      }
    });
  }
}

class DetailMobileScreen extends StatefulWidget {
  const DetailMobileScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailMobileScreen> createState() => _DetailMobileScreenState();
}

class _DetailMobileScreenState extends State<DetailMobileScreen> {
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
          padding: EdgeInsets.only(
              top: Dimensions.height20, bottom: Dimensions.height10),
          child: Text(
            // 'Explore ${MediaQuery.of(context).size.width}',
            "Details",
            style: TextStyle(
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height8,
                right: Dimensions.width10,
                bottom: Dimensions.height8),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ShowDialogScreen();
                      });
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: Dimensions.iconSize32,
                )),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height8,
              left: Dimensions.width10,
              bottom: Dimensions.height8),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height10),
          child: Column(
            children: [
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double imageHeight = constraints.maxWidth;
                return Stack(
                  children: [
                    SizedBox(
                      height: imageHeight,
                      child: PageView.builder(
                        itemCount: widget.product.imageUrls.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                            child: index == 0
                                ? Hero(
                                    tag: "thumbnail-${widget.product.id}",
                                    child: Image.network(
                                      widget.product.imageUrls[index],
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.error,
                                          size: Dimensions.iconSize32,
                                        );
                                      },
                                    ),
                                  )
                                : Image.network(
                                    widget.product.imageUrls[index],
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.error,
                                        size: Dimensions.iconSize32,
                                      );
                                    },
                                  ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.height20,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                        dotsCount: widget.product.imageUrls.length,
                        position: _currentPage.toInt(),
                        decorator: DotsDecorator(
                          activeColor: Colors.black.withOpacity(1),
                          color: Colors.black.withOpacity(0),
                          size: Size.square(Dimensions.height8),
                          activeSize:
                              Size(Dimensions.width16, Dimensions.height8),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.7),
                                width: 1.5),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius5),
                          ),
                          activeShape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black.withOpacity(1), width: 1.5),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius5),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
              Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: Dimensions.height10),
                    Text(
                      widget.product.name,
                      style: TextStyle(
                          fontSize: Dimensions.font18,
                          fontWeight: FontWeight.bold,
                          height: 1.2),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: Dimensions.height10),

                    // Row untuk rating, reviews, dan total sold
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: Dimensions.font20,
                            ),
                            Text(widget.product.rating.toStringAsFixed(1)),
                            SizedBox(width: Dimensions.width10),
                            const Text("|"),
                            SizedBox(width: Dimensions.width10),
                            Text("${widget.product.totalReviews} Reviews"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: Dimensions.iconSize20,
                            ),
                            SizedBox(width: Dimensions.width10),
                            Text("${widget.product.totalSold} Sold"),
                          ],
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
                        ),
                      ],
                    ),

                    // Deskripsi produk
                    SizedBox(height: Dimensions.height10),
                    Text(
                      "Description :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Text(
                          " • Characters : ",
                          style: TextStyle(fontSize: Dimensions.font16),
                        ),
                        Text(
                          widget.product.nameCharacter,
                          style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height5),
                    Row(
                      children: [
                        Text(
                          " • Series : ",
                          style: TextStyle(fontSize: Dimensions.font16),
                        ),
                        Flexible(
                          child: Text(
                            widget.product.nameSeries,
                            style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height5),
                    Row(
                      children: [
                        Text(
                          " • Source images : ",
                          style: TextStyle(fontSize: Dimensions.font16),
                        ),
                        Flexible(
                          child: Text(
                            "kyou.id",
                            style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10),
                    Text(
                        widget.product.textDescription,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height120,
        padding: EdgeInsets.only(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius10 * 2),
              topRight: Radius.circular(Dimensions.radius10 * 2),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(Dimensions.height10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: Dimensions.font14),
                  ),
                  // SizedBox(
                  //   height: Dimensions.height5,
                  // ),
                  Text(
                    "IDR ${widget.product.price}",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ShowDialogScreen(
                        titleText: "Item telah ditambahkan",
                        contentText: "",
                      );
                    });
              },
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: const Color(0xFF304047)),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: Dimensions.iconSize24,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.width16,
                      ),
                      Text(
                        'Add Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font20,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebScreen extends StatefulWidget {
  const DetailWebScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailWebScreen> createState() => _DetailWebScreenState();
}

class _DetailWebScreenState extends State<DetailWebScreen> {
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

  void _nextImage() {
    if (_currentPage < widget.product.imageUrls.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousImage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
        child: Center(
          child: Card(
            elevation: 2,
            child: SizedBox(
                width: 1200,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: Stack(
                            children: [
                              PageView.builder(
                                itemCount: widget.product.imageUrls.length,
                                controller: _pageController,
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: AspectRatio(
                                      aspectRatio: 1, // Membuat gambar menjadi persegi
                                      child: index == 0
                                          ? Hero(
                                        tag: "thumbnail-${widget.product.id}",
                                        child: Image.network(
                                          widget.product.imageUrls[index],
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.error,
                                              size: 32,
                                            );
                                          },
                                        ),
                                      )
                                          : Image.network(
                                        widget.product.imageUrls[index],
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.error,
                                            size: 32,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 60,
                                left: 0,
                                right: 0,
                                child: DotsIndicator(
                                  dotsCount: widget.product.imageUrls.length,
                                  position: _currentPage.toInt(),
                                  decorator: DotsDecorator(
                                    activeColor: Colors.black.withOpacity(1),
                                    color: Colors.black.withOpacity(0),
                                    size: const Size.square(8),
                                    activeSize: const Size(16, 8),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.white.withOpacity(0.7), width: 1.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeShape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black.withOpacity(1), width: 1.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: MediaQuery.of(context).size.height * 0.45,
                                child: IconButton.filled(
                                  padding: const EdgeInsets.all(12),
                                  onPressed: _previousImage,
                                  autofocus: true,
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                                  color: Colors.black,
                                  iconSize: 20,
                                  hoverColor: Colors.white,
                                  splashColor: Colors.black,
                                  splashRadius: 5,
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white.withOpacity(0.5)),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: MediaQuery.of(context).size.height * 0.45,
                                child: IconButton.filled(
                                  padding: const EdgeInsets.all(12),
                                  onPressed: _nextImage,
                                  autofocus: true,
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                                  color: Colors.black,
                                  iconSize: 20,
                                  hoverColor: Colors.white,
                                  splashColor: Colors.black,
                                  splashRadius: 5,
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white.withOpacity(0.5)),
                                ),
                              ),
                            ],
                          )

                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom:
                                            BorderSide(color: Colors.grey))),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const StatusBadge(
                                          status: 'Ready',
                                          minWidthBox: 120,
                                          maxWidthBox: 150,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          widget.product.name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 20,
                                                ),
                                                Text(widget.product.rating
                                                    .toStringAsFixed(1)),
                                                const SizedBox(width: 10),
                                                const Text("|"),
                                                const SizedBox(width: 10),
                                                Text(
                                                    "${widget.product.totalReviews} Reviews"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.shopping_cart_outlined,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                    "${widget.product.totalSold} Sold"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                          BorderSide(color: Colors.grey))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "IDR ${widget.product.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    isFavourite = !isFavourite;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        isFavourite ? Icons.favorite_outlined : Icons.favorite_outline,
                                                        size: 24,
                                                        color: Colors.black,
                                                      ),
                                                      if (MediaQuery.of(context).size.width > 1300) ...[
                                                        const SizedBox(
                                                          width: 16,
                                                        ),
                                                        const Text(
                                                          "Add to favourite",
                                                          style: TextStyle(
                                                              fontSize: 16
                                                          ),
                                                        )
                                                      ]
                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                onTap: (){
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return const ShowDialogScreen(
                                                          titleText: "Item telah ditambahkan",
                                                          contentText: "",
                                                        );
                                                      }
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFF304047),
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                  child: const Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.shopping_cart_outlined,
                                                        size: 24,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Text(
                                                        "Add to cart",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Description :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Text(
                                          " • Characters : ",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          widget.product.nameCharacter,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Text(
                                          " • Series : ",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.product.nameSeries,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Row(
                                      children: [
                                        Text(
                                          " • Source images : ",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "kyou.id",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        widget.product.textDescription,
                                      textAlign: TextAlign.justify,
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class ShowDialogScreen extends StatelessWidget {
  const ShowDialogScreen({
    super.key,
    this.titleText = "Fitur Belum Tersedia",
    this.contentText = "Maaf fitur ini masih tahap pengembangan"
  });

  final String titleText;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Dimensions.font20,
          fontWeight: FontWeight.bold
        ),
      ),
      content: Text(
        contentText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: Dimensions.font16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Ok",
          ),
        )
      ],
    );
  }
}
