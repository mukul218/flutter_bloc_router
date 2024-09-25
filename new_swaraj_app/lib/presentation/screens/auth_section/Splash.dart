import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_swaraj_app/logic/blocs/common_state.dart';
import 'package:new_swaraj_app/logic/blocs/main_bloc.dart';
import 'package:new_swaraj_app/presentation/screens/auth_section/auth_bloc/auth_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final AuthBloc authBloc = AuthBloc();
  @override
  void initState() {
    // TODO: implement initState
    // checkinterNect();
    authBloc.add(CheckInternetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, CommonState>(
      bloc: authBloc,
      listenWhen: (previous, current) => current is MainStateAction,
      buildWhen: (previous, current) => current is! MainStateAction,
      listener: (context, state) {
        switch (state.runtimeType) {
          case HaveInternetState:
                authBloc.add(CheckAppUpdataEvent());
          case LatestVersionState:
            authBloc.add(CheckShowIntorSlideEvent());
          case NotShowIntroSlideState:
            authBloc.add(CheckClientLoginEvent());
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MainLoading:
            return Scaffold(
              body: Center(
                child: SizedBox(
                  height: 150,
                  child: Container(
                    // color: Colors.white,
                    child: Image.asset(
                      'assets/icons/fav.png', // Your rocket image path
                      height: 300,
                    ),
                  ),
                ),
              ),
            );
          case NoInternetState:
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
                          authBloc.add(CheckInternetEvent());
                          // Add functionality to retry or check connection
                        },
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case UpdateAvaliableState:
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Rocket image (Replace with your actual image path)
                      Image.asset(
                        'assets/images/updateAvailable1.png', // Your rocket image path
                        height: 300,
                      ),
                      const SizedBox(height: 30),
                      // Title
                      const Text(
                        'New update is available',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Description
                      Text(
                        'The current version of this application is no longer supported. '
                        'We apologize for any inconvenience we may have caused you.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Update Now Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle update action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.lightBlueAccent, // Button color
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Update now',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Close App Button
                      TextButton(
                        onPressed: () {
                          // Handle close action
                        },
                        child: InkWell(
                          child: Text(
                            'No, Thanks! Close the app',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          onTap: () {
                            print('Go to Next Event');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case ShowIntroSlideState:
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Rocket image (Replace with your actual image path)
                      Image.asset(
                        'assets/images/updateAvailable1.png', // Your rocket image path
                        height: 300,
                      ),
                      const SizedBox(height: 30),
                      // Title
                      const Text(
                        'Introduction Slide',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Description
                      Text(
                        'Please try again later, or contact support if the problem persists. '
                            'We apologize for any inconvenience we may have caused you.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Update Now Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle update action
                          authBloc.add(CheckClientLoginEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.lightBlueAccent, // Button color
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Close App Button
                      TextButton(
                        onPressed: () {
                          // Handle close action
                        },
                        child: InkWell(
                          child: Text(
                            'Contact Us, Now',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          onTap: () {
                            print('Go to Next Event');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case MainError:
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Rocket image (Replace with your actual image path)
                      Image.asset(
                        'assets/images/updateAvailable1.png', // Your rocket image path
                        height: 300,
                      ),
                      const SizedBox(height: 30),
                      // Title
                      const Text(
                        'Oops! Something went wrong',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Description
                      Text(
                        'Please try again later, or contact support if the problem persists. '
                            'We apologize for any inconvenience we may have caused you.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Update Now Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle update action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.lightBlueAccent, // Button color
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Close App Button
                      TextButton(
                        onPressed: () {
                          // Handle close action
                        },
                        child: InkWell(
                          child: Text(
                            'Contact Us, Now',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          onTap: () {
                            print('Go to Next Event');
                          },
                        ),
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
