//
//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  AppArgs.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 2/6/2023.
//

import Foundation

enum AppArgs {
    
    static var isRunningUnitTests: Bool {
        NSClassFromString("XCTestCase") != nil
    }
    
    static var isSimulator: Bool {
#if targetEnvironment(simulator)
        print("Running on simulator")
        return true
#else
        print("Running on a real device")
        return true
#endif
    }
}
