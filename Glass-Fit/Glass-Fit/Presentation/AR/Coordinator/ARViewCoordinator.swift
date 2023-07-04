//
//  Copyright (c) 2023, Mouna Rezgui. All rights reserved.
//  This source code is licensed under the GNU General Public License v3.0 license
//  found in the LICENSE file in the root directory of this source tree.
//
//  ARViewCoordinator.swift
//  Glass-Fit
//
//  Created by Mouna Rezgui on 16/6/2023.
//

import SwiftUI
import Combine
import RealityKit
import ARKit

class ARViewCoordinator: NSObject {
    var disposeBag = Set<AnyCancellable>()
    @Published var controller: ARController
    
    weak var view: ARView? {
        didSet {
            self.resetTracking()
        }
    }
    
    init(controller: ARController) {
        self.controller = controller
        super.init()
        observeGlassesSelectionChange()
    }
}

extension ARViewCoordinator {
    
    @objc func resetTracking() {
        guard let view = self.view, ARFaceTrackingConfiguration.isSupported else { return }
        
        let configuration = ARFaceTrackingConfiguration()
        configuration.maximumNumberOfTrackedFaces = ARFaceTrackingConfiguration.supportedNumberOfTrackedFaces
        configuration.isLightEstimationEnabled = true
        view.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func loadScene(for type: GlassesType) {
        guard let view = self.view else { return }
        view.scene.anchors.removeAll()
        switch type {
        case .wayfare:
            view.scene.anchors.append(try! Experience.loadWayfare())
        case .aviator:
            view.scene.anchors.append(try! Experience.loadAviator())
        case .browline:
            view.scene.anchors.append(try! Experience.loadBrowline())
        case .cateye:
            view.scene.anchors.append(try! Experience.loadCateye())
        case .geometric:
            view.scene.anchors.append(try! Experience.loadGeometric())
        case .rectangle:
            view.scene.anchors.append(try! Experience.loadRectangle())
        case .round:
            view.scene.anchors.append(try! Experience.loadRound())
        case .square:
            view.scene.anchors.append(try! Experience.loadSquare())
        case .oval:
            view.scene.anchors.append(try! Experience.loadOval())
        }
    }
}

extension ARViewCoordinator {
    
    func observeGlassesSelectionChange() {
        controller.$selectedGlassesType
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] selectedGlassesType in
                if let selectedGlassesType = selectedGlassesType {
                    print("selected \(selectedGlassesType)")
                    self?.loadScene(for: selectedGlassesType)
                }
            })
            .store(in: &disposeBag)
    }
}
