String lowerCamel(Iterable<String> input) {
  return _mapWithIndex(
          input, (s, index) => index != 0 ? capitalize(s) : s.toLowerCase())
      .join('');
}

String dartStyleVariable(Iterable<String> input) {
  return _mapWithIndex(
      input,
      (s, index) => index != 0
          ? capitalize(s.length > 2 ? s.toLowerCase() : s)
          : s.toLowerCase()).join('');
}

String dartStyleClassName(Iterable<String> input) {
  return input
      .map((s) => capitalize(s.length > 2 ? s.toLowerCase() : s))
      .join('');
}

String upperCamel(Iterable<String> input) {
  return input.map((s) => capitalize(s)).join('');
}

String lowerHyphen(Iterable<String> input) {
  return input.map((s) => s.toLowerCase()).join('-');
}

String snakeCase(Iterable<String> input) {
  return input.map((s) => s.toLowerCase()).join('_');
}

Iterable<T> _mapWithIndex<E, T>(
    Iterable<E> collection, T Function(E, int) f) sync* {
  int index = 0;
  for (E element in collection) {
    yield f(element, index);
    ++index;
  }
}

String capitalize(String word) {
  if (word.isEmpty) return word;

  return replaceAt(word, 0, transformer: (s) => s.toUpperCase());
}

String replaceAt(String input, int startIndex,
    {int endIndex, String Function(String) transformer}) {
  endIndex ??= startIndex + 1;

  if (startIndex < 0) throw RangeError.value(startIndex);
  if (startIndex > endIndex) throw RangeError.value(startIndex);
  if (endIndex > input.length) throw RangeError.value(endIndex);

  String before = input.substring(0, startIndex);
  String toReplace = input.substring(startIndex, endIndex);
  String after = input.substring(endIndex);

  String replace = transformer(toReplace);
  return '$before$replace$after';
}
