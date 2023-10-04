//
//  LauncherView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct LauncherView: View {
    
    @State private var topTextOpacity = 0.0
    @State private var middleTextOpacity = 0.0
    @State private var presentTopView = false
    
    var body: some View {
        VStack {
            Text("WAmazing")
                .font(.system(size: 20, weight: .bold))
                .opacity(topTextOpacity)
            
            Text("SwiftUI Test")
                .font(.system(size: 16, weight: .medium))
                .padding(10)
                .opacity(middleTextOpacity)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                topTextOpacity = 1.0
            }
            withAnimation(.easeInOut(duration: 0.5).delay(1.0)) {
                middleTextOpacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                presentTopView = true
            }
        }
        .fullScreenCover(isPresented: $presentTopView) {
            TopView()
        }
    }
}

struct LauncherView_Previews: PreviewProvider {
    static var previews: some View {
        LauncherView()
    }
}
