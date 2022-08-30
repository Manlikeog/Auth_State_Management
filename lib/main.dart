import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/repositories/repository.dart';
import 'package:food_app/interface/pages/onboard/splash_page.dart';
import 'package:food_app/interface/router/app_router.dart';
import 'package:food_app/logic/login_bloc/bloc/login_bloc.dart';
import 'package:food_app/logic/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository(auth: FirebaseAuth.instance);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => LoginBloc(userRepository: userRepository),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        theme: ThemeData(primarySwatch: Colors.red),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
