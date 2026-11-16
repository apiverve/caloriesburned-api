/// Response models for the Calories Burned API.

/// API Response wrapper.
class CaloriesburnedResponse {
  final String status;
  final dynamic error;
  final CaloriesburnedData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CaloriesburnedResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CaloriesburnedResponse.fromJson(Map<String, dynamic> json) => CaloriesburnedResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CaloriesburnedData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Calories Burned API.

class CaloriesburnedData {
  String? query;
  num? count;
  num? totalMatches;
  num? weightKg;
  num? durationMinutes;
  dynamic targetCalories;
  bool? personalized;
  dynamic rmrKcalPerDay;
  List<CaloriesburnedDataActivitiesItem>? activities;

  CaloriesburnedData({
    this.query,
    this.count,
    this.totalMatches,
    this.weightKg,
    this.durationMinutes,
    this.targetCalories,
    this.personalized,
    this.rmrKcalPerDay,
    this.activities,
  });

  factory CaloriesburnedData.fromJson(Map<String, dynamic> json) => CaloriesburnedData(
      query: json['query'],
      count: json['count'],
      totalMatches: json['totalMatches'],
      weightKg: json['weightKg'],
      durationMinutes: json['durationMinutes'],
      targetCalories: json['targetCalories'],
      personalized: json['personalized'],
      rmrKcalPerDay: json['rmrKcalPerDay'],
      activities: (json['activities'] as List?)?.map((e) => CaloriesburnedDataActivitiesItem.fromJson(e)).toList(),
    );
}

class CaloriesburnedDataActivitiesItem {
  String? code;
  String? activity;
  String? heading;
  num? met;
  dynamic correctedMet;
  String? intensity;
  num? caloriesPerHour;
  num? durationMinutes;
  num? totalCalories;
  dynamic minutesToBurn;

  CaloriesburnedDataActivitiesItem({
    this.code,
    this.activity,
    this.heading,
    this.met,
    this.correctedMet,
    this.intensity,
    this.caloriesPerHour,
    this.durationMinutes,
    this.totalCalories,
    this.minutesToBurn,
  });

  factory CaloriesburnedDataActivitiesItem.fromJson(Map<String, dynamic> json) => CaloriesburnedDataActivitiesItem(
      code: json['code'],
      activity: json['activity'],
      heading: json['heading'],
      met: json['met'],
      correctedMet: json['correctedMet'],
      intensity: json['intensity'],
      caloriesPerHour: json['caloriesPerHour'],
      durationMinutes: json['durationMinutes'],
      totalCalories: json['totalCalories'],
      minutesToBurn: json['minutesToBurn'],
    );
}

class CaloriesburnedRequest {
  String? activity;
  String? code;
  double? weight;
  String? unit;
  double? duration;
  double? calories;
  int? age;
  String? sex;
  double? height;
  double? rmr;
  int? limit;

  CaloriesburnedRequest({
    this.activity,
    this.code,
    this.weight,
    this.unit,
    this.duration,
    this.calories,
    this.age,
    this.sex,
    this.height,
    this.rmr,
    this.limit,
  });

  Map<String, dynamic> toJson() => {
      if (activity != null) 'activity': activity,
      if (code != null) 'code': code,
      if (weight != null) 'weight': weight,
      if (unit != null) 'unit': unit,
      if (duration != null) 'duration': duration,
      if (calories != null) 'calories': calories,
      if (age != null) 'age': age,
      if (sex != null) 'sex': sex,
      if (height != null) 'height': height,
      if (rmr != null) 'rmr': rmr,
      if (limit != null) 'limit': limit,
    };
}
