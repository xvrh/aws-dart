import 'dart:convert';
import 'package:html2md/html2md.dart' as html2md;
import 'package:meta/meta.dart';

String documentationComment(String documentation,
    {String argumentName, @required int indent}) {
  documentation = html2md.convert(documentation);
  documentation = documentation.replaceAll('\u2028', '\n');

  if (argumentName != null) {
    documentation = '[$argumentName]: $documentation';
  }

  documentation = documentation
      .replaceAll(r'\[Required\]', '*required*')
      .replaceAll(r'\', '');

  return _toComment(documentation, indent: indent);
}

final _bracketExtractor = RegExp(r'\[[^\]]+\]');
final _nonBreakingSpace = '\u00A0';
String _toComment(String comment, {int indent = 0, int lineLength = 80}) {
  if (comment != null && comment.isNotEmpty) {
    List<String> commentLines = [];

    comment = comment
        .replaceAllMapped(_bracketExtractor,
            (match) => match.group(0).replaceAll(' ', _nonBreakingSpace))
        .replaceAll('<code>', '`')
        .replaceAll('</code>', '`');

    const String docStarter = '/// ';
    int maxLineLength = lineLength - indent - docStarter.length;

    for (String hardLine in LineSplitter.split(comment)) {
      List<String> currentLine = [];
      int currentLineLength = 0;
      for (String word in hardLine.split(' ')) {
        if (currentLine.isEmpty ||
            currentLineLength + word.length < maxLineLength) {
          currentLineLength += word.length + (currentLine.isEmpty ? 0 : 1);
          currentLine.add(word);
        } else {
          commentLines.add(currentLine.join(' '));
          currentLine = [word];
          currentLineLength = word.length;
        }
      }
      if (currentLine.isNotEmpty) {
        commentLines.add(currentLine.join(' '));
      }
    }

    return commentLines
        .map((line) => line.replaceAll(_nonBreakingSpace, ' '))
        .map((line) => '${' ' * indent}$docStarter$line')
        .join('\n');
  } else {
    return '';
  }
}
