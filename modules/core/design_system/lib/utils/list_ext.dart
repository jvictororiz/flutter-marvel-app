extension ListExtension<T> on List<T> {
  T? find(bool Function(T element) onCall) {
    for (var element in this) {
      if (onCall(element)) {
        return element;
      }
    }
    return null;
  }

  bool all(bool Function(T) test) {
    for (final element in this) {
      if (!test(element)) {
        return false;
      }
    }
    return true;
  }

  List<T> filter(bool Function(T) filter) {
    List<T> filterList = List.empty();
    for (var element in this) {
      if (filter(element)) {
        filterList = List.from(filterList)..add(element);
      }
    }
    return filterList;
  }

  List<T> removeDuplicatesById(int Function(T) idExtractor) {
    final seen = <int, T>{};
    return where((element) {
      final id = idExtractor(element);
      final isNew = !seen.containsKey(id);
      seen[id] = element;
      return isNew;
    }).toList();
  }

  double sum(num Function(T) getValue) {
    return isEmpty ? 0 : map(getValue).reduce((value, element) => value + element).toDouble();
  }
}

extension ListExtensionNotNull<T> on List<T?> {
  List<T> filterNotNull() {
    return [
      for (var element in this)
        if (element != null) element
    ];
  }
}