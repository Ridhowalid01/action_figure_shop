import 'package:action_figure_shop/icons/status_badge.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

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
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            // 'Explore ${MediaQuery.of(context).size.width}',
            "Details",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                icon: Icon(
                  isFavourite ? Icons.favorite_outlined : Icons.favorite_outline,
                  color: Colors.black,
                  size: 32,
                )),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 16, left: 10, bottom: 8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              itemCount: 5,
              controller: _pageController,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/elaina-wedding.webp",
                    fit: BoxFit.contain,
                  ),
                );
              },
            )),
            const SizedBox(
              height: 10,
            ),
            DotsIndicator(
              dotsCount: 5,
              position: _currentPage,
              decorator: DotsDecorator(
                activeColor: Colors.blueAccent,
                color: Colors.black,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Nama Produk wkwkwk',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
                            ],
                          )
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: StatusBadge(status: "Ready"),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
