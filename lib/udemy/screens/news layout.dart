import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event.dart';
import '../bloc/state.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Events(),
      child: BlocConsumer<Events, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var event = Events.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('New App'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
            body: event.screens[event.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: event.bottomItems,
              currentIndex: event.currentIndex,
              onTap: (int index) {
                event.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
