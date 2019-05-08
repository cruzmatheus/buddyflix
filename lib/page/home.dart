import 'package:flutter/material.dart';
import 'package:buddyflix/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc _homeBloc = HomeBloc();

    _HomePage() {
      _homeBloc.dispatch(FetchGenres());
    }

    return BlocBuilder(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState homeState) {
        if (homeState is InitialHomeState) {
          _homeBloc.dispatch(FetchGenres());
          return Center(child: Text("InitialHomeState"));
        } else if (homeState is GenresFetchedState) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text(homeState.genres[index].name);
              },
              itemCount: homeState.genres.length);
        }
      },
    );
  }
}
