/**
 * Basic Example - Calories Burned API
 *
 * This example demonstrates how to use the Calories Burned API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const caloriesburnedAPI = require('../index.js');

// Initialize the API client
const api = new caloriesburnedAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
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

// Make the API request using callback
console.log('Making request to Calories Burned API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
