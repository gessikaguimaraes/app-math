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
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                offset: Offset(20.0, 10.0),
                blurRadius: 15.0,
              )
            ],
            color: Colors.cyan[600],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.access_alarm,
                    size: 40,
                    color: ColorConst.vermelho,
                  ),
                  Text(
                    'Matemática brincando',
                    // 'Home',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // margin: const EdgeInsets.only(right: 150),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 40,
                      color: ColorConst.vermelho,
                    ),
                    //color: ColorConst.vermelho,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/configuracao",
                      );
                    },
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
