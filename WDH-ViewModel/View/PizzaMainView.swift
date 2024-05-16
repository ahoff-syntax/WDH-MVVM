//
//  PizzaMainView.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 08.05.24.
//

import SwiftUI



struct PizzaMainView: View {
    
    @StateObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()
    
    @EnvironmentObject var logInViewModel: LogInViewModel
   
    var body: some View {
        
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Bestellung")
                        .font(.title)
                        .bold()
                    
                    
                    ForEach(pizzaViewModel.pizzas, id: \.name) { pizza in
                        
                        NavigationLink(pizza.name) {
                            PizzaDetailView(pizzaViewModel: pizzaViewModel)
                                .onAppear(perform: {
                                    pizzaViewModel.setPizza(pizza: pizza)
                                })
                        }
                        
                        
                        
                    }
                    .padding()
                }
                
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {pizzaViewModel.toggleShowSheet()}, label: {
                            Image(systemName: "cart")
                               
                        })
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) { Button("Ausloggen") {
                        logInViewModel.logOut()
                    }
                    }
                }
                .sheet(isPresented: $pizzaViewModel.showSheet, content: {
                    OrderList(pizzaViewModel: pizzaViewModel)
                })
            }
        }
        
        .padding()
    }
    
}

#Preview {
    PizzaMainView()
}
