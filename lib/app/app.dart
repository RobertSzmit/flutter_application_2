import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/cubit/root_cubit.dart';
import 'package:flutter_application_2/app/features/home/home_page.dart';
import 'package:flutter_application_2/app/features/login/login_page.dart';
import 'package:flutter_application_2/app/features/splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool _showAnimatedSplash = true;

  @override
  void initState() {
    super.initState();
    context.read<RootCubit>().start();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootCubit, RootState>(
      listener: (context, state) {
        if (!state.isLoading) {
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _showAnimatedSplash = false;
              });
            }
          });
        }
      },
      builder: (context, state) {
        if (_showAnimatedSplash) {
          return const AnimatedSplashScreen(child: SizedBox.shrink());
        } else if (state.isLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (state.errorMessage.isNotEmpty) {
          return Scaffold(
              body: Center(child: Text('Error: ${state.errorMessage}')));
        } else if (state.user == null) {
          return const LoginPage();
        } else {
          return HomePage(user: state.user!);
        }
      },
    );
  }
}
