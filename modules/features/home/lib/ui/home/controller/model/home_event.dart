import 'package:home/domain/model/detail/detail_item.dart';

abstract class HomeEvent {}

class Idle extends HomeEvent {}

class GoToLogin extends HomeEvent {}

class GoToDetail extends HomeEvent {
  final DetailItem detailItem;

  GoToDetail(this.detailItem);
}
