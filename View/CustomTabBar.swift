//
//  CustomTabBar.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct CustomTabBar: View {
    @StateObject var model = CustomTabBarModel()
    @Namespace var animation
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$model.selectedTab){
            
           Home(animation: animation)
                .environmentObject(model)
                .tag("Home")
            
           CrouselMain()
                .tag("Puchased")
            
          LottieView()
                .tag("Settings")
            
            
        }
        .overlay(
            
            HStack(spacing:0){
            
            TabButton(title: "Home", image: "house.fill", animation: animation)
            
            TabButton(title: "Puchased", image: "purchased.circle", animation: animation)
            
            TabButton(title: "Settings", image: "gear.circle", animation: animation)
        }
                .environmentObject(model)                .padding(.vertical)
                .padding(.horizontal)
                .background(.ultraThinMaterial,in: Capsule())
                .padding(.vertical,8)
                .padding(.horizontal,8)
                .padding(.bottom,8)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: -5)
                .colorScheme(.light)
            
            ,alignment: .bottom
            
        )
        .overlay(
        
            DetailView(animation: animation)
                .environmentObject(model)
        
        
        )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}


struct TabButton : View{
    
    var title :String
    var image : String
    var animation : Namespace.ID
    
    @EnvironmentObject var model : CustomTabBarModel
    
    var body: some View{
        
        Button {
            withAnimation{
                
                
                model.selectedTab = title
            }
        } label: {
            VStack{
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(height: 20)
                
                Text(title)
                    .font(.title3.italic())
                
                
                
                
            }
            .foregroundColor(model.selectedTab == title ? Color("Tab") : .gray)
            .frame(maxWidth: .infinity)
            .overlay(
            
                ZStack{
                
                if model.selectedTab == title{
                    
                    
                    CustomShape()
                        .fill(
                        
                            LinearGradient(colors: [.red.opacity(0.2),.green.opacity(0.1),.orange.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                               
                            
                        
                        )
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .padding(.top,-10)
                        .padding(.horizontal,8)
                        .opacity(model.showDetail ? 0 : 1)
                    
                }
            }
            )
          
        }
        
        
    }
}

struct CustomShape : Shape{
    
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height))
            
        }
    }
}
