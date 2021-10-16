import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tidi_business/ui/products/products.screen.dart';

import '../style/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBankColor.lightest_grey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image(
                          image: AssetImage("assets/image/im_avatar.jpg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    "Tamina Temirkhan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: HomeBankColor.black,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  buildRequestTablet(
                      icon: "assets/icon/ic_contact.svg",
                      title: "Контактная информация",
                      onClick: () {}),
                  buildRequestTablet(
                      icon: "assets/icon/ic_funding.svg",
                      title: "Товары",
                      onClick: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ProductsScreen()));
                      }),
                  buildRequestTablet(
                      icon: "assets/icon/ic_bank.svg", title: "О банке", onClick: () {}),
                  buildRequestTablet(
                      icon: "assets/icon/ic_settings.svg", title: "Настройки", onClick: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRequestTablet({String icon, String title, void Function() onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: ListTile(
            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            leading: SvgPicture.asset(icon),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: HomeBankColor.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: HomeBankColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
