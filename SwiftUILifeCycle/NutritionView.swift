//
//  NutritionView.swift
//  SwiftUILifeCycle
//
//  Created by Муса Шогенов on 9.10.2023.
//

import SwiftUI


struct NutritionView: View {
    
    @State private var isPresented = false
    @State private var nutritionData: Nutrition? = nil
    let nutrition : String
    
    var body: some View {
        Image(nutrition.lowercased())
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
        Button("Show more") {
            
            Networking().fetchData(nutrition) { nutrition, _ in
                
                nutritionData = nutrition
                isPresented.toggle()
                print("Data fetched - \(nutrition)")
            }
            
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            NutritionInfoView(isPresented: $isPresented, nutritionData: $nutritionData)
        })
        .onAppear {
            print("NutritionView appeared")
          
        }
        .onDisappear{
            nutritionData = nil
            print("NutritionView disappeared")
            
        }
        .onChange(of: isPresented) { oldValue, newValue in
            print("isPresented changed from \(oldValue) to \(newValue)")
        }
       
    }
        
    
    
}

#Preview {
    NutritionView(nutrition: "apple")
}
