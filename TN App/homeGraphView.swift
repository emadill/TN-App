//
//  homeGraphView.swift
//  TN App
//
//  Created by Evan Madill on 3/27/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

@IBDesignable class homeGraphView: UIView {

    var sampleDatapoints: [Int] = [3, 6, 7, 9, 9, 5, 4]
    
    // Set color gradient, make it interactable with the storyboard
    @IBInspectable var startColorGradient: UIColor = UIColor(red: 250, green: 233, blue: 222, alpha: 1.0)
    @IBInspectable var endColorGradient: UIColor = UIColor(red: 252, green: 79, blue: 8, alpha: 1.0)
    
    override func drawRect(rect: CGRect) {
        // set context for drawing the gradient
        let context = UIGraphicsGetCurrentContext()
        let colorsForGradient = [startColorGradient.CGColor, endColorGradient.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        // Set the gradient
        let gradient = CGGradientCreateWithColors(colorSpace, colorsForGradient, colorLocations)
        
        let startGradientPoint = CGPoint.zero
        let endGradientPoint = CGPoint(x: 0.0, y: self.bounds.maxY)
        CGContextDrawLinearGradient(context, gradient, startGradientPoint, endGradientPoint, [])
        
        // Graph sample data
        
        //IMPORTANT: add if statement to check for data once sampleDatapoints are replaced
        
        // Set x axis margin to 10% of frame width
        let margin: CGFloat = self.frame.width / 10.0
        let spacingBetweenPoints = (self.frame.width - margin*2 - 4) / CGFloat(sampleDatapoints.count - 1)
        // Add expression to calculate code for each column's x point (multiply by spacer and add margin)
        func columnsXPoint(column: Int) {
            var xPoint = CGFloat(column) * spacingBetweenPoints
            xPoint += margin
        }
        
        //Calculate Y points
        // set y axis boarder to 10% of frame height
        let topBoarder:CGFloat = self.frame.height / 10.0
        let bottomBoarder: CGFloat = self.frame.height - topBoarder
        let dataSpaceHeight = self.frame.height - (topBoarder*2)
        // Downcasting here only because we are using sample points
        let maxYValue = CGFloat(sampleDatapoints.maxElement()!)
        func columnsYPoint(samplePoint: Int) {
            var yPoint = CGFloat(samplePoint) / CGFloat(maxYValue * dataSpaceHeight)
            // Flip the direction of the graph's Y axis
            yPoint = dataSpaceHeight + topBoarder - yPoint
        }
        
        // Set graphing line
        UIColor.blackColor().setFill()
        UIColor.blackColor().setStroke()
        var graphPath = UIBezierPath()
        // Set startpoint of graph
        let startPointX = CGFloat(columnsXPoint(0))
        let startPointY = CGFloat(columnsYPoint(sampleDatapoints[0]))
        graphPath.moveToPoint(CGPointMake(startPointX, startPointY))
        
        // Graph subsequent points
        for i in 1..<sampleDatapoints.count {
            let nextXPoint = CGFloat(columnsXPoint(i))
            let nextYPoint = CGFloat(columnsYPoint(sampleDatapoints[i]))
            graphPath.addLineToPoint(CGPointMake(nextXPoint, nextYPoint))
        }
        
        graphPath.stroke()
    }

}
