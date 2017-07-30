//
//  FaceView.swift
//  Facelt
//
//  Created by Lena Lee on 2017. 7. 30..
//  Copyright © 2017년 Lena Lee. All rights reserved.
//

import UIKit

class FaceView: UIView {

    override func draw(_ rect: CGRect) {
        
       
        var skullRadius = min(bounds.size.width, bounds.size.height) / 2
        var skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)

        let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: false)
        
        skull.lineWidth = 5.0
        UIColor.blue.set()
        skull.stroke()
        
    }
}

