//
//  ContentView.swift
//  Shared
//
//  Created by Dimitris Theodoropoulos on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 14 : 22)
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temperature: 22)
                        WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.rain.fill", temperature: 14)
                        WeatherDayView(dayOfWeek: "Thu", imageName: "sun.max.fill", temperature: 26)
                        WeatherDayView(dayOfWeek: "Fri", imageName: "snowflake", temperature: 7)
                        WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.sun.rain.fill", temperature: 19)
                }
                
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
                
                }
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.leading, 5)
        .padding(.trailing, 5)

    }
}

struct BackgroundView: View {

   @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName:  String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
 
struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


