//
//  DetailView.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct DetailView: View {
    var animation : Namespace.ID
    @EnvironmentObject var model : CustomTabBarModel
    
    @State var showData = false
    var body: some View {
        if let card = model.currentCard,model.showDetail{
            
            VStack(spacing:0){
                
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: card.id + "Image", in: animation)
                
                   
                    .background(
                    
                        LinearGradient(colors: [
                            Color("\(card.cardColor)1"),
                            Color("\(card.cardColor)2"),
                            Color("\(card.cardColor)3"),
                        
                        
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .matchedGeometryEffect(id: card.id + "BG", in: animation)
                            .ignoresSafeArea()
                            
                    )
                    .overlay(
                    
                        Button(action: {
                        
                        withAnimation{
                            
                            
                            
                            model.showDetail.toggle()
                        }
                        
                        
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding()
                            .background(.black,in: Circle())
                        
                    })
                            .padding(10)
                            .opacity(showData ? 1 : 0)
                        
                        ,alignment: .topTrailing
                    
                    
                    )
                
                
           
                    
                    
                    
                VStack{
                    
                    Text(card.title)
                        .font(.title2.bold())
                        .padding()
                        .padding(.top)
                        .matchedGeometryEffect(id: "\(card.id)Title", in: animation)
                    
                    
                    PopUpMainView()
                    
                }
                .opacity(showData ? 1 : 0)
                
                        
               
                    
              
                
                
                
                
                
                
            }
            .background(.ultraThinMaterial)
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    
                    withAnimation{
                        
                        showData = true
                    }
                }
                
                
            }
            .onDisappear {
                withAnimation{
                    
                    showData = false
                }
            }
          
            
            
        }
           
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
