import 'package:artistcommerce/models/product.dart';
import 'package:artistcommerce/pages/utils.dart';
import 'package:flutter/material.dart';

class ProductViewPage extends StatefulWidget {
  final Product product;
  const ProductViewPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  List<dynamic> productList = [];
  List<String> size = [
    "S",
    "M",
    "L",
    "XL",
  ];

  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    const Color(0xFFFFC1D9),
  ];

  int _selectedColor = 0;
  int _selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
                background: Image.network(
                  widget.product.imageURL,
                  fit: BoxFit.fitWidth,
                )),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(45),
                child: Transform.translate(
                  offset: const Offset(0, 1),
                  child: Container(
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                        child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.product.brand,
                              style: TextStyle(
                                color: Colors.orange.shade400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$ " + widget.product.price.toString() + '.00',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Take a look to this beautiful piece of art created by jagmohan Rai in his free time. Now it is on sale and if you purchase it then you will get a free complimentary gift as well ",
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.grey.shade800,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Background Color",
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: _selectedColor == index
                                      ? colors[index]
                                      : colors[index].withOpacity(0.5),
                                  shape: BoxShape.circle),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: _selectedColor == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : Container(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Canvas Size',
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: size.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: _selectedSize == index
                                      ? Colors.yellow[800]
                                      : Colors.grey.shade200,
                                  shape: BoxShape.circle),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  size[index],
                                  style: TextStyle(
                                      color: _selectedSize == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Utils.cartData.add(widget.product);
                        final snackbar = SnackBar(
                          backgroundColor: Colors.yellow[800],
                          content: const Text("Item added to cart"),
                          duration: const Duration(seconds: 1),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        Navigator.pop(context);
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.yellow[800],
                      child: const Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ))
          ])),
        ]),
      ),
    );
  }
}
