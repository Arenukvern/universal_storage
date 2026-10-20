import 'dart:math';

import 'package:test/test.dart';
import 'package:universal_storage_interface/src/utils/hash_utils.dart';

String _previousNormalization(String input) =>
    input.replaceAll('\r\n', '\n').replaceAll(RegExp(r'[ \t]+\n'), '\n').trim();

void _expectEquivalent(String input) {
  final expected = _previousNormalization(input);
  expect(normalizeContent(input), expected);
  expect(normalizedSha256Hex(input), sha256Hex(expected));
}

void main() {
  test(
    'preserves newline, escaped text and Unicode normalization semantics',
    () {
      [
        '',
        ' a \t\n b\t \r\n c ',
        r'{"source":"a    \n b    \r\n"}',
        'a \r b \r\r\n c',
        'a\u00a0\n b\u2003\n c\u2028 d',
        '\ufeff\u00a0a\u2003\ufeff',
        'a😀 \t\r\n\ud800 x\udc00\n',
        'a\r \n b\r\t\n c\r',
      ].forEach(_expectEquivalent);
    },
  );

  test('preserves output and hashes across short code-unit combinations', () {
    const alphabet = [
      'a',
      ' ',
      '\t',
      '\r',
      '\n',
      '\u00a0',
      '\u2003',
      '\ufeff',
      '\ud800',
      '\udc00',
    ];
    void visit(String prefix, int remaining) {
      _expectEquivalent(prefix);
      if (remaining == 0) return;
      for (final character in alphabet) {
        visit('$prefix$character', remaining - 1);
      }
    }

    visit('', 3);
  });

  test('preserves output and hashes across seeded mixed text', () {
    final random = Random(419);
    const units = [0x61, 0x20, 0x09, 0x0d, 0x0a, 0xa0, 0x2003, 0xd800, 0xdc00];
    for (var sample = 0; sample < 2000; sample++) {
      final input = String.fromCharCodes(
        List.generate(
          random.nextInt(256),
          (_) => units[random.nextInt(units.length)],
        ),
      );
      _expectEquivalent(input);
    }
  });

  test(
    'long horizontal runs retain escaped newlines and trim actual newlines',
    () {
      final spaces = ' ' * 65536;
      final escaped = 'a$spaces\\n b';
      expect(normalizeContent(escaped), escaped);
      expect(normalizeContent('a$spaces\n b'), 'a\n b');
      expect(normalizeContent('a$spaces\r\n b'), 'a\n b');
    },
  );
}
