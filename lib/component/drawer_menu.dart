import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view_model/ui.dart';

const kTitle = 'Author: Tuanh';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UI>(
      builder: (context, ui, child) {
        return Drawer(
          child: Container(
            color: ui.colorGrey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: ui.colorBlack,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                          width: 200,
                          height: 80,
                          child: Image(
                              image: NetworkImage(Constants.urlLogo),
                              fit: BoxFit.cover)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            kTitle.toUpperCase(),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                letterSpacing: 2.0,
                                fontSize: ui.fontSize,
                                color: ui.colorWhite,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                getListTile(ui.colorWhite, 'HOME', onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.home);
                }),
                getLine(ui.colorBlack),
                getListTile(ui.colorWhite, 'ABOUT', onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.about);
                }),
                getLine(ui.colorBlack),
                getListTile(ui.colorWhite, 'SETTINGS', onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.settings);
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getLine(color) {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: color,
      ),
    );
  }

  Widget getListTile(color, title, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          letterSpacing: 1.0,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
