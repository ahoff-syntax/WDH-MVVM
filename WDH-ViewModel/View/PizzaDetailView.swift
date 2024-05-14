//
//  PizzaDetailView.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 13.05.24.
//

import SwiftUI

struct PizzaDetailView: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    
    @EnvironmentObject var logInViewModel: LogInViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("Name:")
                    .font(.headline)
                Text(viewModel.name)
                    .padding()
                
                Divider()
                
                Text("Größe:")
                    .font(.headline)
                Picker(selection: $viewModel.size, label: Text("Größe")) {
                    ForEach(Size.allCases, id: \.self) { size in
                        Text(size.rawValue).tag(size)
                    }
                }
                .pickerStyle(.automatic)
                .padding()
                
                Divider()
                
                Text("Beläge:")
                    .font(.headline)
                ForEach(viewModel.ingredients, id: \.self) { topping in
                    HStack {
                        Text(topping)
                        Button(action: {viewModel.removeIngredient(ingredient: topping)}, label: {
                            Image(systemName: "minus.circle")
                        })
                    }
                }
                HStack {
                    TextField(
                        "Topping hinzufügen",
                        text: $viewModel.inputIngredient
                    )
                    Button(action: {viewModel.addIngredient()}, label: {
                        Image(systemName: "plus.circle")
                    })
                }
                
                Spacer()
                
                Button(action: {viewModel.addPizzaToOrder()}, label: {
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
    PizzaDetailView(viewModel: PizzaViewModel())
}

