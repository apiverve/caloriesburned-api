# [Calories Burned API](https://apiverve.com/marketplace/caloriesburned?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Calories Burned estimates the energy any of 1,100+ activities uses, from running and cycling to gardening and office work. Search by name or Compendium code, pass body weight in kg or lb and a duration, and get calories per hour and in total with the MET value, its Compendium code and the intensity class. Personalise with age, sex and height or a measured RMR, or ask how long it takes to burn a calorie target.

The Calories Burned API provides a simple, reliable way to integrate calories burned functionality into your applications. Built for developers who need production-ready calories burned capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/caloriesburned?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/caloriesburned?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/caloriesburned)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.CaloriesBurned)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-caloriesburned/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_caloriesburned)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/caloriesburned)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_caloriesburned)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callCaloriesBurnedAPI() {
    try {
        const params = new URLSearchParams({
            activity: 'running',
            code: '12150',
            weight: 70,
            unit: 'metric',
            duration: 30,
            calories: 300
        });

        const response = await fetch(`https://api.apiverve.com/v1/caloriesburned?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callCaloriesBurnedAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/caloriesburned?activity=running&code=12150&weight=70&unit=metric&duration=30&calories=300" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/caloriesburned
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/caloriesburned) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.CaloriesBurned
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.CaloriesBurned) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-caloriesburned
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-caloriesburned/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_caloriesburned
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_caloriesburned) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/caloriesburned
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/caloriesburned) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_caloriesburned
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_caloriesburned) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:caloriesburned-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/caloriesburned-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Calories Burned API](https://apiverve.com/marketplace/caloriesburned?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/caloriesburned](https://docs.apiverve.com/ref/caloriesburned)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Calories Burned API is commonly used for:

- **Web Applications** - Add calories burned features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with calories burned capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Calories Burned API:

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

---

## Support & Community

- 🏠 **API Home**: [Calories Burned API](https://apiverve.com/marketplace/caloriesburned?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
