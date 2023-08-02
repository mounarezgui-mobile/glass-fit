//
//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  GlassesType.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 4/7/2023.
//

import Foundation

enum GlassesType: String, CaseIterable, CustomStringConvertible {
    case wayfare
    case geometric
    case aviator
    case browline
    case cateye
    case rectangle
    case round
    case square
    case oval
    
    var description: String {
        self.rawValue.capitalized
    }
}
