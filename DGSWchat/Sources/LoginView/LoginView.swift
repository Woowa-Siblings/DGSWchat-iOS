//
//  LoginView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Login View of DGSWchat
struct LoginView: View {
    
    /// Bindings
    @Binding var screenState: Int
    
    /// Variables
    @State var transition: AnyTransition = .backslide
    @State var loginId: String = ""
    @State var loginPw: String = ""
    
    @State var errorMessage: String = ""
    @State var error: Bool = false
    @State var register: Bool = false
    
    @State var registerName: String = ""
    @State var registerId: String = ""
    @State var registerPw: String = ""
    @State var registerPwCheck: String = ""
    
    @State var registerGrade: String = ""
    @FocusState var gradeState: Bool
    @State var registerClass: String = ""
    @FocusState var classState: Bool
    @State var registerNumber: String = ""
    @FocusState var numberState: Bool
    
    // MARK: - Start Login
    func startAuth() {
        fetchCode(loginId: loginId, loginPw: loginPw) { response in
            switch response.result {
            case .success:
                print(decodeCode(response))
                fetchAuth(code: decodeCode(response)) { response in
                    print(String(decoding: response.data!, as: UTF8.self))
                    switch response.result {
                    case .success:
                        completeAuth(response)
                        withAnimation(.default) {
                            screenState = 2
                        }
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
        ZStack {
            
            // MARK: - Login Background
            VStack {
                HStack {
                    Spacer()
                    Image("Background")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .foregroundColor(SWColor.main1)
                    
                }
                Spacer()
            }
            .ignoresSafeArea()
            
            if !register {
                
                // MARK: - Login
                VStack(alignment: .leading, spacing: 0) {
                    
                    // MARK: - Title
                    SWLabel("로그인")
                        .font(SWFont.title)
                        .padding(.bottom, 40)
                    
                    // MARK: - ID
                    SWField(text: $loginId,
                            placeholder: "아이디를 입력하세요.",
                            icon: "Person")
                        .padding(.bottom, 40)
                    
                    // MARK: - Password
                    SWField(text: $loginPw,
                            placeholder: "비밀번호를 입력하세요.",
                            icon: "Lock", type: .secure)
                        .padding(.bottom, 40)
                    
                    // MARK: - Login Button
                    SWButton(action: startAuth, label: "로그인")
                        .elevation()
                        .padding(.bottom, 8)
                    
                    Button(action: {
                        transition = .backslide.combined(with: .opacity)
                        withAnimation(.default) {
                            register = true
                        }
                    }) {
                        HStack(spacing: 5) {
                            SWLabel("아직 회원이 아니신가요?")
                                .font(SWFont.mid)
                                .color(SWColor.gray)
                            VStack(spacing: 0) {
                                SWLabel("회원가입")
                                    .font(SWFont.chat)
                                    .color(SWColor.main1)
                                Rectangle()
                                    .fill(SWColor.main1)
                                    .frame(width: 27, height: 0.8)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(30)
                .transition(transition)
            } else {
                
                // MARK: - Register
                VStack(alignment: .leading, spacing: 0) {
                    
                    // MARK: - Title
                    HStack(spacing: 20) {
                        Button(action: {
                            transition = .slide.combined(with: .opacity)
                            withAnimation(.default) {
                                register = false
                            }
                        }) {
                            Image("Left")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10)
                                .foregroundColor(SWColor.label)
                        }
                        SWLabel("회원가입")
                            .font(SWFont.title)
                    }
                    .padding(.bottom, 50)
                    
                    // MARK: - Name
                    SWField(text: $registerName,
                            placeholder: "이름을 입력하세요.", icon: "Pencil")
                        .padding(.bottom, 40)
                    
                    // MARK: - ID
                    SWField(text: $registerId,
                            placeholder: "아이디를 입력하세요.", icon: "Person")
                        .padding(.bottom, 40)
                    
                    // MARK: - Password
                    SWField(text: $registerPw,
                            placeholder: "비밀번호를 입력하세요.",
                            icon: "Lock", type: .secure)
                        .padding(.bottom, 40)
                    
                    // MARK: - Password Check
                    SWField(text: $registerPwCheck,
                            placeholder: "비밀번호를 재입력하세요.",
                            icon: "Unlock", type: .secure)
                        .padding(.bottom, 40)
                    
                    // MARK: - Button
                    SWButton(action: startAuth, label: "회원가입")
                        .elevation()
                }
                .padding(30)
                .transition(transition)
            }
        }
        .alert(isPresented: $error) {
            Alert(title: Text("오류"), message: Text(errorMessage))
        }
    }
}
