

import 'package:flutter/material.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth{
  static final _localAuth = LocalAuthIOS();

  static Future<bool> _canAuthenticate() async => await _localAuth.deviceSupportsBiometrics()
                                                        || await _localAuth.isDeviceSupported();

  static Future<bool> authenticate() async{
    try{
      if (!await _canAuthenticate()){
        return false;
      }

      return await _localAuth.authenticate(localizedReason: 'Use Face ID', 
                                           authMessages: [const IOSAuthMessages(cancelButton: 'No thanks')],
                                           options: const AuthenticationOptions(
                                            useErrorDialogs: true,
                                            stickyAuth: true
                                           )
                                           );
    }
    catch(e){
      debugPrint("Exception while authenticating: ${e.toString()}");
    }
    return false;
  }

}