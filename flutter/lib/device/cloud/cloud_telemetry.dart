import 'dart:io';
import 'dart:typed_data';

import '../protocol/commands.dart';
import '../protocol/win1251.dart';

/// Sends UDP telemetry events to the Sky cloud server.
///
/// Packet format: `[3, 0, 26, event_code, data..., mac_b1, mac_b2, mac_b3, mac_b4]`
///
/// All sends are fire-and-forget. Errors are caught and silently ignored so
/// that telemetry failures never disrupt normal device operation.
class CloudTelemetry {
  static const String _cloudHost = 'cloud.sky.bg';
  static const int _cloudPort = 7433;

  RawDatagramSocket? _socket;

  /// Initialise the UDP socket. Safe to call multiple times.
  Future<void> _ensureSocket() async {
    _socket ??= await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  }

  /// Send a raw telemetry packet. Fire-and-forget.
  Future<void> _send(Uint8List packet) async {
    try {
      await _ensureSocket();
      final addresses = await InternetAddress.lookup(_cloudHost);
      if (addresses.isNotEmpty) {
        _socket!.send(packet, addresses.first, _cloudPort);
      }
    } catch (_) {
      // Silently ignore all telemetry errors.
    }
  }

  /// Build a telemetry packet with the standard header and trailing MAC bytes.
  Uint8List _buildPacket(int eventCode, List<int> data, List<int> macBytes) {
    // Header: [3, 0, 26, eventCode]
    // Payload: data bytes
    // Trailer: 4 MAC bytes
    final packet = Uint8List(4 + data.length + 4);
    packet[0] = 3;
    packet[1] = 0;
    packet[2] = 26;
    packet[3] = eventCode;
    for (int i = 0; i < data.length; i++) {
      packet[4 + i] = data[i] & 0xFF;
    }
    final macOffset = 4 + data.length;
    for (int i = 0; i < 4 && i < macBytes.length; i++) {
      packet[macOffset + i] = macBytes[i] & 0xFF;
    }
    return packet;
  }

  // ---------------------------------------------------------------------------
  // Public telemetry events
  // ---------------------------------------------------------------------------

  /// Frequency playback started.
  ///
  /// [freqBytes] = 4 bytes of frequency data (LE).
  /// [power] = power level byte.
  Future<void> sendFreqStarted(
    List<int> freqBytes,
    int power,
    List<int> macBytes,
  ) async {
    final data = <int>[...freqBytes, power];
    await _send(_buildPacket(Commands.cloudFreqStarted, data, macBytes));
  }

  /// Playback paused.
  Future<void> sendPaused(List<int> macBytes) async {
    await _send(_buildPacket(Commands.cloudPaused, [], macBytes));
  }

  /// Playback stopped.
  Future<void> sendStopped(List<int> macBytes) async {
    await _send(_buildPacket(Commands.cloudStopped, [], macBytes));
  }

  /// Playback resumed.
  Future<void> sendResumed(List<int> macBytes) async {
    await _send(_buildPacket(Commands.cloudResumed, [], macBytes));
  }

  /// Silver water generation started.
  ///
  /// [settings] = silver water configuration bytes (current, quantity, concentration).
  Future<void> sendSilverWaterStarted(
    List<int> settings,
    List<int> macBytes,
  ) async {
    await _send(
      _buildPacket(Commands.cloudSilverWaterStarted, settings, macBytes),
    );
  }

  /// Favorite category/program changed.
  Future<void> sendFavoriteChanged(
    List<int> data,
    List<int> macBytes,
  ) async {
    await _send(
      _buildPacket(Commands.cloudFavoriteChanged, data, macBytes),
    );
  }

  /// Search performed. [searchText] is encoded in Win1251 for the server.
  Future<void> sendSearch(String searchText, List<int> macBytes) async {
    final encoded = Win1251.encode(searchText);
    // Null-terminate the search text.
    final data = <int>[...encoded, 0];
    await _send(
      _buildPacket(Commands.cloudSearchPerformed, data, macBytes),
    );
  }

  /// Application start event with machine info.
  ///
  /// Format: osInfo + \0 + mac + \0 + username + \0 + computerName + \0 + ip + \0
  Future<void> sendAppStart(
    String osInfo,
    String mac,
    String username,
    String computerName,
    String ip,
    List<int> macBytes,
  ) async {
    final parts = <int>[];

    void addString(String s) {
      for (int i = 0; i < s.length; i++) {
        parts.add(s.codeUnitAt(i) & 0xFF);
      }
      parts.add(0); // null terminator
    }

    addString(osInfo);
    addString(mac);
    addString(username);
    addString(computerName);
    addString(ip);

    await _send(
      _buildPacket(Commands.cloudAppStart, parts, macBytes),
    );
  }

  /// Machine info event.
  Future<void> sendMachineInfo(
    List<int> data,
    List<int> macBytes,
  ) async {
    await _send(
      _buildPacket(Commands.cloudMachineInfo, data, macBytes),
    );
  }

  /// Release the UDP socket.
  void dispose() {
    _socket?.close();
    _socket = null;
  }
}
