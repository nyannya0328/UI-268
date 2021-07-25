//
//  LottieView.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI
import Lottie

struct LottieView: View {
    @State var show = false
    @State var txt = ""
    var body: some View {
        
        
            
            
            
            
            VStack {
                AnimatedView(show: $show)
                    .scaleEffect(0.7)
                    .background(Color("Tab"))
                    .frame(height: UIScreen.main.bounds.height / 2)
                    
                .padding(.bottom,70)
          
              
            
            
            
             
                
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                 
                            
                            Text("Login")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("Enter Youre Phone Number")
                       
                        
                        
                        
                            
                            
                            HStack{//H
                                
                                Text("+1")
                                
                                
                                TextField("", text: $txt)
                            }
                            
                      
                        
                        
                        
                      
                       
                        
                        Divider()
                            .background(.gray)
                        
                        
                        
                        Button {
                            
                        } label: {
                            Text("Veriry Your Number")
                                .font(.footnote.bold())
                                .foregroundColor(.black)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .frame(maxWidth: .infinity)
                                .background(.gray,in: Capsule())
                        }
                        
                        HStack{
                            
                            
                            Rectangle()
                                .fill(.black.opacity(0.3))
                                .frame(height: 1)
                            
                            Text("OR")
                            
                            Rectangle()
                                .fill(.black.opacity(0.3))
                                .frame(height: 1)
                            
                        }
                       // .padding(.vertical)
                        
                        
                        
                        
                        HStack{
                            
                            
                            Button {
                                
                            } label: {
                               
                                HStack(spacing:15){
                                    
                                    
                                    Image("google-symbol")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                             
                                    
                                    Text("Google")
                                        .font(.title2.bold())
                                        .foregroundColor(.white)
                                        .padding(.vertical,10)
                                       
                                }
                                .frame(width:( UIScreen.main.bounds.width - 60) / 2)
                                .background(.blue,in: Capsule())
                              
                                    
                                        
                                        
                            }
                            
                            Button {
                                
                            } label: {
                               
                                HStack(spacing:15){
                                    
                                    
                                    Image("email")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                       
                             
                                    
                                    Text("Email")
                                        .font(.title2.bold())
                                        .foregroundColor(.white)
                                        .padding(.vertical,10)
                                       
                                }
                                .frame(width:( UIScreen.main.bounds.width - 60) / 2)
                                .background(.blue,in: Capsule())
                              
                                    
                                        
                                        
                            }
                            
                            
                            
                        }
                        
                        
                        
                    }
                    .padding()
                    .background(.white,in: RoundedRectangle(cornerRadius: 15))
                    .padding()//2つめでさらに狭くなる
                    
              .frame(height: 0)
            .opacity(show ? 1 : 0)
            
                 
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
                
                
                
                
                
            
               
                
            }
          
          
        
         
            
            
            
            
            
            
      
        
        
        
        
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView()
    }
}

struct AnimatedView : UIViewRepresentable{
    
    let animation = AnimationView(name: "43905-emailing-laptop", bundle: .main)
    @Binding var show : Bool
    
    
    func makeUIView(context: Context) -> AnimationView {
        
        animation.play { statas in
            if statas{
                
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.6)){
                    
                    show.toggle()
                }
            }
        }
        
        
        return animation
        
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}

