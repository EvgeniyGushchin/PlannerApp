//
//  RoundedButton.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 20.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
    
    let title: String
    let color: Color
    let action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .background(color)
        .cornerRadius(4.0)
        .padding(.horizontal, 10)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Save", color: .blue, action: {})
    }
}
