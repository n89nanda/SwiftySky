//
//  DarkSky.swift
//  Pods
//
//  Created by Nanda  on 4/6/17.
//  Source https://darksky.net/dev/docs/response 
//

import Foundation
import ObjectMapper

//A data point object contains various properties, each representing the average (unless otherwise specified) of a particular weather phenomenon occurring during a period of time: an instant in the case of currently, a minute for minutely, an hour for hourly, and a day for daily. These properties are:
struct DataPoint {
    
    //The apparent (or “feels like”) temperature in degrees Fahrenheit.
    var apparentTemperature: String?
    
    //The maximum value of apparentTemperature during a given day.
    var apparentTemperatureMax: String?
    
    //The UNIX time of when apparentTemperatureMax occurs during a given day.
    var apparentTemperatureMaxTime: String?
    
    //The minimum value of apparentTemperature during a given day.
    var apparentTemperatureMin: String?
    
    //The UNIX time of when apparentTemperatureMin occurs during a given day.
    var apparentTemperatureMinTime: String?
    
    //The percentage of sky occluded by clouds, between 0 and 1, inclusive.
    var cloudCover: String?

    //The dew point in degrees Fahrenheit.
    var dewPoint: String?
    
    //The relative humidity, between 0 and 1, inclusive.
    var humidity: String?
    
    //A machine-readable text summary of this data point, suitable for selecting an icon for display. If defined, this property will have one of the following values: clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night. (Developers should ensure that a sensible default is defined, as additional values, such as hail, thunderstorm, or tornado, may be defined in the future.)
    var icon: String?
    
    //The fractional part of the lunation number during the given day: a value of 0 corresponds to a new moon, 0.25 to a first quarter moon, 0.5 to a full moon, and 0.75 to a last quarter moon. (The ranges in between these represent waxing crescent, waxing gibbous, waning gibbous, and waning crescent moons, respectively.)
    var moonPhase: String?
    
    //The approximate direction of the nearest storm in degrees, with true north at 0° and progressing clockwise. (If nearestStormDistance is zero, then this value will not be defined.)
    var nearestStormBearing: String?
    
    //The approximate distance to the nearest storm in miles. (A storm distance of 0 doesn’t necessarily refer to a storm at the requested location, but rather a storm in the vicinity of that location.)
    var nearestStormDistance: String?
    
    //The columnar density of total atmospheric ozone at the given time in Dobson units.
    var ozone: String?
    
    //The amount of snowfall accumulation expected to occur, in inches. (If no snowfall is expected, this property will not be defined.)
    var precipAccumulation: String?
    
    //The intensity (in inches of liquid water per hour) of precipitation occurring at the given time. This value is conditional on probability (that is, assuming any precipitation occurs at all) for minutely data points, and unconditional otherwise.
    var precipIntensity: String?
    
    //The maximum value of precipIntensity during a given day.
    var precipIntensityMax: String?
    
    //The UNIX time of when precipIntensityMax occurs during a given day.
    var precipIntensityMaxTime: String?
    
    //The probability of precipitation occurring, between 0 and 1, inclusive.
    var precipProbability: String?
    
    //The type of precipitation occurring at the given time. If defined, this property will have one of the following values: "rain", "snow", or "sleet" (which refers to each of freezing rain, ice pellets, and “wintery mix”). (If precipIntensity is zero, then this property will not be defined.)
    var precipType: String?
    
    //The sea-level air pressure in millibars.
    var pressure: String?
    
    //A human-readable text summary of this data point. (This property has millions of possible values, so don’t use it for automated purposes: use the icon property, instead!)
    var summary: String?
    
    //The UNIX time of when the sun will rise during a given day.
    var sunriseTime: String?
    
    //The UNIX time of when the sun will set during a given day.
    var sunsetTime: String?
    
    //The air temperature in degrees Fahrenheit.
    var temperature: String?
    
    //The maximum value of temperature during a given day.
    var temperatureMax: String?
    
    //The UNIX time of when temperatureMax occurs during a given day.
    var temperatureMaxTime: String?
    
    //The minimum value of temperature during a given day.
    var temperatureMin: String?
    
    //The UNIX time of when temperatureMin occurs during a given day.
    var temperatureMinTime: String?
    
    //The UNIX time at which this data point begins. minutely data point are always aligned to the top of the minute, hourly data point objects to the top of the hour, and daily data point objects to midnight of the day, all according to the local time zone.
    var time: String?
    
    //The average visibility in miles, capped at 10 miles.
    var visibility: String?
    
    //The direction that the wind is coming from in degrees, with true north at 0° and progressing clockwise. (If windSpeed is zero, then this value will not be defined.)
    var windBearing: String?
    
    //The wind speed in miles per hour.
    var windSpeed: String?
    
}

//A data block object represents the various weather phenomena occurring over a period of time. Such objects contain the following properties:
struct DataBlock {
    
    //An array of data points, ordered by time, which together describe the weather conditions at the requested location over time.
    var data: [DataPoint]
    
    //A human-readable summary of this data block.
    var summary: String?
    
    //A machine-readable text summary of this data block. (May take on the same values as the iconproperty of data points.)
    var icon: String?
}

//The alerts array contains objects representing the severe weather warnings issued for the requested location by a governmental authority (please see our data sources page for a list of sources). Objects in the alerts array contain the following properties:


struct AlertArray {
    
    //A detailed description of the alert.
    var description: String?
    
    //The UNIX time at which the alert will expire. (Some alerts sources, unfortunately, do not define expiration time, and in these cases this parameter will not be defined.)
    var expires: String?
    
    //An array of strings representing the names of the regions covered by this weather alert.
    var regions: String?
    
    //The severity of the weather alert. Will take one of the following values: "advisory" (an individual should be aware of potentially severe weather), "watch" (an individual should prepare for potentially severe weather), or "warning" (an individual should take immediate action to protect themselves and others from potentially severe weather).
    var severity: String?
    
    //The UNIX time at which the alert was issued.
    var time: String?
    
    //A brief description of the alert.
    var title: String?
    
    //An HTTP(S) URI that one may refer to for detailed information about the alert.
    var uri: String?
}

//The flags object contains various metadata information related to the request. This object may optionally contain any of the following properties:
struct Flag {
    
    //The presence of this property indicates that the Dark Sky data source supports the given location, but a temporary error (such as a radar station being down for maintenance) has made the data unavailable.
    var darkskyUnavailable: String?
    
    //This property contains an array of IDs for each data source utilized in servicing this request.
    var sources: String?
    
    //Indicates the units which were used for the data in this request.
    var units: String?
}

class DarkSky: Mappable {
    
    // Dark Sky API Models
    
    //The requested latitude.
    var latitude: String = ""
    
    //The requested longitude.
    var longitude: String = ""
    
    //The IANA timezone name for the requested location. This is used for text summaries and for determining when hourly and daily data block objects begin.
    var timezone: String = ""
    
    //A data point containing the current weather conditions at the requested location.
    var currently: DataPoint?
    
    //A data block containing the weather conditions minute-by-minute for the next hour.
    var minutely: DataBlock?
    
    //A data block containing the weather conditions hour-by-hour for the next two days.
    var hourly: DataBlock?
    
    //A data block containing the weather conditions day-by-day for the next week.
    var daily: DataBlock?
    
    //An alerts array, which, if present, contains any severe weather alerts pertinent to the requested location.
    var alerts: AlertArray?
    
    //A flags object containing miscellaneous metadata about the request.
    var flags: Flag?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
        self.latitude <- map["latitude"]
        self.longitude <- map["longitude"]
        self.timezone <- map["timezone"]
    }
}
