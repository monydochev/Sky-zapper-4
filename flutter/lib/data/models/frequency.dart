class Frequency {
  final int id;
  final double freq; // in Hz
  final int orderNo;
  final int timeSec;
  final int diseaseId;

  Frequency({
    required this.id,
    required this.freq,
    required this.orderNo,
    required this.timeSec,
    required this.diseaseId,
  });

  factory Frequency.fromMap(Map<String, dynamic> map) => Frequency(
        id: map['id'] as int,
        freq: (map['freq'] as num).toDouble(),
        orderNo: (map['orderno'] as int?) ?? 0,
        timeSec: (map['time_sec'] as int?) ?? 0,
        diseaseId: map['disease_id'] as int,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'freq': freq,
        'orderno': orderNo,
        'time_sec': timeSec,
        'disease_id': diseaseId,
      };
}
