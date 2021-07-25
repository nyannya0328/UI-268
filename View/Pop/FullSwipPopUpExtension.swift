//
//  FullSwipPopUpExtension.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

extension View{
    
    func swipPop<Content : View>(show : Binding<Bool>,content : @escaping()->Content) -> some View{
        
        fullpopupHelper(show: show, content: content(), mainContent: self)
    }
    
    
    
    
    
}



struct FullSwipPopUpExtension_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private struct fullpopupHelper<Maincontent:View,Content : View> : View{
    
    var content : Content
    var mainContent : Maincontent
    @Binding var show : Bool
    
    init(show : Binding<Bool>,content : Content,mainContent : Maincontent){
        
        self._show = show
        self.mainContent = mainContent
        self.content = content
        
        
        
    }
    @Environment(\.colorScheme) var schemer
    
    @GestureState var gestureoffset : CGFloat = 0
    @State var offset : CGFloat = 0
    
    
    
    var body: some View{
        
        
        GeometryReader{proxy in
            
            mainContent
                .offset(x:show && offset >= 0 ?  getoffset(size: proxy.size.width) : 0)
            
            
                .overlay(
                    ZStack{
                    
                    if show{
                        
                        
                        content
                            .background(
                                
                                (schemer == .dark ? Color.black : Color.white)
                                    .shadow(radius: 20)
                                    .ignoresSafeArea()
                                
                                
                                
                            )
                        
                            .offset(x: offset > 0 ? offset : 0)
                            .gesture(DragGesture().updating($gestureoffset, body: { value, out, _ in
                                out = value.translation.width
                            }).onEnded({ value in
                                
                                
                                withAnimation{
                                    
                                    offset = 0
                                    
                                    let translation = value.translation.width
                                    
                                    let maxTans = proxy.size.width / 2.5
                                    
                                    if translation > maxTans{
                                        
                                        
                                        show = false
                                    }
                                }
                                
                                
                                
                                
                            }))
                            .transition(.move(edge: .trailing))
                    }
                }
                    
                )
                .onChange(of: gestureoffset) { newValue in
                    
                    offset = gestureoffset
                    
                    
                }
            
            
            
            
        }
    }
    
    func getoffset(size : CGFloat) -> CGFloat{
        
        let progrees = offset / size
        
        let start : CGFloat = -80
        
        
        let progressWidth = (progrees * 90) <= 90 ? (progrees * 90) : 90
        
        
        let mainoffset = (start + progressWidth) < 0 ? (start + progressWidth) : 0
        
        return mainoffset
        
        
        
        
    }
}





