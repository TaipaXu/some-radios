//
//  RadioApi.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import Foundation
import Alamofire

func getRadiosByType(type: TopRadiosType, withParams params: [String: Any]?, completion: @escaping (Result<[Radio], Error>) -> Void) {
    var url: String = ""
    switch type {
    case .ByClicks:
        url = "http://89.58.16.19/json/stations/topclick";
    case .ByVotes:
        url = "http://89.58.16.19/json/stations/topvote";
    case .ByRecentClick:
        url = "http://89.58.16.19/json/stations/lastclick";
    case .ByRecentlyChange:
        url = "http://89.58.16.19/json/stations/lastchange";
    }
    guard let baseURL = URL(string: url) else {
        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }

    var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)

    var queryItems: [URLQueryItem] = []
    if let params = params {
        for (key, value) in params {
            let stringValue = "\(value)"
            let queryItem = URLQueryItem(name: key, value: stringValue)
            queryItems.append(queryItem)
        }
    }

    urlComponents?.queryItems = queryItems

    guard let url = urlComponents?.url else {
        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL with parameters"])))
        return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            return
        }

        if let data = data {
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Radio].self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }

    task.resume()
}
