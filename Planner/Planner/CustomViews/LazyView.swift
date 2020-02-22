//
//  LazyView.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 22.02.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
