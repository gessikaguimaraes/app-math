import 'package:app_math/app/modules/identificacao/identificacao_page.dart';
import 'package:app_math/app/shared/components/cutom_appbar.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[400],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 250),
          child: ClipShadow(
            clipper: CustomAppBar(),
            boxShadow: [
              BoxShadow(
                color: Colors.pink[300],
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(0.0, 1.0),
              )
            ],
            child: Container(
              color: Colors.grey[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    alignment: Alignment.topLeft,
                    image: AssetImage(ImagesConst.favicon),
                    //fit: BoxFit.fitHeight,
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Matemática',
                        style: GoogleFonts.pacifico(
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 0),
                          /* transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return ScaleTransition(
                              alignment: Alignment.centerLeft,
                              scale: animation,
                              child: child,
                            );
                          }, */
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return IdentificacaoPage();
                          }),
                      //"/identificacao",
                    );
                  },
                  child: ClipOval(
                    child: Container(
                      color: Colors.blue,
                      height: 200.0,
                      width: 200.0,
                      child: Center(
                        child: Text(
                          'Iniciar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
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
