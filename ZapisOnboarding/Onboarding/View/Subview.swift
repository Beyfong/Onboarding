//
//  Subview.swift
//  ZapisOnboarding
//
//  Created by ablai erzhanov on 12/9/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import SwiftUI

struct Subview: View {
    var imageString: String
    var body: some View {
        Image(imageString)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .clipped()
        
    }
}


#if DEBUG
struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "meditating")
    }
}
#endif

