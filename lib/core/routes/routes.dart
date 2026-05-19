import 'package:docdoc/features/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String onboarding = '/';
  static const String login = '/login';


 static GoRouter  route = GoRouter(
    routes: [
      GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen(),)
    ]
  ) ;
    
}