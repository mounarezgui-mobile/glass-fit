//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  AppRouter.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 1/6/2023.
//

import Combine
import SwiftUI

final class AppRouter: Routing, ObservableObject {

    @Published var isPresentingSheet = false
    @Published var currentSheet: SheetRoute?
    var disposeBag = Set<AnyCancellable>()

    init() {
        observeSheet()
    }
    
    
    func sheet(for route: SheetRoute) -> some View {
        switch route {
        case .settings:
            settingsScreen()
        }
    }
    
    func observeSheet() {
        $currentSheet
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] route in
                self?.isPresentingSheet = route != nil
            })
            .store(in: &disposeBag)
    }
}
