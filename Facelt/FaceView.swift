//
//  FaceView.swift
//  Facelt
//
//  Created by Lena Lee on 2017. 7. 30..
//  Copyright © 2017년 Lena Lee. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.90
    
    private var skullRadius: CGFloat{
     
       return min(bounds.size.width, bounds.size.height) / 2
    }
    
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }

    private struct Ratios {
        static let SkullRadiusToEyeOffset: CGFloat = 8
        static let SkullRadiusToEyeRadius: CGFloat = 10
        static let SkullRadiusToMouthWidth: CGFloat = 1
        static let SkullRadiusToMouthHight: CGFloat = 3
        static let SkullRadiusToMouthOffset: CGFloat = 3
    }
    
    private enum Eye {
        case Left
        case Right
    }
    
    private func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRaidus radius: CGFloat)
        -> UIBezierPath {
       
        let path = UIBezierPath(
            arcCenter: midPoint,
            radius: radius,
            startAngle: 0.0,
            endAngle: CGFloat(2*M_PI),
            clockwise: false)
        
        path.lineWidth = 5.0
        return path
    }

    private func getEyeCenter(eye: Eye) -> CGPoint
    {
        let eyeOffset = skullRadius / Ratios.SkullRadiusToEyeOffset
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .Left: eyeCenter.x -= eyeOffset
        case .Right: eyeCenter.x += eyeOffset
        }
        return eyeCenter
    }
    
    private func pathForEye(eye: Eye) -> UIBezierPath
    {
        let eyeReadius = skullRadius / Ratios.SkullRadiusToEyeOffset
        let eyeCenter =  getEyeCenter(eye: eye)
        
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRaidus: eyeReadius)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.blue.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRaidus: skullRadius).stroke()
        pathForEye(eye: .Left).stroke()
        pathForEye(eye: .Right).stroke()
    }
}

