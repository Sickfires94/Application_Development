

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'LaunchWidget/LaunchBloc.dart';
import 'LaunchWidget/LaunchList.dart';
import 'LaunchWidget/launch_model.dart';
import 'appbar.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
        home: BlocProvider(
            create: (context) => LaunchBloc()..add(FetchLaunches()),
            child: LaunchScreen()
        )
    );
  }
}

class LaunchScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Launches")),
        body: BlocBuilder<LaunchBloc, LaunchState>(
            builder: (context, state){
              if (state is LaunchLoading){
                return Center(child: CircularProgressIndicator(),);
                // return const SkeletonList extends statelessWidget();
              } else if (state is LaunchLoaded){
                List<Launch> launches = state.launch;
                return LaunchList(launches: launches);
              } else if (state is LaunchError) {
                return Center(child: Text(state.error));
              }
              return const Center(child: Text("Press button to fetch Launchs"));
            })
    );
  }
}

