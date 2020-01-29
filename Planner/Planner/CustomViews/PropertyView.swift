//
//  PropertyView.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct PropertyView: View {
    
    var propertyName: String
    var propertyValue: String
    
    var body: some View {
        HStack {
            Text("\(propertyName):")
                .font(.headline)
            Text(propertyValue)
            Spacer()
        }
    .padding(EdgeInsets(
        top: 5,
        leading: 10,
        bottom: 5,
        trailing: 10))
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(propertyName: "Test", propertyValue: "Test Value")
    }
}
