//
//  PizzaMainView.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 08.05.24.
//

import SwiftUI

struct PizzaMainView: View {
    
    @StateObject var viewModel: PizzaViewModel = PizzaViewModel()
    
    @EnvironmentObject var logInViewModel: LogInViewModel
    
    var body: some View {
        
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Bestellung")
                        .font(.title)
                        .bold()
                    
                    
                    ForEach(viewModel.pizzas, id: \.name) { pizza in
                        
                        NavigationLink(pizza.name) {
                            PizzaDetailView(viewModel: viewModel)
                                .onAppear(perform: {
                                    viewModel.setPizza(pizza: pizza)
                                })
                        }
                        
                        
                        
                    }
                    .padding()
                }
                
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {viewModel.toggleShowSheet()}, label: {
                            Image(systemName: "cart")
                                .badge(viewModel.orderList.count)
                        })
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) { Button("Ausloggen") {
                        logInViewModel.logOut()
                    }
                    }
                }
                .sheet(isPresented: $viewModel.showSheet, content: {
                    OrderList(pizzaViewModel: viewModel)
                })
            }
        }
        
        .padding()
    }
    
}

#Preview {
    PizzaMainView()
}
