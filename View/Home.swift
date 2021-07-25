//
//  Home.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct Home: View {
    var animation : Namespace.ID
    @EnvironmentObject var model : CustomTabBarModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(spacing:20){
                
                
                Text("Best Saling")
                    .font(.title.bold())
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
                ForEach(cards){card in
                    
                    Button {
                        model.currentCard = card
                        model.showDetail = true
                        
                    } label: {
                        VStack(spacing : 10){
                            
                            
                          
                            
                            cardView(card: card)
                            
                            
                            
                            
                            
                        }
                        .padding()
                        .background(
                        cardBG(card: card)
                          
                        )
                    }
                    .buttonStyle(pressButton())

                    
                }
                
                
                
            }
            .padding()
            .padding(.bottom,80)
        }
    }
    @ViewBuilder
    func cardBG(card : Card) -> some View{
        
        ZStack{
            
            if model.showDetail && model.currentCard == card{
                
                
                LinearGradient(colors: [
                    Color("\(card.cardColor)1"),
                    Color("\(card.cardColor)2"),
                    Color("\(card.cardColor)3"),
                
                
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .cornerRadius(15)
                
            }
            else{
                
                LinearGradient(colors: [
                    Color("\(card.cardColor)1"),
                    Color("\(card.cardColor)2"),
                    Color("\(card.cardColor)3"),
                
                
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .matchedGeometryEffect(id: card.id + "BG", in: animation)
                    .cornerRadius(15)
                
                
            }
        }
        
        
    }
    
    @ViewBuilder
    func cardView(card : Card) -> some View{
        
        VStack(spacing:15){
            
            if model.showDetail && model.currentCard == card{
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0)
                   
                
                
                Text(card.title)
                    .font(.footnote.italic())
                    .opacity(0)
                
                
            }
            
            else{
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: card.id + "Image", in: animation)
                   
                
                
                Text(card.title)
                    .font(.footnote.italic())
                    .matchedGeometryEffect(id: "\(card.id)Title", in: animation)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct pressButton : ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
        
            .scaleEffect(configuration.isPressed ? 0.6 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
        
            
    }
}
