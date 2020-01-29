//
//  ClickablePropertyView.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct ClickablePropertyView: View {
    var propertyName: String
    var propertyValue: String
    var propertyUrl: URL
    
    var body: some View {
        HStack {
            Text("\(propertyName):")
                .font(.headline)
            Button(action: {
                if UIApplication.shared.canOpenURL(self.propertyUrl) {
                    UIApplication.shared.open(self.propertyUrl)
                }
            }) {
                Text(propertyValue)
            }
            Spacer()
        }
        .padding(EdgeInsets(
            top: 5,
            leading: 10,
            bottom: 5,
            trailing: 10))
    }
}

struct ClickablePropertyView_Previews: PreviewProvider {
    static var previews: some View {
        ClickablePropertyView(propertyName: "Test", propertyValue: "Test Value", propertyUrl: URL(string: "http://ya.ru")!)
    }
}
