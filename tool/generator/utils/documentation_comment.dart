
import 'dart:convert';
import 'package:html2md/html2md.dart' as html2md;
import 'package:meta/meta.dart';


String documentationComment(String documentation, {@required int indent}) {
  documentation = html2md.convert(documentation);

  return _toComment(documentation, indent: indent);
}

String _toComment(String comment, {int indent= 0, int lineLength= 80}) {
  if (comment != null && comment.isNotEmpty) {
    List<String> commentLines = [];

    comment = comment.replaceAll('<code>', '`').replaceAll('</code>', '`');

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
        .map((line) => '${' ' * indent}$docStarter$line')
        .join('\n');
  } else {
    return '';
  }
}
