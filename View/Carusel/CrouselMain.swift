//
//  CrouselMain.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct CrouselMain: View {
    @State var currentTab = "p1"
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            
            TabView(selection:$currentTab){
                
                
                ForEach(1...6,id:\.self){index in
                    
                    CarouselNext(index: index)
                    
                    
                }
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct CrouselMain_Previews: PreviewProvider {
    static var previews: some View {
        CrouselMain()
    }
}
