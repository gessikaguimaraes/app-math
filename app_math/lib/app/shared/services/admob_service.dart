import 'package:app_math/app/shared/models/parametros.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class AdMobService {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      "Games",
      "beautiful apps",
      "matematica",
      "Matemática",
      "Math",
      "Matematica",
      "matemática",
      "math",
      "games",
      "game",
      "Game",
    ],
    // contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[],
  );
  BannerAd bannerAd;
  InterstitialAd interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
      //adUnitId: BannerAd.testAdUnitId,
      adUnitId: "ca-app-pub-1556568734938950/4016772722",
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        //print("BannerAd event is $event");
      },
    );
  }

  InterstitialAd createInterstitialAd(BuildContext context) {
    return InterstitialAd(
      //adUnitId: InterstitialAd.testAdUnitId,
      adUnitId: "ca-app-pub-1556568734938950/9974842261",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened ||
            event == MobileAdEvent.failedToLoad)
          Navigator.pushNamed(
            context,
            "/opcoes",
            arguments: Parametros(
              opcoes: [],
              resultado: 0,
              quantidade: 0,
            ),
          );
      },
    );
  }

  InterstitialAd createInterstitialHomeAd(BuildContext context, String name) {
    return InterstitialAd(
      //adUnitId: InterstitialAd.testAdUnitId,
      adUnitId: "ca-app-pub-1556568734938950/9974842261",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened ||
            event == MobileAdEvent.failedToLoad)
          Navigator.pushReplacementNamed(context, name);
      },
    );
  }

  void mostrarBanner() {
    bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  void mostrarInterstitial(BuildContext context) {
    interstitialAd = createInterstitialAd(context)
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  void mostrarInterstitialHome(BuildContext context, String name) {
    interstitialAd = createInterstitialHomeAd(context, name)
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }
}
