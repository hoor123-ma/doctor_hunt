import 'dart:io';

void main() {
  const styles = [
    {
      'name': 'bold25',
      'weight': 'w700',
      'size': 25,
    },
    {
      'name': 'bold18',
      'weight': 'w700',
      'size': 18,
    },
    {
      'name': 'bold16',
      'weight': 'w700',
      'size': 16,
    },
    {
      'name': 'medium28',
      'weight': 'w500',
      'size': 28,
    },
    {
      'name': 'medium24',
      'weight': 'w500',
      'size': 24,
    },
    {
      'name': 'medium18',
      'weight': 'w500',
      'size': 18,
    },
    {
      'name': 'regular14',
      'weight': 'w400',
      'size': 14,
      'color': '0xff677294',
    },
    {
      'name': 'regular12',
      'weight': 'w400',
      'size': 12,
      'color': '0xff677294',
    },
    {
      'name': 'regular11',
      'weight': 'w400',
      'size': 11,
      'color': '0xff677294',
    },
  ];

  final output = StringBuffer();

  output.writeln("import 'package:flutter/material.dart';");
  output.writeln();
  output.writeln('class AppTextStyle {');

  for (final style in styles) {
    output.write(
      '  static final ${style['name']} = TextStyle('
      'fontWeight: FontWeight.${style['weight']}, '
      'fontSize: ${style['size']}',
    );

    if (style.containsKey('color')) {
      output.write(
        ", color: Color(${style['color']})",
      );
    }

    output.writeln(');');
  }

  output.writeln('}');

  final file = File('lib/core/theme/app_text_style.dart');

  file.parent.createSync(recursive: true);
  file.writeAsStringSync(output.toString());

}