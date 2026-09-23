//
//  ContentView.swift
//  Homework5 sample
//
//  Assignment: 5
//  Angel Garcia
//  9/22/2026
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // VStack = stacks its views top to bottom
        VStack(spacing: 20) {
            // my name, styled with a bigger rounded bold font and a color gradient
            Text("Angel Garcia")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundStyle(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                )
                .shadow(color: .gray.opacity(0.4), radius: 3, x: 2, y: 2)

            // image from Assets.xcassets, name in quotes without the extension
            Image("penguin")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
