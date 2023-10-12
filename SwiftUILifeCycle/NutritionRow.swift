//
//  NutritionRow.swift
//  SwiftUILifeCycle
//
//  Created by Муса Шогенов on 9.10.2023.
//


import SwiftUI

struct NutritionRow: View {
  
    var image: Image
    var name: String
    
    var body: some View {
        
        HStack {
        
            image
                .resizable()
                .frame(width: 50, height: 50)
               
            Text(name)
            Spacer()
            
        }
    
    }
}

#Preview {
    NutritionRow(image: Image("apple"),name: "Apple")
}
