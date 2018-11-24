//
//  AppWindow.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit
import CoreMotion
import SceneKit

final class AppWindow: UIWindow {
    
    private let motionManager = CMMotionManager()
    
    private let limit = 0.015
    
    private var x: Double = 0.0
    private var y: Double = 0.0
    private var z: Double = 0.0
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "backgroundgradient")
        return imageView
    }()
    
    private let gameView: SCNView = {
        let view = SCNView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let gameScene: SCNScene = {
        let gameScene = SCNScene()
        return gameScene
    }()
    
    private let cameraNode: SCNNode = {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 3, z: 0)
        cameraNode.eulerAngles.x = -0.38
        return cameraNode
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tintColor = .white
        
        gameView.scene = gameScene
        gameScene.rootNode.addChildNode(cameraNode)
        
        setUpConstraint()
        start()
        createTarget()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraint() {
        self.addSubview(imageView)
        self.addSubview(gameView)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        gameView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        gameView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        gameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        gameView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    private func start() {
        guard motionManager.isGyroAvailable else { return }
        motionManager.deviceMotionUpdateInterval = 0.1;
        motionManager.startDeviceMotionUpdates()
        motionManager.gyroUpdateInterval = 0.1
        guard let currentQueue = OperationQueue.current else { return }
        motionManager.startGyroUpdates(to: currentQueue) { (gyroData, error) in
            guard let rotation = gyroData?.rotationRate else { return }
            self.x += fabs(rotation.x) > self.limit ? rotation.x : 0.0
            self.y += fabs(rotation.y) > self.limit ? rotation.y : 0.0
            self.z += fabs(rotation.z) > self.limit ? rotation.z : 0.0
            
            if UIDevice.current.model == "iPad" {
                self.cameraNode.eulerAngles.y = Float(self.x)/10
            } else {
                self.cameraNode.eulerAngles.y = Float(self.y)/10
            }
            
        }
    }
    
    private func createTarget() {
        let r = 45
        func addSphere(x: Int, z: Int, y: Int) {
            let sphera = SCNSphere(radius: 0.05)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor(displayP3Red: 0.08, green: 0.5, blue: 0.7, alpha: 0.3)
            sphera.materials = [material]
            let node = SCNNode(geometry: sphera)
            node.worldPosition = SCNVector3(x, y, z)
            gameScene.rootNode.addChildNode(node)
        }
        func addFlat(x: Int, z: Int, y: Int) {
            let flat = SCNPlane(width: 0.95, height: 0.95)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor(displayP3Red: 0.08, green: 0.5, blue: 0.7, alpha: 0.5)
            flat.materials = [material]
            let node = SCNNode(geometry: flat)
            node.worldPosition = SCNVector3(x, y, z)
            node.runAction(SCNAction.rotate(by: CGFloat.pi/2, around: SCNVector3(1, 0, 0), duration: 0.2))
            gameScene.rootNode.addChildNode(node)
        }
        for x in -r...r {
            for z in -r...r {
                guard x*x + z*z < r*r else { continue }
                addSphere(x: x, z: z, y: 0)
                addFlat(x: x, z: z, y: 5)
            }
        }
    }
}
