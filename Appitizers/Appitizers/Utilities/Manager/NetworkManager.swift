//
//  NetworkManager.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 17.01.2025.
//

import SwiftUI


final class  NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend-herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL +  "appetizers"
    private let cache = NSCache<NSString, UIImage>()
    private init(){}
    
    func getAppetizers(completed: @escaping (Result<[Appitizer],APError>)->Void){
        guard let url = URL(string: appetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task  =     URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            
            if let _error = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode==200
            else{
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let decodedResponse = try decoder.decode(AppitizersResponse.self, from: data)
                completed(.success(decodedResponse.request))
                return
            }
            catch {
                completed(.failure(.invalidData))
            }
            
        }
        
    //    task.resume()
        
        let appetizersResponse : AppitizersResponse?  = decodeDummyJsonForFile()
        if(appetizersResponse != nil){
            completed(.success(appetizersResponse!.request))
        }
        
    }
    
    func decodeDummyJsonForFile() -> AppitizersResponse? {
        guard let fileURL = Bundle.main.url(forResource: "DummyAppetizersJson", withExtension: nil) else{
            print(" not found  Dummy Json")
            return nil
        }
        
        do {
            let data  = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let appetizersResponse : AppitizersResponse = try decoder.decode(AppitizersResponse.self, from: data)
            
            
            return appetizersResponse
        }
        catch{
            print("Decode process not success")
            return nil
        }
        
        return nil
    }
    
    
    func donwloadImage(fromURLString urlString  : String, completed : @escaping (UIImage?)-> Void)  {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url  = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url:url)){ data, response, error in
            
            guard let data = data, let image  = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
           
        }
        
        task.resume()
    }
    
}
