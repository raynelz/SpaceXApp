//
//  ApiManager.swift
//  SpaceXApp
//
//  Created by Захар Литвинчук on 03.03.2024.
//

import Foundation
import Alamofire

protocol RocketManager {
    func fetchingRocketApiData(completion: @escaping (_ apiData: Rockets) -> (Void))
}

protocol LaunchManager {
    func fetchingLaunchesApiData(completion: @escaping (_ apiData: Launches) -> (Void))
}

class NetworkManagerImpl: RocketManager, LaunchManager {
    
    func fetchingRocketApiData(completion: @escaping (_ apiData: Rockets) -> (Void)) {
        let url = "https://api.spacexdata.com/v4/rockets"
        
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Rockets.self, from: data)
                    completion(jsonData)
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func fetchingLaunchesApiData(completion: @escaping (_ apiData: Launches) -> (Void)) {
        let url = "https://api.spacexdata.com/v4/launches"
        
        AF.request(url, method: .get).responseData{ response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Launches.self, from: data)
                    print(jsonData)
                    completion(jsonData)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
}
