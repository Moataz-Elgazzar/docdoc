import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/pages/home_screen.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/presentation/pages/login_screen.dart';
import 'package:docdoc/features/onboarding/onboarding_screen.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:docdoc/features/signup/presentation/pages/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static GoRouter route = GoRouter(
    routes: [
      GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(create: (context) => getIt<LoginCubit>(), child: const LoginScreen()),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => BlocProvider(create: (context) => getIt<SignupCubit>(), child: const SignupScreen()),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => BlocProvider(create: (context) => HomeCubit(getIt())..getSpecializations(), child: const HomeScreen()),
      ),
    ],
  );
}
