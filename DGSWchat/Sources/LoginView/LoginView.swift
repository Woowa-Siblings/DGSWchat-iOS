//
//  LoginView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Login View of DGSWchat
struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SWLabel("로그인")
                .font(SWFont.title)
                .padding(.bottom, 75)
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
