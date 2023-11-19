import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  // local auth instance
  static final LocalAuthentication auth = LocalAuthentication();

  // method to check device supported biometric
  static Future<bool> canAuthenticate() async {
    return await auth.canCheckBiometrics || await auth.isDeviceSupported();
  }

  // method to authenticate
  static Future<bool> authenticate() async {
    try {
      // device is not supported biometric return false
      if (!await canAuthenticate()) return false;

      // method to authenticate
      return await auth.authenticate(
        localizedReason: "Scan fingerprint to authenticate",
        options: const AuthenticationOptions(
          // if fingerprint is not register
          useErrorDialogs: true,
          // open from background again ask for fingerprint
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }
}
