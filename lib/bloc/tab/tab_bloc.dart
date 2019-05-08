import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buddyflix/model/app_tab.dart';
import '../bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.home;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateEvent) {
      yield event.tab;
    }
  }
}
