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
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct MainScreen_Previews : PreviewProvider {
    static var previews: some View {
        PreviewStubs.mainScreen()
    }
}
#endif
