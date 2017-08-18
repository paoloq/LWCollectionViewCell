//
//  ExampleCell.swift
//  LWTableViewCell
//
//  Created by Paolo Arduin on 06/08/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import LWCollectionViewCell

class ExampleCell: LWCollectionViewCell {
    
    static let identifier = "ExampleCellIdentifier"
    
    var element: ExampleElement? {
        didSet {
            // Needed to call drawCellView(_ frame: CGRect) and draw contents
            self.setNeedsDisplay()
        }
    }
    
    fileprivate var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    // MARK: -
    
    static func estimatedHeight() -> CGFloat {
        return 100.0
    }
    
    // MARK: -
    
    override func drawCellView(_ frame: CGRect) {
        guard let element = self.element else {
            return
        }
        
        // Margins
        let topMargin: CGFloat = 10.0
        let leftMargin: CGFloat = 10.0
        let rightMargin: CGFloat = 10.0
        let bottomMargin: CGFloat = 20.0
        
        // Image side
        let widthSide: CGFloat = frame.width
            - leftMargin
            - rightMargin
        let heightSide: CGFloat = frame.height
            - topMargin
            - bottomMargin
        let imageSide: CGFloat = min(widthSide, heightSide)
        
        // Image view
        self.imageView.frame.origin.y = topMargin
        self.imageView.frame.size.width = imageSide
        self.imageView.frame.size.height = imageSide
        self.imageView.center.x = frame.width / 2
        self.imageView.image = element.image
        
        if self.imageView.superview == nil {
            self.addSubview(self.imageView)
        }
        
        // Draw title
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let titleAttributes = [NSParagraphStyleAttributeName: paragraphStyle,
                               NSForegroundColorAttributeName: UIColor.black,
                               NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)]
        let titleAttributedString = NSAttributedString.init(string: element.title,
                                                            attributes: titleAttributes)
        var titleRect = CGRect.zero
        titleRect.size.width = frame.width
        titleRect.size.height = ceil(titleAttributedString.size().height)
        titleRect.origin.y = frame.height
            - bottomMargin / 2
            - ceil(titleRect.height / 2)
        titleAttributedString.draw(in: titleRect)
    }
}
