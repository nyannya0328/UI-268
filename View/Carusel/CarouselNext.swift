//
//  CarouselNext.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct CarouselNext: View {
    var index : Int
    @State var offset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            
            ZStack{
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height / 1.2)
                    .cornerRadius(10)
                
                
                VStack{
                    
                    
                    VStack(spacing: 10){
                        
                        
                        Text("**Human Intergration Super lesister**")
                            .font(.callout.smallCaps())
                            .foregroundColor(.orange)
                        
                        Text("World Amazing")
                            .font(.footnote.bold())
                            .foregroundStyle(.primary)
                        
                        
                    }
                    .padding(.top)
                    
                    
                    
                    Spacer(minLength: 0)
                    
                    
                    VStack(alignment:.leading,spacing:20){
                        
                        
                        HStack(spacing:20){
                            
                            
                            
                            Button {
                                
                            } label: {
                                Image("logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 65, height: 65)
                                    .clipShape(Circle())
                            }
                            .buttonStyle(ButtonModeifier())
                            
                            VStack(alignment: .leading, spacing: 15){
                                
                                
                                Text("Girl")
                                    .font(.title.uppercaseSmallCaps())
                                
                                Text("Amazing")
                                    .font(.title2.italic())
                                
                                
                            }
                            

                        }
                        HStack{
                            
                            
                            VStack(alignment:.center,spacing: 20){
                                Text("31000")
                                    .font(.title)
                                
                                Text("Following")
                                    .font(.footnote.bold())
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(alignment:.center,spacing: 20){
                                Text("31000")
                                    .font(.title)
                                
                                Text("Follower")
                                    .font(.footnote.bold())
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack(alignment:.center,spacing: 20){
                                Text("3")
                                    .font(.title)
                                
                                Text("Following")
                                    .font(.footnote.bold())
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(.white)
                        
                        
                        
                    }
                    .padding(.top,20)
                    .padding(.horizontal,20)
                    .background(.blue,in: RoundedRectangle(cornerRadius: 10))
                    
                }
               //º .frame(width: size.width - 10, height: size.height / 1.2)
                
                
                
                
                
                
                    
                
                
                
                
            }
            //.frame(width: size.width - 9, height: size.height / 1.2)
            .frame(width: size.width, height: size.height)
            
            
        }
        .padding(.bottom,100)
        .tag("p\(index)")
        .rotation3DEffect(.init(degrees: getoffset() * 90), axis: (x: 0, y: 9, z: 0), anchor: offset > 0 ? .leading : .trailing, anchorZ: 0, perspective: 0.6)
        .modifier(ScrollViewOffet(offset: $offset, anchorpoint: .leading))
       
    }
    
    func getoffset()->CGFloat{
        
        let progress = -offset / UIScreen.main.bounds.width
        return progress
    }
}

struct CarouselNext_Previews: PreviewProvider {
    static var previews: some View {
        CrouselMain()
    }
}

struct ButtonModeifier : ButtonStyle{
    
    
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
        
            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            .scaleEffect(configuration.isPressed ? 160 : 1)
            .animation(.easeInOut.repeatForever(autoreverses: true), value: configuration.isPressed)
    }
}
