//
//  MSGTravReplyCollectionViewCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGTravReplyCollectionViewCell: MSGMessageCell {
    
    @IBOutlet weak var childBubble: MSGTravOutgoingBubble!
    @IBOutlet weak var bubble: MSGTravOutgoingBubble!
    
    override open var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.text(body) = message.body else { return }
            
            bubble.text = body
            childBubble.text = message.childMsg
        }
    }
    
    override open var style: MSGMessengerStyle? {
        didSet {
            guard let message = message, let style = style as? MSGTravamigosStyle else { return }
            
            bubble.linkTextAttributes = [
                NSAttributedString.Key.underlineColor: message.user.isSender ? style.outgoingLinkColor : style.incomingLinkColor,
                NSAttributedString.Key.foregroundColor: message.user.isSender ? style.outgoingLinkColor : style.incomingLinkColor,
                NSAttributedString.Key.underlineStyle: message.user.isSender ? style.outgoingLinkUnderlineStyle : style.incomingLinkUnderlineStyle
            ]
            bubble.font = style.font
            bubble.textColor = message.user.isSender ? style.outgoingTextColor : style.incomingTextColor
            bubble.gradientLayer.colors = message.user.isSender ? style.outgoingGradient : style.incomingGradient
            
            childBubble.linkTextAttributes = [
                NSAttributedString.Key.underlineColor: message.user.isSender ? style.outgoingLinkColor : style.incomingLinkColor,
                NSAttributedString.Key.foregroundColor: message.user.isSender ? style.outgoingLinkColor : style.incomingLinkColor,
                NSAttributedString.Key.underlineStyle: message.user.isSender ? style.outgoingLinkUnderlineStyle : style.incomingLinkUnderlineStyle
            ]
            childBubble.font = style.font
            childBubble.textColor = message.user.isSender ? style.outgoingTextColor : style.incomingTextColor
            childBubble.gradientLayer.colors = style.incomingGradient
            let bgcolor = UIColor(named: "AppBrandToBlackColor")
            childBubble.layer.borderColor = bgcolor!.cgColor
            childBubble.layer.borderWidth = 1.0 / UIScreen.main.scale
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        bubble.delegate = self
    }
    
}

extension MSGTravReplyCollectionViewCell: UITextViewDelegate {
    
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        delegate?.cellLinkTapped(url: URL)
        
        return false
    }
    
}
