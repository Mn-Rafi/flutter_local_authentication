import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthServices {
  final LocalAuthentication auth = LocalAuthentication();
  Future<bool> authenticate() async {
    try {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      return canAuthenticate;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> didauthenticated() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(useErrorDialogs: false));
      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        throw 'Biometric authentication is not available on this device.';
      } else if (e.code == auth_error.notEnrolled) {
        throw 'Biometric authentication is not enrolled on this device.';
      } else {
        throw 'There was an unknown error.\n${e.code}';
      }
    }
  }
}
