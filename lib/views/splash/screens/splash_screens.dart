import 'package:flutter/material.dart';

import '../state/splash_state.dart';

//intial splash screen
class InitialSplashScreen extends StatefulWidget{
  const InitialSplashScreen({Key? key}) : super(key:key);

  @override
  InitialSplashState createState() => InitialSplashState();
}

// splash screen while logging in
class LoadingSplashLogin extends StatefulWidget{
  const LoadingSplashLogin({Key? key}) : super(key:key);

  @override
  LoadingSplashLoginState createState() => LoadingSplashLoginState();
}

// splash screen while registering user
class LoadingSplashRegister extends StatefulWidget{
  const LoadingSplashRegister({Key? key}) : super(key:key);

  @override
  LoadingSplashRegisterState createState() => LoadingSplashRegisterState();
}
