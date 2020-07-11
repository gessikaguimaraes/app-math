import 'package:firebase_admob/firebase_admob.dart';

class AdMobService {
  MobileAdTargetingInfo targetingInfo;
  BannerAd bannerAd;
  InterstitialAd interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        //print("BannerAd event is $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: InterstitialAd.testAdUnitId,
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
