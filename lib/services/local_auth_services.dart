import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  static final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    return await auth.canCheckBiometrics || await auth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    try {
      if (!await canAuthenticate()) {
        print("object");
        return false;
      }
      return await auth.authenticate(
        localizedReason: "Scan fingerprint to authenticate",
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }
}
