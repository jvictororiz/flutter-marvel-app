import 'package:home/domain/model/detail/detail_item.dart';

class DetailState {
  bool loading;
  bool isError;
  String titleBottomList;
  DetailItem? detailItem;

  DetailState({
    this.titleBottomList = "",
    this.loading = false,
    this.isError = false,
    this.detailItem,
  });

  DetailState copyWith({
    bool? loading,
    bool? isError,
    String? titleBottomList,
    DetailItem? detailItem,
  }) {
    return DetailState(
      loading: loading ?? this.loading,
      isError: isError ?? this.isError,
      detailItem: detailItem ?? this.detailItem,
      titleBottomList: titleBottomList ?? this.titleBottomList,
    );
  }
}
