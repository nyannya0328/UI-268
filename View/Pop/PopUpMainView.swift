//
//  PopUpMainView.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

struct PopUpMainView: View {
    @State var show = false
    @State var currentDay : Int = 1
    var body: some View {
        NavigationView{
            
            List{
                
                Section(header: Text("Tutolial")) {
                    
                    ForEach(1...30,id:\.self){index in
                        
                        Button {
                            withAnimation{
                                currentDay = index
                                show.toggle()
                            }
                        } label: {
                            
                            
                            Text("Day\(index) of Swift UI")
                        }
                        .foregroundColor(.primary)
                        .navigationTitle("Pop Up")

                        
                        
                    }
                }
                
                
                
            }
        }
        .swipPop(show: $show) {
            
            
            List{
                
                Section(header: Text("Day\(currentDay)")) {
                    
                    ForEach(1...30,id:\.self){index in
                        
                        
                        Text("course\(index)")
                        
                      
                        

                        
                        
                    }
                }
            }
        }
    }
}

struct PopUpMainView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMainView()
    }
}
