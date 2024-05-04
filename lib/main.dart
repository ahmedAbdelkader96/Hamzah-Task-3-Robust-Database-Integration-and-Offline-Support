import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task3/features/main_view/screens/ny_times_most_popular_articles_home_screen.dart';
import 'package:task3/global/bloc_providers/bloc_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: "Hamzah Task 3",
        home: NyTimesMostPopularArticlesHomeScreen(
            title: 'NY Times Most Popular Articles'),
        localizationsDelegates: [DefaultMaterialLocalizations.delegate],
      ),
    );
  }
}
