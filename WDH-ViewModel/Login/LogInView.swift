//
//  LogInView.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 14.05.24.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel: LogInViewModel = LogInViewModel()
    
    var body: some View {
        VStack{
            Text("Bitte loggen Sie sich ein: ")
            TextField("Username: ", text: $viewModel.inputUser)
            SecureField("Password: ", text: $viewModel.inputPassword)
            
            Button(action: {viewModel.checkLogin()}, label: {
                Text("LogIn")
            })
            
            //FullScreenCover: Screen wird von der neuen View bedeckt
            .fullScreenCover(isPresented: $viewModel.isLoggedIn, content: {
                PizzaMainView()
            })
            
        }
        .environmentObject(viewModel)

    }
}

#Preview {
    LogInView()
}

