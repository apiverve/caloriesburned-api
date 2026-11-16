# Calories Burned API

Calories Burned estimates the energy any of 1,100+ activities uses, from running and cycling to gardening and office work. Search by name or Compendium code, pass body weight in kg or lb and a duration, and get calories per hour and in total with the MET value, its Compendium code and the intensity class. Personalise with age, sex and height or a measured RMR, or ask how long it takes to burn a calorie target.

[![npm version](https://img.shields.io/npm/v/@apiverve/caloriesburned.svg)](https://www.npmjs.com/package/@apiverve/caloriesburned)

This is a JavaScript wrapper for the [Calories Burned API](https://apiverve.com/marketplace/caloriesburned?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/caloriesburned
```

Using yarn:
```shell
yarn add @apiverve/caloriesburned
```

---

## Configuration

Before using the Calories Burned API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Calories Burned API documentation is found here: [https://docs.apiverve.com/ref/caloriesburned](https://docs.apiverve.com/ref/caloriesburned?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const caloriesburnedAPI = require('@apiverve/caloriesburned');
const api = new caloriesburnedAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  activity: "running",
  code: "12150",
  weight: 70,
  unit: "metric",
  duration: 30,
  calories: 300,
  age: 35,
  sex: "female",
  height: 170,
  rmr: 1500,
  limit: 10
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  activity: "running",
  code: "12150",
  weight: 70,
  unit: "metric",
  duration: 30,
  calories: 300,
  age: 35,
  sex: "female",
  height: 170,
  rmr: 1500,
  limit: 10
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  activity: "running",
  code: "12150",
  weight: 70,
  unit: "metric",
  duration: 30,
  calories: 300,
  age: 35,
  sex: "female",
  height: 170,
  rmr: 1500,
  limit: 10
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
