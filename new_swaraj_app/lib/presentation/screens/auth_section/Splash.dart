import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_swaraj_app/presentation/screens/auth_section/auth_bloc/auth_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final AuthBloc authBloc = AuthBloc();

  // check Internet

  // check app for update

  // check if app is first time open after install

  // check if client is login or not

  @override
  void initState() {
    // TODO: implement initState
    // checkinterNect();
    authBloc.add(AuthSplashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listenWhen: (previous, current) => current is AuthStateAction,
      buildWhen: (previous, current) => current is! AuthStateAction,
      listener: (context, state) {
        switch (state.runtimeType) {}
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AuthInitialState:
            return Scaffold(
              body: Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assets/icons/logo_with_text.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          case AuthNoInternetState:
            return Scaffold(
              body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.wifi_off,
                          size: 50,
                          color: Colors.redAccent,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No Internet Connection',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Please check your internet settings and try again.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            authBloc.add(AuthCheckInternewEvent());
                            
                            // Add functionality to retry or check connection
                          },
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  ),
              ),
            );
          default:
            return const Scaffold(
              body: Center(child: Text('No Builder')),
            );
        }
      },
    );
  }
}
