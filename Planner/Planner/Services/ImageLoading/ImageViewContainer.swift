//
//  ImageViewContainer.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 30.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct ImageViewContainer: View {
    
    @ObservedObject var remoteImageURL: RemoteImageURL
    let defaultImage: UIImage
    
    init(imageURL: String, defaultImage: UIImage) {
        self.defaultImage = defaultImage
        self.remoteImageURL = RemoteImageURL(imageUrl: imageURL)
    }
    
    var body: some View {
        Image(uiImage: (remoteImageURL.data.isEmpty) ? defaultImage : imageFromData(data: remoteImageURL.data))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private func imageFromData(data: Data) -> UIImage {
        if let image = UIImage(data: data) {
            return image
        }
        else {
            return defaultImage
        }
    }
}

struct ImageViewContainer_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageViewContainer(imageURL: Gravatar(emailAddress: "egushchin@lineate.com").url(size: 100).absoluteString, defaultImage: UIImage(named: "avatar")!)
    }
}
