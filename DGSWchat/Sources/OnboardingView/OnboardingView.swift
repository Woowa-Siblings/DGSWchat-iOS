//
//  OnbordingView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Onboarding View of DGSWchat
struct OnboardingView: View {
    
    /// Bindings
    @Binding var screenState: Int
    
    /// Variables
    @State private var transition: AnyTransition = .backslide
    @State private var loginId: String = ""
    @State private var loginPw: String = ""
    
    @State private var errorMessage: String = ""
    @State private var error: Bool = false
    @State private var register: Bool = false
    
    @State private var registerName: String = ""
    @State private var registerId: String = ""
    @State private var registerPw: String = ""
    @State private var registerPwCheck: String = ""
    
    @State private var registerGrade: String = ""
    @FocusState private var gradeState: Bool
    @State private var registerClass: String = ""
    @FocusState private var classState: Bool
    @State private var registerNumber: String = ""
    @FocusState private var numberState: Bool
    
    // MARK: - Start Login
    func startAuth() {
        login(loginId: loginId, loginPw: loginPw) { response in
            switch response.result {
            case .success:
                completeAuth(response)
//                print(decodeCode(response))
//                fetchAuth(code: decodeCode(response)) { response in
//                    print(String(decoding: response.data!, as: UTF8.self))
//                    switch response.result {
//                    case .success:
//                        completeAuth(response)
//                        withAnimation(.default) {
//                            screenState = 2
//                        }
//                    case .failure:
//                        errorMessage = "서버에 연결할 수 없습니다"
//                        error.toggle()
//                    }
//                }
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
                        .elevation()
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
                        .disabled(loginId.isEmpty || loginPw.isEmpty)
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
                    ZStack(alignment: .trailing) {
                        SWField(text: $registerPwCheck,
                                placeholder: "비밀번호를 재입력하세요.",
                                icon: "Unlock", type: .secure)
                        if !registerPwCheck.isEmpty {
                            Image(registerPw == registerPwCheck ? "Check" : "Exit")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.bottom, 35)
                    
                    // MARK: - Student Info
                    VStack(alignment: .leading, spacing: 0) {
                        
                        HStack(spacing: 10) {
                            
                            // MARK: - Placeholder Image
                            Image("Tag")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundColor(registerGrade.count +
                                                 registerClass.count +
                                                 registerNumber.count > 0 ? SWColor.main1 : SWColor.gray)
                            
                            // MARK: - Text Field
                            HStack(alignment: .bottom) {
                                TextField("", text: $registerGrade)
                                    .multilineTextAlignment(.center)
                                    .focused($gradeState)
                                    .keyboardType(.numberPad)
                                    .autocapitalization(.none)
                                    .onChange(of: registerGrade) { value in
                                        if registerGrade.isValidGrade() {
                                            classState = true
                                        } else {
                                            registerGrade = ""
                                        }
                                    }
                                Text("학년")
                                    .foregroundColor(.gray)
                                TextField("", text: $registerClass)
                                    .multilineTextAlignment(.center)
                                    .focused($classState)
                                    .keyboardType(.numberPad)
                                    .autocapitalization(.none)
                                    .onChange(of: registerClass) { value in
                                        if registerClass.isValidGrade() {
                                            numberState = true
                                        } else {
                                            registerClass = ""
                                        }
                                    }
                                Text("반")
                                    .foregroundColor(.gray)
                                TextField("", text: $registerNumber)
                                    .multilineTextAlignment(.center)
                                    .focused($numberState)
                                    .keyboardType(.numberPad)
                                    .autocapitalization(.none)
                                    .onChange(of: registerNumber) { value in
                                        if !registerNumber.isValidNumber() {
                                            registerNumber = ""
                                        }
                                    }
                                Text("번")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        // MARK: - Line
                        Rectangle()
                            .fill(gradeState || classState || numberState ? SWColor.main1 : SWColor.gray)
                            .frame(height: 1)
                            .padding(.top, 10)
                    }
                    .padding(.bottom, 40)
                    .font(SWFont.body)
                    
                    // MARK: - Button
                    SWButton(action: startAuth, label: "회원가입")
                        .disabled(registerName.isEmpty || registerId.isEmpty ||
                                  registerPw.isEmpty || registerPwCheck.isEmpty ||
                                  registerGrade.isEmpty || registerClass.isEmpty ||
                                  registerNumber.isEmpty || registerPw != registerPwCheck)
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
