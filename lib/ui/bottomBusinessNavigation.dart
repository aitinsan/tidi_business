import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tidi_business/ui/profile/profile.screen.dart';

import 'basket/basket.screen.dart';
import 'style/colors.dart';

class HomeBusiness extends StatefulWidget {
  @override
  _HomeBusinessState createState() => _HomeBusinessState();
}

class _HomeBusinessState extends State<HomeBusiness> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = BasketScreen(); // Our first view in viewport

  String barcodeScanRes = "";

  TextEditingController codeController = TextEditingController();

  Future<void> scanBarcodeNormal() async {
    try {
      barcodeScanRes =
          await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      if (barcodeScanRes == "-1") {
        barcodeScanRes = "Номер штрихкода";
      }
      codeController.text = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: HomeBankColor.red,
        child: Icon(Icons.add, color: HomeBankColor.white),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(43), topRight: Radius.circular(43)),
              ),
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 18,
                        left: 32,
                        right: 32,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(43), topRight: Radius.circular(43)),
                      color: HomeBankColor.red,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Добавить товар",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: HomeBankColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Опишите в подробностях",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: HomeBankColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                            color: HomeBankColor.white,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: HomeBankColor.red,
                                ),
                                Text(
                                  "Разместить фото",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: HomeBankColor.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              color: HomeBankColor.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              hintStyle: TextStyle(color: HomeBankColor.white),
                              fillColor: HomeBankColor.red,
                              focusColor: HomeBankColor.red,
                              hintText: 'Название продукта',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              color: HomeBankColor.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              hintStyle: TextStyle(color: HomeBankColor.white),
                              fillColor: HomeBankColor.red,
                              focusColor: HomeBankColor.red,
                              hintText: 'Стоимость',
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            scanBarcodeNormal();
                            print("hello");
                          },
                          child: IgnorePointer(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                readOnly: true,
                                controller: codeController,
                                style: TextStyle(
                                  color: HomeBankColor.white,
                                ),
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.qr_code_scanner_rounded,
                                    color: HomeBankColor.white,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: HomeBankColor.white, width: 1.0),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: HomeBankColor.white, width: 1.0),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  hintStyle: TextStyle(color: HomeBankColor.white),
                                  fillColor: HomeBankColor.red,
                                  focusColor: HomeBankColor.red,
                                  hintText: 'Номер штрихкода',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            minLines: 3,
                            maxLines: 5,
                            // allow user to enter 5 line in textfield
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color: HomeBankColor.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              hintStyle: TextStyle(color: HomeBankColor.white),
                              fillColor: HomeBankColor.red,
                              focusColor: HomeBankColor.red,
                              hintText: 'Описание продукта',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: HomeBankColor.white,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                color: HomeBankColor.red,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              BasketScreen(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icon/ic_busket.svg',
                            color: currentTab == 0 ? HomeBankColor.red : HomeBankColor.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Right Tab bar icons

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              ProfileScreen(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icon/ic_account.svg',
                            color: currentTab == 1 ? HomeBankColor.red : HomeBankColor.black,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeContainer extends StatelessWidget {
  final String code;
  final void Function() onTap;

  const CodeContainer({Key key, this.code, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: HomeBankColor.red,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: HomeBankColor.white, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                code,
                style: TextStyle(color: HomeBankColor.white),
              ),
              Icon(
                Icons.qr_code_scanner_rounded,
                color: HomeBankColor.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
