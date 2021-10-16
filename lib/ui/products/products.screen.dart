import 'package:flutter/material.dart';
import 'package:tidi_business/ui/style/colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HomeBankColor.lightest_grey,
        title: Text(
          "Запросы на покупку",
          style: TextStyle(
            color: HomeBankColor.black,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: HomeBankColor.black,
            )),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildProductCard(
              image: "assets/image/im_product.png",
              title: "Minavi Headseat Pro Gaming",
              name: "Alex",
              iin: "001100330044",
              stars: index + 1,
            );
          }),
    );
  }

  Widget buildProductCard({String image, String title, String name, String iin, int stars}) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10,
        shadowColor: HomeBankColor.black,
        color: HomeBankColor.white,
        child: Container(
          height: 131,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: HomeBankColor.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))),
                  height: 131,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HomeBankColor.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: HomeBankColor.black,
                            ),
                          ),
                          Text(
                            iin,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: HomeBankColor.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 36,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              radius: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: HomeBankColor.red,
                                  borderRadius: BorderRadius.all(Radius.circular(32)),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Center(
                                    child: Text(
                                      "Подробно",
                                      style: TextStyle(
                                        color: HomeBankColor.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
