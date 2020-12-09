//
//  OnboardingView.swift
//  ZapisOnboarding
//
//  Created by ablai erzhanov on 12/9/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "meditating")),
        UIHostingController(rootView: Subview(imageString: "sitting")),
        UIHostingController(rootView: Subview(imageString: "skydiving"))
        
    ]
    
    var titles = ["Dobro pozhalovat' v zapis' kz", "Nikakih ozhidaniy", "Zapis' v paru klikov"]
    
    var captions =  ["Zapis' kz eto proriv v mire nanotechnologiy i mirovoi istoriy i sporta", "Uchenimi dokazano chto chastoe posesheniye Zapis' spasaet ot raka ushei", "Zapis' kz s latini oznachaet meow meow ya kotik"]
    
    @EnvironmentObject var viewRouter: ViewRouter
    // current index
    @State var currentPageIndex = 0
     
    var body: some View {
            VStack(alignment: .leading) {
                PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                    .frame(height: 600)
                Group {
                    Text(titles[currentPageIndex])
                        .font(.title)
                    Text(captions[currentPageIndex])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .lineLimit(nil)
                }
                    .padding()
                HStack {
                    PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                    Spacer()
                    if currentPageIndex == 2 {
                        Button(action: {
                            withAnimation {
                                self.viewRouter.currentPage = "homeView"
                            }
                        }) {
                            ButtonContent()
                        }
                    } else {
                        Button(action: {
                                self.currentPageIndex += 1
                            
                        }) {
                            ButtonContent()
                        }
                    }
                }
                    .padding()
            }
        }
    }

struct ButtonContent: View {
        var body: some View {
            Image(systemName: "arrow.right")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .padding()
                .background(Color.orange)
                .cornerRadius(30)
        }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
