import 'package:fast_quiz_tayari/adminPart/view/User.dart';
import 'package:fast_quiz_tayari/adminPart/view/dashboard.dart';
import 'package:fast_quiz_tayari/adminPart/view/login.dart';
import 'package:fast_quiz_tayari/adminPart/view/splashScreen.dart';
import 'package:go_router/go_router.dart';

import '../view/mock.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const Dashboard(),
        routes: [
          // Nested route for mock_list under dashboard
          GoRoute(
            path: 'mock_list/:subjectName',
            builder: (context, state) {
              // Extract subjectName from route parameters
              final subjectName = state.pathParameters['subjectName']!;
              return MockList(
                  subjectName: subjectName); // Pass the parameter to MockList
            },
          ),
        ],
      ),
      GoRoute(
        path: '/users',
        builder: (context, state) => UsersScreen(),
      ),
    ],
  );
}
