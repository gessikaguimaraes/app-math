import 'package:app_math/app/shared/components/cutom_appbar.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:flutter/material.dart';

// class Header extends StatefulWidget {
//   @override
//   _HeaderState createState() => _HeaderState();
// }

class HeaderAppBar extends PreferredSize {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      // preferredSize: Size.fromHeight(kToolbarHeight + 50),
      child: ClipPath(
        clipper: CustomAppBar(),
        child: Container(
          color: Colors.cyan[600],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      '',
                      // 'Home',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.only(right: 150),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      //color: ColorConst.vermelho,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/configuracao",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
