import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class CaloriesburnedValidationException implements Exception {
  final List<String> errors;

  CaloriesburnedValidationException(this.errors);

  @override
  String toString() => 'CaloriesburnedValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Calories Burned API client.
///
/// For more information, visit: https://apiverve.com/marketplace/caloriesburned?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [activity] - Activity to search for, e.g. running, biking, yoga or mowing lawn. Required unless code is given. [maxLength: 100]
/// * [code] - Five-digit Compendium activity code to look up directly, e.g. 12150. [minLength: 5, maxLength: 5]
/// * [weight] - Body weight in kg (metric) or lb (imperial). Defaults to 70 kg. [min: 1, max: 1100]
/// * [unit] - Unit system for weight and height: metric (kg, cm) or imperial (lb, in). Defaults to metric.
/// * [duration] - Duration of the activity in minutes (1-1440). Defaults to 60. [min: 1, max: 1440]
/// * [calories] - Calorie target: adds minutesToBurn, the minutes each activity takes to burn this many kcal. [min: 1, max: 20000]
/// * [age] - Age in years (18-120), for a personalised estimate with sex and height. [min: 18, max: 120]
/// * [sex] - Sex for the resting metabolic rate estimate, with age and height.
/// * [height] - Height in cm (metric) or inches (imperial), with age and sex. [min: 1, max: 300]
/// * [rmr] - Measured resting metabolic rate in kcal per day (500-5000). Overrides age, sex and height. [min: 500, max: 5000]
/// * [limit] - Number of matching activities to return (1-25). Defaults to 5. [min: 1, max: 25]
class CaloriesburnedClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'activity': ValidationRule(type: 'string', required: false, maxLength: 100),
    'code': ValidationRule(type: 'string', required: false, minLength: 5, maxLength: 5),
    'weight': ValidationRule(type: 'number', required: false, min: 1, max: 1100),
    'unit': ValidationRule(type: 'string', required: false),
    'duration': ValidationRule(type: 'number', required: false, min: 1, max: 1440),
    'calories': ValidationRule(type: 'number', required: false, min: 1, max: 20000),
    'age': ValidationRule(type: 'integer', required: false, min: 18, max: 120),
    'sex': ValidationRule(type: 'string', required: false),
    'height': ValidationRule(type: 'number', required: false, min: 1, max: 300),
    'rmr': ValidationRule(type: 'number', required: false, min: 500, max: 5000),
    'limit': ValidationRule(type: 'integer', required: false, min: 1, max: 25),
  };

  CaloriesburnedClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/caloriesburned',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [CaloriesburnedValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw CaloriesburnedValidationException(errors);
    }
  }

  /// Execute a request to the Calories Burned API.
  ///
  /// Parameters are validated before sending the request.
  Future<CaloriesburnedResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw CaloriesburnedException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return CaloriesburnedResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw CaloriesburnedException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw CaloriesburnedException('Resource not found');
      } else {
        throw CaloriesburnedException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is CaloriesburnedException) rethrow;
      throw CaloriesburnedException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Calories Burned API client.
class CaloriesburnedException implements Exception {
  final String message;

  CaloriesburnedException(this.message);

  @override
  String toString() => 'CaloriesburnedException: $message';
}
