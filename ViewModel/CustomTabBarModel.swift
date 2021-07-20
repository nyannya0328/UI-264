//
//  CustomTabBarModel.swift
//  UI-264
//
//  Created by nyannyan0328 on 2021/07/19.
//

import SwiftUI

class CustomTabBarModel: ObservableObject {
    @Published var selectedTab = "Home"
    
    @Published var showDetail = false
    
    @Published var  currentCard : Card?
}

