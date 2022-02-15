part of health;

/// A [HealthHeartbeat] object corresponds to a heartbeate extracted of a HKHeartbeatSeriesSample from
/// Apple HealthKit.
class HealthHeartbeat {
  double _timeSinceSeriesStart;
  bool _precededByGap;

  HealthHeartbeat(
    this._timeSinceSeriesStart,
    this._precededByGap,
  );

  /// Converts a json object to the [HealthHeartbeat]
  factory HealthHeartbeat.fromJson(json) => HealthHeartbeat(
        json['timeSinceSeriesStart'],
        json['precededByGap'],
      );

  /// Converts the [HealthHeartbeat] to a json object
  Map<String, dynamic> toJson() => {
        'timeSinceSeriesStart': timeSinceSeriesStart,
        'precededByGap': precededByGap,
      };

  @override
  String toString() => '${this.runtimeType} - '
      'timeSinceSeriesStart: $timeSinceSeriesStart, '
      'precededByGap: $precededByGap';

  /// The time of the heartbeat, measured from the series builder’s start date. This must be a positive value.
  double get timeSinceSeriesStart => _timeSinceSeriesStart;

  /// A Boolean value that indicates whether this heartbeat was immediately preceded by a gap in the data, indicating that one or more heartbeats may be missing.
  bool get precededByGap => _precededByGap;

  @override
  bool operator ==(Object o) {
    return o is HealthHeartbeat &&
        this.timeSinceSeriesStart == o.timeSinceSeriesStart &&
        this.precededByGap == o.precededByGap;
  }

  @override
  int get hashCode => toJson().hashCode;
}
