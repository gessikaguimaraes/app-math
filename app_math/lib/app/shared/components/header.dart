import 'package:app_math/app/modules/configuracao/configuracao_page.dart';
import 'package:app_math/app/shared/components/cutom_appbar.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderAppBar extends PreferredSize {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight + 50);

  // Future<bool> _mostrarDialog(context) async {
  // return showDialog(
  //     context: context,
  //     builder: (BuildContext context) => ConfiguracaoPage());
  // }

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
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage(ImagesConst.favicon),
                          height: 45,
                        ),
                        Text(
                          'Matemática',
                          style: GoogleFonts.pacifico(
                            color: Colors.black87,
                            letterSpacing: 1,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 40,
                          color: ColorConst.vermelho,
                        ),
                        onPressed: () {
                          // _mostrarDialog(context);
                          showDialog(
                              context: context,
                              builder: (_) => ConfiguracaoPage());
                          // Navigator.pushNamed(
                          //   context,
                          // );
                          // Navigator.pushNamed(
                          //   context,
                          //   "/configuracao",
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
