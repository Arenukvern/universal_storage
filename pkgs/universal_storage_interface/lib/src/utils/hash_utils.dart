import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;

import '../storage_service.dart';

/// {@template hash_utils}
/// Lightweight hashing helpers for sync workflows.
/// Pure functions suitable for extraction into a shared utils package.
/// {@endtemplate}

/// Compute SHA-256 hash (hex) for a string.
String sha256Hex(String input) =>
    crypto.sha256.convert(utf8.encode(input)).toString();

/// Normalize content by trimming trailing whitespace and collapsing CRLF.
String normalizeContent(String input) {
  if (!input.contains('\n')) return input.trim();
  final content = input.replaceAll('\r\n', '\n');
  final output = StringBuffer();
  var start = 0;
  var newline = content.indexOf('\n');
  while (newline != -1) {
    var end = newline;
    while (end > start) {
      final code = content.codeUnitAt(end - 1);
      if (code != 0x20 && code != 0x09) break;
      end--;
    }
    output
      ..write(content.substring(start, end))
      ..write('\n');
    start = newline + 1;
    newline = content.indexOf('\n', start);
  }
  output.write(content.substring(start));
  return output.toString().trim();
}

/// Compute normalized SHA-256 (hex) for string content.
String normalizedSha256Hex(String input) =>
    sha256Hex(normalizeContent(input));

/// Read a file via [storage] and return normalized SHA-256 hex.
/// Returns empty string if file doesn't exist.
Future<String> fileNormalizedSha256Hex(
  StorageService storage,
  String path,
) async {
  final content = await storage.readFile(path);
  if (content == null) return '';
  return normalizedSha256Hex(content);
}
