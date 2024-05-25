import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inhetited_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:inhetited_test/features/initial/presentation/arguments/initial_arguments.dart';

class HomePage extends StatefulWidget {
  final InitialArguments? access;

  const HomePage({
    super.key,
    required this.access,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeInitialCallEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Current Weather"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Current City"),
                      Text(state.place?.name ?? ""),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text("Current Weather"),
                      Text(state.weather?.weather?.first.main ?? ""),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text("Weather Description"),
                      Text(state.weather?.weather?.first.description ?? ""),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text("Weather Temperature"),
                      Text((((state.weather?.weatherMain ?? 0) - 271).ceil())
                          .toString())
                    ],
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(const HomeInitialCallEvent());
        },
        child: const Icon(Icons.location_on_outlined),
      ),
    );
  }
}
