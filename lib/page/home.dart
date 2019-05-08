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
          return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.red));
        } else if (homeState is GenresFetchedState) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                // return GenreWidget(name: homeState.genres[index].name);
                return buildMovieHorizontalList(homeState.genres[index].name);
              },
              itemCount: homeState.genres.length);
        }
      },
    );
  }

  Widget buildMovieHorizontalList(String genreName) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 240,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[Text(genreName)],
            ),
          ),
          Container(
              child: Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5, right: 10),
                  width: 130,
                  child: Image(
                    image: AssetImage("assets/1.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class GenreWidget extends StatelessWidget {
  final String name;

  const GenreWidget({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
