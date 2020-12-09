//
//  HomeView.swift
//  ZapisOnboarding
//
//  Created by ablai erzhanov on 12/9/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import SwiftUI

import AlertX

struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var pressing = false
    
    @State var showAlertX: Bool = false
     
    @State private var pressed = false
    
    var body: some View {
         
         Button(action: {
             self.showAlertX = true
//            withAnimation {
//                self.viewRouter.currentPage = "onboarding"
//            }
             
         }, label: {
            Text("Log Out")
         }).alertX(isPresented: $showAlertX, content: {
            AlertX(title: Text("Confirm"),
              primaryButton: .cancel(),
              secondaryButton: .default(Text("Okay")),
              theme: .graphite(withTransparency: true, roundedCorners: true))
 
         })
 
        
        
        

    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

 
