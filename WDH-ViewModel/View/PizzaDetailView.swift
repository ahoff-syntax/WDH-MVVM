//
//  PizzaDetailView.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 13.05.24.
//

import SwiftUI

struct PizzaDetailView: View {
    
    @ObservedObject var pizzaViewModel: PizzaViewModel
    @EnvironmentObject var logInViewModel: LogInViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("Name:")
                    .font(.headline)
                Text(pizzaViewModel.pizzaName)
                    .padding()
                
                Divider()
                
                Text("Größe:")
                    .font(.headline)
                Picker(selection: $pizzaViewModel.size, label: Text("Größe")) {
                    ForEach(Size.allCases, id: \.self) { size in
                        Text(size.rawValue).tag(size)
                    }
                }
                .pickerStyle(.automatic)
                .padding()
                
                Divider()
                
                Text("Beläge:")
                    .font(.headline)
                ForEach(pizzaViewModel.ingredients, id: \.self) { topping in
                    HStack {
                        Text(topping)
                        Button(action: {pizzaViewModel.removeIngredient(ingredient: topping)}, label: {
                            Image(systemName: "minus.circle")
                        })
                    }
                }
                
                HStack {
                    TextField(
                        "Topping hinzufügen",
                        text: $pizzaViewModel.inputIngredient
                    )
                    Button(action: {pizzaViewModel.addIngredient()}, label: {
                        Image(systemName: "plus.circle")
                    })
                }
                
                Spacer()
                
                Button(action: {pizzaViewModel.addPizzaToOrder()}, label: {
                    Image(systemName: "cart")
                    
                })
                
                .padding()
                
                
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Ausloggen") {
                            logInViewModel.logOut()
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    PizzaDetailView(pizzaViewModel: PizzaViewModel())
}

