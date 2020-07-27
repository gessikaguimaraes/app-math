import 'package:firebase_admob/firebase_admob.dart';

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
      // adUnitId: BannerAd.testAdUnitId,
      adUnitId: "ca-app-pub-1556568734938950/4016772722",
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        //print("BannerAd event is $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      // adUnitId: InterstitialAd.testAdUnitId,
      adUnitId: "ca-app-pub-1556568734938950/9974842261",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        //print("InterstitialAd event is $event");
      },
    );
  }

  void mostrarBanner() {
    bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  void mostrarInterstitial() {
    interstitialAd = createInterstitialAd()
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }
}
