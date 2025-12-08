import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../core/base/base_widget.dart';
import '../view_model/splash_cubit.dart';
import '../view_model/splash_state.dart';

class SplashScreen extends BaseWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashCubit _splashCubit = SplashCubit();

  @override
  void initState() {
    super.initState();
    _splashCubit.initSplash();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashCubit,
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animations/splashscreen.json', width: 200),
              SizedBox(height: 20),
              Text(
                'SmartyKids',
                style: widget.setFont(
                  TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
