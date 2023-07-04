//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  MainViewModel.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 1/6/2023.
//

import Combine

final class MainViewModel: ObservableObject {
    let appRouter: AppRouter
    @Published var arController = ARController()
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }
    
    func didSelectGlasses() {
        let allGlassesTypes = GlassesType.allCases
        
        if let selectedGlassesType = arController.selectedGlassesType {
            var index = allGlassesTypes.firstIndex(of: selectedGlassesType)!
            index = index == allGlassesTypes.count - 1 ? 0 : index + 1
            arController.selectedGlassesType = allGlassesTypes[index]
        } else {
            arController.selectedGlassesType = allGlassesTypes.first
        }
    }
}
