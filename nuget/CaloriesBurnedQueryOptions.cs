using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CaloriesBurned
{
    /// <summary>
    /// Query options for the Calories Burned API
    /// </summary>
    public class CaloriesBurnedQueryOptions
    {
        /// <summary>
        /// Activity to search for, e.g. running, biking, yoga or mowing lawn. Required unless code is given.
        /// </summary>
        [JsonProperty("activity")]
        public string Activity { get; set; }

        /// <summary>
        /// Five-digit Compendium activity code to look up directly, e.g. 12150.
        /// </summary>
        [JsonProperty("code")]
        public string Code { get; set; }

        /// <summary>
        /// Body weight in kg (metric) or lb (imperial). Defaults to 70 kg.
        /// </summary>
        [JsonProperty("weight")]
        public double? Weight { get; set; }

        /// <summary>
        /// Unit system for weight and height: metric (kg, cm) or imperial (lb, in). Defaults to metric.
        /// </summary>
        [JsonProperty("unit")]
        public string Unit { get; set; }

        /// <summary>
        /// Duration of the activity in minutes (1-1440). Defaults to 60.
        /// </summary>
        [JsonProperty("duration")]
        public double? Duration { get; set; }

        /// <summary>
        /// Calorie target: adds minutesToBurn, the minutes each activity takes to burn this many kcal.
        /// </summary>
        [JsonProperty("calories")]
        public double? Calories { get; set; }

        /// <summary>
        /// Age in years (18-120), for a personalised estimate with sex and height.
        /// </summary>
        [JsonProperty("age")]
        public int? Age { get; set; }

        /// <summary>
        /// Sex for the resting metabolic rate estimate, with age and height.
        /// </summary>
        [JsonProperty("sex")]
        public string Sex { get; set; }

        /// <summary>
        /// Height in cm (metric) or inches (imperial), with age and sex.
        /// </summary>
        [JsonProperty("height")]
        public double? Height { get; set; }

        /// <summary>
        /// Measured resting metabolic rate in kcal per day (500-5000). Overrides age, sex and height.
        /// </summary>
        [JsonProperty("rmr")]
        public double? Rmr { get; set; }

        /// <summary>
        /// Number of matching activities to return (1-25). Defaults to 5.
        /// </summary>
        [JsonProperty("limit")]
        public int? Limit { get; set; }
    }
}
