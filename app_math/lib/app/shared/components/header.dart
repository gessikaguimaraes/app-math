import 'package:app_math/app/modules/configuracao/configuracao_page.dart';
import 'package:app_math/app/shared/components/custom_appbar.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderAppBar extends PreferredSize {
  final Color cor;
  final String nome;
  final Color corSombra;
  final double fontSize;
  final FontStyle fontStyle;
  final Color corIconConfig;

  HeaderAppBar(this.cor, this.nome, this.corSombra, this.fontSize,
      this.fontStyle, this.corIconConfig);

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ClipShadow(
        clipper: CustomAppBar(),
        boxShadow: [
          BoxShadow(
            color: corSombra,
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(0.0, 1.0),
          ),
        ],
        child: Container(
          color: cor,
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
                          semanticLabel: "Logo do sistema",
                          height: 45,
                        ),
                        Text(
                          '$nome',
                          style: GoogleFonts.pacifico(
                            color: Colors.black87,
                            letterSpacing: 1,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                            fontStyle: fontStyle,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 40,
                          color: corIconConfig,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => ConfiguracaoPage(
                              cor: cor,
                              corButton: corIconConfig,
                            ),
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
      ),
    );
  }
}
