# Calories Burned API - PHP Package

Calories Burned estimates the energy any of 1,100+ activities uses, from running and cycling to gardening and office work. Search by name or Compendium code, pass body weight in kg or lb and a duration, and get calories per hour and in total with the MET value, its Compendium code and the intensity class. Personalise with age, sex and height or a measured RMR, or ask how long it takes to burn a calorie target.

## Installation

Install via Composer:

```bash
composer require apiverve/caloriesburned
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Caloriesburned\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'activity' => 'running',
    'code' => '12150',
    'weight' => 70,
    'unit' => 'metric',
    'duration' => 30,
    'calories' => 300,
    'age' => 35,
    'sex' => 'female',
    'height' => 170,
    'rmr' => 1500,
    'limit' => 10
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Caloriesburned\Client;
use APIVerve\Caloriesburned\Exceptions\APIException;
use APIVerve\Caloriesburned\Exceptions\ValidationException;

try {
    $response = $client->execute(['activity' => 'running', 'code' => '12150', 'weight' => 70, 'unit' => 'metric', 'duration' => 30, 'calories' => 300, 'age' => 35, 'sex' => 'female', 'height' => 170, 'rmr' => 1500, 'limit' => 10]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "query": "running",
    "count": 5,
    "totalMatches": 73,
    "weightKg": 70,
    "durationMinutes": 30,
    "targetCalories": null,
    "personalized": false,
    "rmrKcalPerDay": null,
    "activities": [
      {
        "code": "12145",
        "activity": "Running, self-selected pace",
        "heading": "Running",
        "met": 10.5,
        "correctedMet": null,
        "intensity": "vigorous",
        "caloriesPerHour": 772,
        "durationMinutes": 30,
        "totalCalories": 386,
        "minutesToBurn": null
      },
      {
        "code": "12140",
        "activity": "Running, cross country",
        "heading": "Running",
        "met": 9.3,
        "correctedMet": null,
        "intensity": "vigorous",
        "caloriesPerHour": 684,
        "durationMinutes": 30,
        "totalCalories": 342,
        "minutesToBurn": null
      },
      {
        "code": "12170",
        "activity": "Running, stairs, up",
        "heading": "Running",
        "met": 15,
        "correctedMet": null,
        "intensity": "vigorous",
        "caloriesPerHour": 1103,
        "durationMinutes": 30,
        "totalCalories": 551,
        "minutesToBurn": null
      },
      {
        "code": "12150",
        "activity": "Running (Taylor Code 200)",
        "heading": "Running",
        "met": 8,
        "correctedMet": null,
        "intensity": "vigorous",
        "caloriesPerHour": 588,
        "durationMinutes": 30,
        "totalCalories": 294,
        "minutesToBurn": null
      },
      {
        "code": "12180",
        "activity": "Running, on a track, team practice",
        "heading": "Running",
        "met": 10,
        "correctedMet": null,
        "intensity": "vigorous",
        "caloriesPerHour": 735,
        "durationMinutes": 30,
        "totalCalories": 368,
        "minutesToBurn": null
      }
    ]
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/caloriesburned?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/caloriesburned?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/caloriesburned?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
