//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  PreviewStubs.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 1/6/2023.
//

import Foundation
import SwiftUI

enum PreviewStubs {
    static let appRouter = AppRouter()
    
    @ViewBuilder
    static func mainScreen() -> some View {
        PreviewStubs.appRouter.start()
    }
}
