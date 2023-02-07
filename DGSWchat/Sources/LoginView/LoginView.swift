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
    @State var error: Bool = false
    @State var errorMessage: String = ""
    
    // MARK: - Start Login
    func startAuth() {
        fetchCode(loginId: loginId, loginPw: loginPw) { response in
            switch response.result {
            case .success:
                fetchAuth(code: decodeCode(response)) { response in
                    switch response.result {
                    case .success:
                        completeAuth(response)
                    case .failure:
                        errorMessage = "서버에 연결할 수 없습니다"
                        error.toggle()
                    }
                }
            case .failure:
                errorMessage = "ID 또는 비밀번호가 틀렸습니다"
                error.toggle()
            }
        }
    }
    
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
            SWButton(action: startAuth, label: "로그인")
                .elevation()
        }
        .padding(30)
        .alert(isPresented: $error) {
            Alert(title: Text("오류"), message: Text(errorMessage))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
