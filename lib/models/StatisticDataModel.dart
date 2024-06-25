class StatisticData {
  final String label;
  final int count;

  StatisticData({required this.label, required this.count});

  factory StatisticData.fromJson(Map<String, dynamic> json) {
    return StatisticData(
      label: json['label'],
      count: json['count'],
    );
  }
}

class ChartType {
  final String type;
  final Map<String, dynamic> options;

  ChartType({required this.type, required this.options});

  factory ChartType.fromJson(Map<String, dynamic> json) {
    return ChartType(
      type: json['type'],
      options: json['options'],
    );
  }
}

class Statistic {
  final List<StatisticData> counts;
  final ChartType chartType;
  final String customLabel;

  Statistic({required this.counts, required this.chartType, required this.customLabel});

  factory Statistic.fromJson(Map<String, dynamic> json) {
    var list = json['counts'] as List;
    List<StatisticData> countsList = list.map((i) => StatisticData.fromJson(i)).toList();
    return Statistic(
      counts: countsList,
      chartType: ChartType.fromJson(json['chartType']),
      customLabel: json['customLabel'],
    );
  }
}

class StatisticResponse {
  final Map<String, Statistic> data;

  StatisticResponse({required this.data});

  factory StatisticResponse.fromJson(Map<String, dynamic> json) {
    var data = (json['data'] as Map<String, dynamic>).map((key, value) => MapEntry(key, Statistic.fromJson(value)));
    return StatisticResponse(
      data: data,
    );
  }
}