//
//  RemoteImage.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(url: URL) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .onReceive(imageLoader.didChange) { data in
                guard let uiImage = UIImage(data: data) else { return }
                self.image = uiImage
            }
    }
}
