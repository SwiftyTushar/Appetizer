//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Tushar Patil on 06/11/23.
//

import Foundation
import UIKit

class NetworkManager{
    private init(){}
    static let shared = NetworkManager()
    private let caches = NSCache<NSString,UIImage>()
    
    func fetchData(completion:@escaping([FoodItem]?,String?) -> Void){
        guard let url = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers")
        else {
            completion(nil,"URL Not found!")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil{
                completion(nil,error?.localizedDescription)
            } else {
                if let apiData = data{
                    if let decoded = try? JSONDecoder().decode(AppetizersResponse.self, from: apiData){
                        completion(decoded.request,nil)
                    } else {
                        completion(nil, "Error while parsing the data")
                    }
                }
            }
        }
        task.resume()
    }
    func downloadImage(urlString:String,completion:@escaping(UIImage?) -> Void){
        if let image = caches.object(forKey: NSString(string: urlString)){
            completion(image)
            return
        }
        print("downloadImage--- \(urlString)")
        guard let url = URL(string: urlString) else {completion(nil); return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { dData, response, error in
            print("Error--- \(error?.localizedDescription ?? "nil")")
            guard let data = dData, let image = UIImage(data: data) else {completion(nil);return}
            self.caches.setObject(image, forKey: NSString(string: urlString))
            completion(image)
        }
        task.resume()
    }
}
