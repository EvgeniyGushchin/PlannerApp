//
//  RemoteImageURL.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 30.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import Combine

class RemoteImageURL: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            objectWillChange.send(data)
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
