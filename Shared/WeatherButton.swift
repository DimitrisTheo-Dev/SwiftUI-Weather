//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Dimitris Theodoropoulos on 7/1/22.
//

import Foundation
import SwiftUI

struct WeatherButtonView: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10.0)
    }
}
