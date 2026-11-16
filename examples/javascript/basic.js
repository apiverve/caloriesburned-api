/**
 * Calories Burned API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Calories Burned API.
 * API Documentation: https://docs.apiverve.com/ref/caloriesburned
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/caloriesburned';

/**
 * Make a GET request to the Calories Burned API
 */
async function callCaloriesBurnedAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            activity: &#x27;running&#x27;,
            code: &#x27;12150&#x27;,
            weight: 70,
            unit: &#x27;metric&#x27;,
            duration: 30,
            calories: 300
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callCaloriesBurnedAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
