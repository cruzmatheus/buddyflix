import 'dart:async';

import 'package:buddyflix/model/movie_response.dart';
import 'package:flutter/material.dart';
import 'package:buddyflix/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc _searchBloc = SearchBloc();
  final _searchQuery = new TextEditingController();
  Timer _debounce;

  _onSearchTermChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      final String searchTerm = _searchQuery.text;
      if (searchTerm.isNotEmpty) {
        _searchBloc.dispatch(FetchMovies(searchTerm));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searchQuery.addListener(_onSearchTermChanged);
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_onSearchTermChanged);
    _searchQuery.dispose();
    _searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _searchBloc,
        builder: (BuildContext context, SearchState state) {
          if (state is UnsearchedMoviesState) {
            return buildSearchTextField();
          } else if (state is SearchedMoviesState) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [buildSearchTextField()],
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  delegate: SliverChildListDelegate(
                    buildMovieImageWidget(state.movies),
                  ),
                ),
              ],
            );
          }
        });
  }

  List<Widget> buildMovieImageWidget(List<MovieResponse> movies) {
    List<Widget> moviesWidgets = [];
    for (var movie in movies) {
      moviesWidgets.add(Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image(
                  image: movie.getPosterPath().isNotEmpty
                      ? NetworkImage(movie.getPosterPath())
                      : AssetImage('assets/not_found.png'),
                  fit: BoxFit.fitHeight),
            )
          ],
        ),
      ));
    }
    return moviesWidgets;
  }

  Widget buildSearchTextField() {
    return Container(
        padding: EdgeInsets.only(top: 30, right: 15, left: 15),
        child: TextField(
          decoration: InputDecoration(hintText: "Enter a movie name"),
          controller: _searchQuery,
        ));
  }
}
