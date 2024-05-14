//
//  OrderList.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 14.05.24.
//

import SwiftUI

struct OrderList: View {
    
    @ObservedObject var pizzaViewModel: PizzaViewModel
    
    var body: some View {
        
        Form {
            ForEach(pizzaViewModel.orderList, id: \.name) { pizza in
                VStack {
                    HStack {
                        Text(pizza.name)
                            .bold()
                        
                        Spacer()
                        
                        Text(pizza.size.rawValue)
                        
                        Spacer()
                        
                        Button(action: {pizzaViewModel.removePizzaFromOrder(pizza: pizza)}, label: {
                            Image(systemName: "minus.circle")
                        })
                        
                    }
                    .padding()
                    HStack {
                        ForEach(pizza.ingredients, id: \.self) {
                            Text($0)
                        }
                    }
                    .padding()
                }
                
            }
        }
        
    }
}

#Preview {
    OrderList(pizzaViewModel: PizzaViewModel())
}
