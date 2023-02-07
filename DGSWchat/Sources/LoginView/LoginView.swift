//
//  LoginView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Login View of DGSWchat
struct LoginView: View {
    
    /// Variables
    @State var loginId: String = ""
    @State var loginPw: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // MARK: - Title
            SWLabel("로그인")
                .font(SWFont.title)
                .padding(.bottom, 50)
            
            // MARK: - ID
            SWField(text: $loginId)
                .padding(.bottom, 30)
            
            // MARK: - Password
            SWField(text: $loginPw, type: .secure)
                .padding(.bottom, 30)
            
            // MARK: - Login Button
            SWButton(action: {
                
            }, label: "로그인")
            .elevation()
        }
        .padding(30)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}