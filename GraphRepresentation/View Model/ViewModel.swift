//
//  ViewModel.swift
//  GraphRepresentation
//
//  Created by Tomasz Kubicki on 27/07/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var temperatures = [TemperatureDB]()
    
    init() {
        self.getData()
    }
    
    func getData() {
        let url = URL(string: "http://10.1.1.40:8080/demo/date/after?date=2023-07-28+14:25:00")
        
        if let url = url {
            // Create url request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
            request.httpMethod = "GET"
            
            //Get url session
            let session = URLSession.shared
            
            //Create data task
            let dataTask = session.dataTask(with: request) { [self] (data, response, error) in
             
                if error == nil {
                    do {
                        //Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([TemperatureDB].self, from: data!)
                        
                        DispatchQueue.main.async {
                            self.temperatures = result
                        }
                        
                        print("Succesfully retrieved data")
                    }
                    catch {
                        print(error)
                    }
                } else {
                    print("Can't get connection to retreive the data")
                }
            }
            dataTask.resume()
        }
    }
}
