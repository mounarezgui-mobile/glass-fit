//
//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  MainScreen.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 2/6/2023.
//

import SwiftUI

struct MainScreen : View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            ARViewContainer(controller: viewModel.arController).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ForEach(viewModel.glassesTypes, id: \.rawValue) { item in
                            Button(action: {
                                viewModel.didSelectGlasses(item: item)
                            }, label: {
                                VStack {
                                    Image(item.rawValue)
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        
                                        .frame(height: 25)
                                    
                                    Text(item.description)
                                    
                                }
                            })
                            .font(.title2)
                            .frame(minWidth: 120)
                            .padding()
                            .foregroundColor(viewModel.selectedGlassesType == item ? .black : .white)
                            .background(viewModel.selectedGlassesType?.rawValue == item.rawValue ? .yellow : .accentColor)
                            .cornerRadius(20)
                            
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct MainScreen_Previews : PreviewProvider {
    static var previews: some View {
        PreviewStubs.mainScreen()
    }
}
#endif
