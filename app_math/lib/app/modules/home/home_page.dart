import 'package:app_math/app/modules/configuracao/configuracao_page.dart';
import 'package:app_math/app/modules/desafio/desafio_operacao.dart';
import 'package:app_math/app/shared/components/custom_appbar.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:app_math/app/shared/services/admob_service.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String route;
  final Parametros parametros;

  HomePage({Key key, this.route, this.parametros}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AdMobService().mostrarBanner();
    super.initState();
  }

  @override
  void dispose() {
    AdMobService().bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[300],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 250),
          child: ClipShadow(
            clipper: CustomAppBar(),
            boxShadow: [
              BoxShadow(
                color: Colors.pink[400],
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(0.0, 1.0),
              )
            ],
            child: Container(
              color: ColorConst.verde,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 40,
                        color: Colors.pink[800],
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => ConfiguracaoPage(
                            cor: ColorConst.verde,
                            corButton: Colors.pink[800],
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        // alignment: Alignment.topLeft,
                        image: AssetImage(
                          ImagesConst.favicon,
                        ),
                        semanticLabel: "Logo do sistema",
                        //fit: BoxFit.fitHeight,
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,r
                        children: <Widget>[
                          Text(
                            'Matemática',
                            style: GoogleFonts.pacifico(
                              // textStyle: Theme.of(context).textTheme.headline1,
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: Wrap(
            direction: Axis.horizontal,
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/opcoes",
                      arguments: Parametros(
                        opcoes: [],
                        resultado: 0,
                        quantidade: 0,
                      ),
                    );

                    /* Navigator.push(
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
                            return OpcoesPage();
                          },
                        ),
                      ); */
                  },
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    child: Center(
                      child: Text(
                        'Praticar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink[800],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink[900],
                          blurRadius: 5.0,
                          offset: Offset(5.0, 5.0),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DesafioOperacao(),
                        ),
                      );
                    },
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: Center(
                        child: Text(
                          'Desafio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink[800],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink[900],
                            blurRadius: 5.0,
                            offset: Offset(5.0, 5.0),
                            spreadRadius: 5.0,
                          ),
                        ],
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
