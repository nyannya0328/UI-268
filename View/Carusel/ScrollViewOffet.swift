//
//  ScrollViewOffet.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct ScrollViewOffet: ViewModifier {
    @Binding var offset : CGFloat
    
    var anchorpoint : Anchor = .top
    func body(content: Content) -> some View {
        
        content
            .overlay(
                GeometryReader{proxy -> Color in
                
                let frame = proxy.frame(in: .global)
                
                
                DispatchQueue.main.async {
                    
                    switch anchorpoint {
                    case .top:
                        offset = frame.minY
                    case .bottom:
                        
                        offset = frame.maxY
                        
                    case .leading:
                        offset = frame.minX
                    case .trailing:
                        offset = frame.maxX
                    }
                    
                }
                
                
                return Color.clear
            }
            
            )
    }
}

enum Anchor{
    
    case  top
    case  bottom
    case  leading
    case  trailing
    
    
}


