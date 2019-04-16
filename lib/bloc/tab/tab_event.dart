import 'package:buddyflix/model/app_tab.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TabEvent extends Equatable {
  TabEvent([List props = const[]]) : super(props);
}

class UpdateEvent extends TabEvent {
  final AppTab tab;

  UpdateEvent({this.tab}) : super([tab]);

  String toString() => "Update Tab: $tab";
}
