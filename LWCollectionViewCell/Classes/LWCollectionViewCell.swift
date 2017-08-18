import Foundation
import UIKit

fileprivate class LWCollectionViewCellView : UIView {
    
    required convenience init() {
        self.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor.white
        self.contentMode = UIViewContentMode.redraw
        self.isOpaque = true
    }
    
    override fileprivate func draw(_ rect: CGRect) {
        if let superview = self.superview as? LWCollectionViewCell {
            superview.drawCellView(rect)
        }
    }
}

open class LWCollectionViewCell: UICollectionViewCell {
    
    override open var frame: CGRect {
        set {
            super.frame = newValue
            self.cellView.frame = self.bounds
        }
        get {
            return self.cellView.frame
        }
    }
    
    let cellView: UIView = LWCollectionViewCellView()
    
    
    // MARK: -
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.addSubview(self.cellView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    // MARK: -
    
    override open func setNeedsDisplay() {
        super.setNeedsDisplay()
        self.cellView.setNeedsDisplay()
    }
    
    override open func setNeedsDisplay(_ rect: CGRect) {
        super.setNeedsDisplay(rect)
        self.cellView.setNeedsDisplay(rect)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.removeFromSuperview()
        self.backgroundView?.removeFromSuperview()
        self.selectedBackgroundView?.removeFromSuperview()
    }
    
    // MARK: -
    
    open func drawCellView(_ frame: CGRect) {
        assert(false, "Subclasses must override this")
    }
}
