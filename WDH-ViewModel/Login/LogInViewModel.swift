//
//  LogInViewModel.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 14.05.24.
//

import Foundation

class LogInViewModel: ObservableObject {
    private let password = "123456"
    private let userName = "user123"
    
    @Published var inputUser: String = ""
    @Published var inputPassword: String = ""
    @Published var isLoggedIn: Bool = false
    
    
    func checkLogin() {
        isLoggedIn = inputUser.lowercased() == userName && inputPassword == password
    }
    
    func logOut() {
        isLoggedIn.toggle()
        resetInput()
    }
    
    func resetInput() {
        inputUser = ""
        inputPassword = ""
    }
}


