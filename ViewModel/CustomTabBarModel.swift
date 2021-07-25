//
//  CustomTabBarModel.swift
//  UI-277
//
//  Created by nyannyan0328 on 2021/07/23.
//

import SwiftUI

class CustomTabBarModel: ObservableObject {
    
    
    @Published var selectedTab = "Home"
    
    @Published var showDetail = false
    
    @Published var currentCard : Card?
    
}

