//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  MainViewModelFactory.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 1/6/2023.
//

struct MainViewModelFactory {
    static func create(appRouter: AppRouter) -> MainViewModel {
        MainViewModel(appRouter: appRouter)
    }
}
