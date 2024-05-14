//
//  PizzaViewModel.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 08.05.24.
//

import Foundation

class PizzaViewModel: ObservableObject {
    
    @Published var showSheet: Bool = false
    
    @Published var pizzas: [Pizza] = [
        Pizza(name: "Ananas", size: .medium, ingredients: ["Ananas"]),
        Pizza(name: "Funghi", size: .medium, ingredients: ["Champignon", "Mozzarella"]),
        Pizza(name: "Marinara", size: .medium, ingredients: ["Tomatensauce", "Knoblauch", "Oregano"]),
        Pizza(name: "Margherita", size: .medium, ingredients: ["Tomatensoße", "Mozzarella", "Basilikum"]),
        Pizza(name: "Quattro stagioni", size: .medium, ingredients: ["Champignons", "Oliven", "Paprika", "Artischoken"])
    ]
    
    @Published var orderList: [Pizza] = []
    
    @Published var name: String = ""
    @Published var size: Size = .medium
    @Published var ingredients: [String] = []
    @Published var inputIngredient: String = ""
    
    
    
    
    
    func addPizzaToOrder() {
        let pizza = Pizza(name: name, size: size, ingredients: ingredients)
        orderList.append(pizza)
    }
    
    func removePizzaFromOrder(pizza: Pizza) {
        if let index = orderList.firstIndex(of: pizza) {
            orderList.remove(at: index)
        }
    }
    
    func setPizza(pizza: Pizza) {
        name = pizza.name
        size = pizza.size
        ingredients = pizza.ingredients
    }
    
    func toggleShowSheet() {
        showSheet.toggle()
    }
    
    func removeIngredient(ingredient: String) {
        ingredients.removeAll(where: {$0 == ingredient})
    }
    
    func addIngredient() {
        ingredients.append(inputIngredient)
        inputIngredient = ""
    }
}
