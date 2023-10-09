class Player {
  final String nickname;
  final String SocketId;
  final double Points;
  final String PlayerType;

  Player({
    required this.nickname,
    required this.SocketId,
    required this.Points,
    required this.PlayerType,
  });

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketID': SocketId,
      'points': Points,
      'playerType': PlayerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      SocketId: map['socketID'] ?? '',
      Points: map['points']?.toDouble() ?? 0.0,
      PlayerType: map['playerType'] ?? '',
    );
  }

  Player copyWith({
    String? nickname,
    String? SocketId,
    double? Points,
    String? PlayerType,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      SocketId: SocketId ?? this.SocketId,
      Points: Points ?? this.Points,
      PlayerType: PlayerType ?? this.PlayerType,
    );
  }
}
