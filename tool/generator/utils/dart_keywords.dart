
const Set<String> _dartKeywords = {
  'abstract', 'deferred', 'if', 'super',
  'as', 'do', 'implements', 'switch',
  'assert', 'dynamic', 'import', 'sync',
  'async', 'else', 'in', 'this',
  'enum', 'is', 'throw',
  'await', 'export', 'library', 'true',
  'break', 'external', 'new', 'try',
  'case', 'extends', 'null', 'typedef',
  'catch', 'factory', 'var',
  'class', 'false', 'part', 'void',
  'const', 'final', 'rethrow', 'while',
  'continue', 'finally', 'return', 'with',
  'covariant', 'for', 'yield',
  'default', 'static', 'bool',  //
};

const _replacement = {
  'external': 'isExternal',
  // TODO(xha): remove required once a bug in analyzer is resolved (https://github.com/dart-lang/sdk/issues/38588)
  'required': 'isRequired',
};

String preventKeywords(String input) {
  var replacement = _replacement[input];
  if (replacement != null) return replacement;

  if (_dartKeywords.contains(input)) {
    return '$input\$';
  } else {
    return input;
  }
}
