"""
Calories Burned API - Basic Usage Example

This example demonstrates the basic usage of the Calories Burned API.
API Documentation: https://docs.apiverve.com/ref/caloriesburned
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/caloriesburned'

def call_caloriesburned_api():
    """
    Make a GET request to the Calories Burned API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;activity&#x27;: &#x27;running&#x27;, &#x27;code&#x27;: &#x27;12150&#x27;, &#x27;weight&#x27;: 70, &#x27;unit&#x27;: &#x27;metric&#x27;, &#x27;duration&#x27;: 30, &#x27;calories&#x27;: 300}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Calories Burned API...\n')

    result = call_caloriesburned_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
