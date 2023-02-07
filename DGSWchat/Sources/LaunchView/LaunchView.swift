//
//  LaunchView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Launch View of DGSWchat
struct LaunchView: View {
    
    /// Variables
    @State private var screenState: Int = 0
    
    var body: some View {
        
        // MARK: - Launch Screen
        if screenState == 0 {
            VStack {
                Image("Logo")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(SWColor.main1.ignoresSafeArea())
            .transition(.backslide)
            .preferredColorScheme(.dark)
            .zIndex(10)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.default) {
                        if getToken(.accessToken) == nil {
                            screenState = 1
                        } else {
                            screenState = 2
                        }
                    }
                }
            }
        }
        
        // MARK: - Login View
        else if screenState == 1 {
            LoginView(screenState: $screenState)
        }
        
        // MARK: - Main View
        else if screenState == 2 {
            MainView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
