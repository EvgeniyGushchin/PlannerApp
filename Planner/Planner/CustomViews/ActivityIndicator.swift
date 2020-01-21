//
//  ActivityIndicator.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 21.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
//    @Binding
    var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        shouldAnimate ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
