import 'dart:typed_data';

import '../../data/models/category.dart';
import '../../data/models/disease.dart';
import '../../data/models/frequency.dart';
import '../protocol/win1251.dart';

/// Builds the 512 KB firmware buffer that is uploaded to WiFi Sky Zapper devices
/// via the block transfer protocol.
///
/// The buffer contains all categories, diseases (programs), and their
/// frequencies packed in the ESP firmware format.
///
/// ## Record formats
///
/// **Category (38 bytes):**
/// | Offset | Size | Field                    |
/// |--------|------|--------------------------|
/// | 0      | 2    | id (uint16 LE)           |
/// | 2      | 1    | repeat                   |
/// | 3      | 2    | pause_program (uint16 LE)|
/// | 5      | 2    | pause_repeat_cycle (u16) |
/// | 7      | 30   | name_BG (Win1251, padded)|
/// | 37     | 1    | terminator (0xFF)        |
///
/// **Disease / Program (92 bytes):**
/// | Offset | Size | Field                    |
/// |--------|------|--------------------------|
/// | 0      | 2    | id (uint16 LE)           |
/// | 2      | 2    | category_id (uint16 LE)  |
/// | 4      | 1    | color_group              |
/// | 5      | 30   | name_BG (Win1251, padded)|
/// | 35     | 1    | freq_count               |
/// | 36     | 56   | freq_data (up to 11 x 5) |
///
/// **Frequency entry (5 bytes, within disease freq_data):**
/// | Offset | Size | Field                    |
/// |--------|------|--------------------------|
/// | 0      | 2    | freq_Hz (uint16 LE)      |
/// | 2      | 3    | time_sec (uint24 LE)     |
class FirmwareBuffer {
  /// Maximum buffer size: 512 KB.
  static const int maxSize = 524288;

  /// Category record size in ESP format.
  static const int categoryRecordSize = 38;

  /// Disease record size in ESP format.
  static const int diseaseRecordSize = 92;

  /// Frequency entry size within disease record.
  static const int frequencyEntrySize = 5;

  /// Maximum frequency entries per disease (56 bytes / 5 bytes = 11).
  static const int maxFrequenciesPerDisease = 11;

  /// Name field length in Win1251 (null-padded).
  static const int nameFieldLength = 30;

  // ---------------------------------------------------------------------------
  // Build the complete buffer
  // ---------------------------------------------------------------------------

  /// Build the firmware buffer from categories, diseases, and their frequencies.
  ///
  /// [categories] - all categories to include.
  /// [diseases] - all diseases/programs to include.
  /// [frequenciesByDiseaseId] - map from disease ID to its list of frequencies.
  ///
  /// Returns the packed binary data as [Uint8List], or `null` if the data
  /// exceeds [maxSize].
  static Uint8List? build({
    required List<Category> categories,
    required List<Disease> diseases,
    required Map<int, List<Frequency>> frequenciesByDiseaseId,
  }) {
    // Calculate required size.
    final totalSize =
        (categories.length * categoryRecordSize) +
        (diseases.length * diseaseRecordSize);

    if (totalSize > maxSize) {
      return null; // Data too large for the device buffer.
    }

    final buffer = Uint8List(totalSize);
    int offset = 0;

    // Write all category records.
    for (final cat in categories) {
      _writeCategory(buffer, offset, cat);
      offset += categoryRecordSize;
    }

    // Write all disease records.
    for (final disease in diseases) {
      final freqs = frequenciesByDiseaseId[disease.id] ?? [];
      _writeDisease(buffer, offset, disease, freqs);
      offset += diseaseRecordSize;
    }

    return Uint8List.fromList(buffer.sublist(0, offset));
  }

  /// Return the total byte size that [categories] and [diseases] would occupy.
  static int calculateSize({
    required int categoryCount,
    required int diseaseCount,
  }) {
    return (categoryCount * categoryRecordSize) +
        (diseaseCount * diseaseRecordSize);
  }

  // ---------------------------------------------------------------------------
  // Category record (38 bytes)
  // ---------------------------------------------------------------------------

  static void _writeCategory(Uint8List buffer, int offset, Category cat) {
    // id (2 bytes LE)
    buffer[offset + 0] = cat.id & 0xFF;
    buffer[offset + 1] = (cat.id >> 8) & 0xFF;

    // repeat (1 byte)
    buffer[offset + 2] = cat.repeat & 0xFF;

    // pause_program (2 bytes LE)
    buffer[offset + 3] = cat.pauseProgram & 0xFF;
    buffer[offset + 4] = (cat.pauseProgram >> 8) & 0xFF;

    // pause_repeat_cycle (2 bytes LE)
    buffer[offset + 5] = cat.pauseRepeatCycle & 0xFF;
    buffer[offset + 6] = (cat.pauseRepeatCycle >> 8) & 0xFF;

    // name_BG (30 bytes Win1251, null-padded)
    _writeWin1251Name(buffer, offset + 7, cat.categoryNameBG ?? '');

    // terminator
    buffer[offset + 37] = 0xFF;
  }

  // ---------------------------------------------------------------------------
  // Disease record (92 bytes)
  // ---------------------------------------------------------------------------

  static void _writeDisease(
    Uint8List buffer,
    int offset,
    Disease disease,
    List<Frequency> frequencies,
  ) {
    // id (2 bytes LE)
    buffer[offset + 0] = disease.id & 0xFF;
    buffer[offset + 1] = (disease.id >> 8) & 0xFF;

    // category_id (2 bytes LE)
    final catId = disease.categoryId ?? 0;
    buffer[offset + 2] = catId & 0xFF;
    buffer[offset + 3] = (catId >> 8) & 0xFF;

    // color_group (1 byte) — derive from category_id or default 0
    buffer[offset + 4] = 0;

    // name_BG (30 bytes Win1251, null-padded)
    _writeWin1251Name(buffer, offset + 5, disease.nameBg ?? '');

    // freq_count (1 byte)
    final freqCount = frequencies.length.clamp(0, maxFrequenciesPerDisease);
    buffer[offset + 35] = freqCount;

    // freq_data (56 bytes: up to 11 entries x 5 bytes each)
    for (int i = 0; i < freqCount; i++) {
      final f = frequencies[i];
      final fOffset = offset + 36 + (i * frequencyEntrySize);
      _writeFrequencyEntry(buffer, fOffset, f);
    }
    // Remaining freq_data bytes are already zero from Uint8List initialisation.
  }

  // ---------------------------------------------------------------------------
  // Frequency entry (5 bytes)
  // ---------------------------------------------------------------------------

  static void _writeFrequencyEntry(
    Uint8List buffer,
    int offset,
    Frequency freq,
  ) {
    // freq_Hz (2 bytes LE) — frequency in Hz, truncated to uint16
    final freqHz = freq.freq.round() & 0xFFFF;
    buffer[offset + 0] = freqHz & 0xFF;
    buffer[offset + 1] = (freqHz >> 8) & 0xFF;

    // time_sec (3 bytes LE) — duration in seconds
    final timeSec = freq.timeSec & 0xFFFFFF;
    buffer[offset + 2] = timeSec & 0xFF;
    buffer[offset + 3] = (timeSec >> 8) & 0xFF;
    buffer[offset + 4] = (timeSec >> 16) & 0xFF;
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Write a Win1251-encoded, null-padded name into the buffer.
  static void _writeWin1251Name(Uint8List buffer, int offset, String name) {
    final encoded = Win1251.encode(name);
    for (int i = 0; i < nameFieldLength; i++) {
      buffer[offset + i] = (i < encoded.length) ? encoded[i] : 0;
    }
  }

  /// Split the buffer into 128-byte blocks for block transfer.
  ///
  /// The last block may be shorter than 128 bytes and will be zero-padded
  /// to 128 bytes.
  static List<Uint8List> splitIntoBlocks(Uint8List data) {
    const blockSize = 128;
    final blocks = <Uint8List>[];
    for (int i = 0; i < data.length; i += blockSize) {
      final end = (i + blockSize > data.length) ? data.length : i + blockSize;
      final block = Uint8List(blockSize);
      block.setRange(0, end - i, data, i);
      blocks.add(block);
    }
    return blocks;
  }
}
