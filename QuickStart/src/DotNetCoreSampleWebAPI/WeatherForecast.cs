namespace DotNetCoreSampleWebAPI
{
    /// <summary>
    /// Weather forecast data model.
    /// </summary>
    public class WeatherForecast
    {
        /// <summary>
        /// Gets or sets the date.
        /// </summary>
        public DateTime Date { get; set; }

        /// <summary>
        /// Gets or sets the temperature in Celcius.
        /// </summary>
        public int TemperatureC { get; set; }

        /// <summary>
        /// Gets the temperature in Fahrenheit.
        /// </summary>
        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

        /// <summary>
        /// Gets or sets the summary.
        /// </summary>
        public string? Summary { get; set; }
    }
}