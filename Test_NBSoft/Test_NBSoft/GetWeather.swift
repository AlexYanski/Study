//
//  GetWeather.swift
//  Test_NBSoft
//
//  Created by Alexandr Yanski on 06.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import Foundation

struct Weather {
    let summary: String
    let icon: String
    let temperature: Double
    
    
    enum errors: Error {
        case missing(String)
        case invalid(String, Any)
        
    }
    
    init(json: [String : Any]) throws {
        guard let summary = json["summary"] as? String else {throw errors.missing("Summary is missing")}
        guard let icon = json["icon"] as? String else {throw errors.missing("Icon is missing")}
        guard let temperature = json["temperature"] as? Double else {throw errors.missing("Temperature is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    
    static let path = "https://api.darksky.net/forecast/4126b904ff55a8fb63c15040dbae1a44/"
    
    static func forecast(latitude: Double, longitude: Double, completion: @escaping ([Weather]) -> ()) {
        
        let url = path + String(latitude) + "," + String(longitude)
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, err: Error?) in
            if let data = data {

                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let currentlyForcast = json["currently"] as? [String: Any] {
                            if let weatherObject = try? Weather(json: currentlyForcast) {
                                completion([weatherObject])
                            }
                            
                        }
                    }
                } catch {
                    print(err!.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
}


