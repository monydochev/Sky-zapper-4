import 'dart:typed_data';

/// Windows-1251 (Cyrillic) codec for Dart.
///
/// Dart has no built-in Win1251 support, so this class provides a manual
/// mapping table that covers the full 0x80-0xFF range used by the Sky Zapper
/// protocol for Bulgarian text.
class Win1251 {
  Win1251._();

  // ---------------------------------------------------------------------------
  // Win1251 -> Unicode mapping for bytes 0x80 .. 0xFF
  // ---------------------------------------------------------------------------

  /// Unicode codepoints for Win1251 bytes 0x80 through 0xFF (128 entries).
  static const List<int> _toUnicode = <int>[
    // 0x80
    0x0402, 0x0403, 0x201A, 0x0453, 0x201E, 0x2026, 0x2020, 0x2021,
    0x20AC, 0x2030, 0x0409, 0x2039, 0x040A, 0x040C, 0x040B, 0x040F,
    // 0x90
    0x0452, 0x2018, 0x2019, 0x201C, 0x201D, 0x2022, 0x2013, 0x2014,
    0x0098, 0x2122, 0x0459, 0x203A, 0x045A, 0x045C, 0x045B, 0x045F,
    // 0xA0
    0x00A0, 0x040E, 0x045E, 0x0408, 0x00A4, 0x0490, 0x00A6, 0x00A7,
    0x0401, 0x00A9, 0x0404, 0x00AB, 0x00AC, 0x00AD, 0x00AE, 0x0407,
    // 0xB0
    0x00B0, 0x00B1, 0x0406, 0x0456, 0x0491, 0x00B5, 0x00B6, 0x00B7,
    0x0451, 0x2116, 0x0454, 0x00BB, 0x0458, 0x0405, 0x0455, 0x0457,
    // 0xC0 - Cyrillic uppercase A-P
    0x0410, 0x0411, 0x0412, 0x0413, 0x0414, 0x0415, 0x0416, 0x0417,
    0x0418, 0x0419, 0x041A, 0x041B, 0x041C, 0x041D, 0x041E, 0x041F,
    // 0xD0 - Cyrillic uppercase R-YA
    0x0420, 0x0421, 0x0422, 0x0423, 0x0424, 0x0425, 0x0426, 0x0427,
    0x0428, 0x0429, 0x042A, 0x042B, 0x042C, 0x042D, 0x042E, 0x042F,
    // 0xE0 - Cyrillic lowercase a-p
    0x0430, 0x0431, 0x0432, 0x0433, 0x0434, 0x0435, 0x0436, 0x0437,
    0x0438, 0x0439, 0x043A, 0x043B, 0x043C, 0x043D, 0x043E, 0x043F,
    // 0xF0 - Cyrillic lowercase r-ya
    0x0440, 0x0441, 0x0442, 0x0443, 0x0444, 0x0445, 0x0446, 0x0447,
    0x0448, 0x0449, 0x044A, 0x044B, 0x044C, 0x044D, 0x044E, 0x044F,
  ];

  /// Reverse mapping: Unicode codepoint -> Win1251 byte.
  /// Built lazily on first use.
  static Map<int, int>? _fromUnicode;

  static Map<int, int> get _reverseMap {
    if (_fromUnicode == null) {
      _fromUnicode = <int, int>{};
      for (int i = 0; i < _toUnicode.length; i++) {
        _fromUnicode![_toUnicode[i]] = 0x80 + i;
      }
    }
    return _fromUnicode!;
  }

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Encode a Dart [String] into Win1251 bytes.
  ///
  /// Characters that have no Win1251 representation are replaced with `?` (0x3F).
  static Uint8List encode(String text) {
    final result = Uint8List(text.length);
    for (int i = 0; i < text.length; i++) {
      final cp = text.codeUnitAt(i);
      if (cp < 0x80) {
        // ASCII range maps directly.
        result[i] = cp;
      } else {
        result[i] = _reverseMap[cp] ?? 0x3F; // '?' for unmapped
      }
    }
    return result;
  }

  /// Decode Win1251 [bytes] into a Dart [String].
  ///
  /// Stops at the first null byte (0x00) if [stopAtNull] is true (default).
  static String decode(Uint8List bytes, {bool stopAtNull = true}) {
    final sb = StringBuffer();
    for (int i = 0; i < bytes.length; i++) {
      final b = bytes[i];
      if (stopAtNull && b == 0) break;
      if (b < 0x80) {
        sb.writeCharCode(b);
      } else {
        sb.writeCharCode(_toUnicode[b - 0x80]);
      }
    }
    return sb.toString();
  }
}
