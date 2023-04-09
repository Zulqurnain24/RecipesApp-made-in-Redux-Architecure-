//
//  Subsystem.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var data = Data()
    var didChange = PassthroughSubject<Data, Never>()
    var url: URL
    
    init(url: URL) {
        self.url = url
        load()
    }
    
    func load() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.data = data
                self.didChange.send(data)
            }
        }.resume()
    }
}
