//
//  ConstraintsTests.swift
//  TDCore
//
//  Created by Josh Campion on 30/10/2015.
//  Copyright © 2015 The Distance. All rights reserved.
//

import XCTest

import TheDistanceCore

class ConstraintsTests: XCTestCase {

    var view1:UIView!
    var view2:UIView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        view1 = UIView()
        view2 = UILabel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testSizeViews() {
        
        let size1 = CGSize(width: 25, height: 50)
        
        let cW = NSLayoutConstraint(item: view1,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 0.0,
            constant: size1.width)

        let cH = NSLayoutConstraint(item: view1,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 0.0,
            constant: size1.height)
        
        // test width only
        let constrs1 = NSLayoutConstraint.constraintsToSize(view1, toWidth: size1.width, andHeight: nil)
        XCTAssert([cW] == constrs1)
        
        // test height only
        let constrs2 = NSLayoutConstraint.constraintsToSize(view1, toWidth: nil, andHeight: size1.height)
        XCTAssert([cH] == constrs2)
        
        // test width & height order
        let constrs3 = NSLayoutConstraint.constraintsToSize(view1, toWidth: size1.width, andHeight: size1.height)
        XCTAssert([cW, cH] == constrs3)
    }
    
    func testAlignView() {
        
        let constrs = NSLayoutConstraint.constraintsToAlign(view: view1, to: view2, withInsets: UIEdgeInsetsMake(5, 10, 15, 20))
        
        // none relative
        let cTop = NSLayoutConstraint(item: view1,
            attribute: .top,
            relatedBy: .equal,
            toItem: view2,
            attribute: .top,
            multiplier: 1.0,
            constant: 5)
        
        let cLead = NSLayoutConstraint(item: view1,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view2,
            attribute: .leading,
            multiplier: 1.0,
            constant: 10)
        
        let cBottom = NSLayoutConstraint(item: view1,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view2,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -15)
        
        let cTrail = NSLayoutConstraint(item: view1,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view2,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -20)
        
        XCTAssert([cTop, cLead, cBottom, cTrail] == constrs)
        
        // test relative
        let cTopRel = NSLayoutConstraint(item: view1,
            attribute: .top,
            relatedBy: .equal,
            toItem: view2,
            attribute: .topMargin,
            multiplier: 1.0,
            constant: 5)
        
        let cLeadRel = NSLayoutConstraint(item: view1,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view2,
            attribute: .leadingMargin,
            multiplier: 1.0,
            constant: 10)
        
        let cBottomRel = NSLayoutConstraint(item: view1,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view2,
            attribute: .bottomMargin,
            multiplier: 1.0,
            constant: -15)
        
        let cTrailRel = NSLayoutConstraint(item: view1,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view2,
            attribute: .trailingMargin,
            multiplier: 1.0,
            constant: -20)
        
        let constrsRel = NSLayoutConstraint.constraintsToAlign(view: view1, to: view2, withInsets: UIEdgeInsetsMake(5, 10, 15, 20), relativeToMarginVertical: (true, true), relativeToMarginHorizontal: (true, true))
        
        
        XCTAssert([cTopRel, cLeadRel, cBottomRel, cTrailRel] == constrsRel)
        XCTAssert([cTop, cLead, cBottom, cTrail] != constrsRel)
        XCTAssert([cTopRel, cLeadRel, cBottomRel, cTrailRel] != constrs)
    }
}
