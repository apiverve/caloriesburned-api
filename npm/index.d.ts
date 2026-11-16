declare module '@apiverve/caloriesburned' {
  export interface caloriesburnedOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface caloriesburnedResponse {
    status: string;
    error: string | null;
    data: CaloriesBurnedData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CaloriesBurnedData {
      query:           null | string;
      count:           number | null;
      totalMatches:    number | null;
      weightKg:        number | null;
      durationMinutes: number | null;
      targetCalories:  null;
      personalized:    boolean | null;
      rmrKcalPerDay:   null;
      activities:      Activity[];
  }
  
  interface Activity {
      code:            null | string;
      activity:        null | string;
      heading:         null | string;
      met:             number | null;
      correctedMet:    null;
      intensity:       null | string;
      caloriesPerHour: number | null;
      durationMinutes: number | null;
      totalCalories:   number | null;
      minutesToBurn:   null;
  }

  export default class caloriesburnedWrapper {
    constructor(options: caloriesburnedOptions);

    execute(callback: (error: any, data: caloriesburnedResponse | null) => void): Promise<caloriesburnedResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: caloriesburnedResponse | null) => void): Promise<caloriesburnedResponse>;
    execute(query?: Record<string, any>): Promise<caloriesburnedResponse>;
  }
}
