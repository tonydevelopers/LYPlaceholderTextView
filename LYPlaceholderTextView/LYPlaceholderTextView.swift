//
//  LYPlaceholderTextView.swift
//  LYPlaceholderTextView
//
//  Created by joinhov on 2016/11/18.
//  Copyright © 2016年 joinhov. All rights reserved.
//

import UIKit

public class LYPlaceholderTextView: UITextView {
    
    private let left: CGFloat = 5
    private let top: CGFloat = 7
    
    var indexPath: NSIndexPath?
    
    var updateHeight: CGFloat?
    
    var placeholderLabel: UILabel!
    var placeholderWidth: CGFloat = 0
    
    override public var text: String? {
        
        didSet {
            if self.text != nil && (self.text! as NSString).length > 0 {
                placeholderLabel.isHidden = true
            } else {
                placeholderLabel.isHidden = false
            }
        }
    }
    
    override public var font: UIFont? {
        didSet {
            
            self.placeholderLabel?.font = font
        }
    }
    
    var placeholder: String? {
        
        didSet {
            if self.placeholder != nil && (self.placeholder! as NSString).length > 0 {
                placeholderLabel.isHidden = true
            } else {
                placeholderLabel.isHidden = false
            }
            
            self.placeholderLabel.text = self.placeholder
        }
    }
    
    var placeholderColor: UIColor = UIColor.lightGray {
        
        didSet {
            self.placeholderLabel.textColor = self.placeholderColor
        }
    }
    
    var placeholderOpacity: Float = 1 {
        
        didSet {
            if self.placeholderOpacity < 0 {
                self.placeholderOpacity = 1
            }
            
            self.placeholderLabel.layer.opacity = self.placeholderOpacity
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.awakeFromNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        self.awakeFromNib()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        placeholderWidth = self.frame.width - left * 2
        
        self.placeholderLabel = UILabel(frame: CGRect(x: left, y: top, width: placeholderWidth, height: 30))
        self.placeholderLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.placeholderLabel.font = self.font
        self.placeholderLabel.textColor = self.placeholderColor
        
        self.addSubview(self.placeholderLabel)
        
        self.layoutManager.allowsNonContiguousLayout = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(LYPlaceholderTextView.textDidChanged), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.placeholderWidth = self.frame.width - left * 2
        
        var frame = self.placeholderLabel.frame
        frame.origin.x = left
        frame.origin.y = top
        frame.size.height = self.bounds.height
        frame.size.width = self.placeholderWidth
        self.placeholderLabel.frame = frame
        
        self.placeholderLabel.sizeToFit()
    }
    
    deinit {
        
        self.placeholderLabel.removeFromSuperview()
        NotificationCenter.default.removeObserver(self)
    }
    
    func textDidChanged(notification: Notification) {
        if self.text != nil && (self.text! as NSString).length > 0 {
            self.placeholderLabel.isHidden = true
        } else {
            self.placeholderLabel.isHidden = false
        }
    }

//    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//        
//        
//        return true
//    }
//    
//    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
//        
//        return true
//    }
//    
//    
//    public func textViewDidBeginEditing(_ textView: UITextView) {
//        
//        
//    }
//    
//    public func textViewDidEndEditing(_ textView: UITextView) {
//        
//        
//    }
//    
//    
//    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        return true
//    }
//    
//    public func textViewDidChange(_ textView: UITextView) {
//        
//        if self.text != nil && (self.text! as NSString).length > 0 {
//            self.placeholderLabel.isHidden = true
//        } else {
//            self.placeholderLabel.isHidden = false
//        }
//    }

}
