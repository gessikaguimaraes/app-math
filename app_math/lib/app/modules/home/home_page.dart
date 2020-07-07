import 'package:app_math/app/shared/components/cutom_appbar.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],
      appBar: PreferredSize(
        child: ClipPath(
          clipper: CustomAppBar(),
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
        preferredSize: Size.fromHeight(kToolbarHeight + 250),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/identificacao");
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
            /* Card(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: ClipOval(
                        child: Material(
                          color: Colors.cyan[600], // button color
                          child: InkWell(
                            splashColor: Colors.pink[300], // inkwell color
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Icon(
                                Icons.brush,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/identificacao");
                            },
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Iniciar',
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
