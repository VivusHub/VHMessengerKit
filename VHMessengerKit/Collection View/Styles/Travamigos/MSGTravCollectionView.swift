//
//  MSGTravCollectionView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGTravCollectionView: MSGCollectionView {

    static var textOutgoingCell: MSGTravCollectionViewCell?
    
    static var textIncomingCell: MSGTravCollectionViewCell?
    
    static var textOutgoingReplyCell: MSGTravReplyCollectionViewCell?
    
    static var textIncomingReplyCell: MSGTravReplyCollectionViewCell?
    
    
    override open func registerCells() {
        super.registerCells()
        
        MSGTravCollectionView.textOutgoingCell = UINib(nibName: "MSGOutgoingTravCollectionViewCell", bundle: MessengerKit.bundle).instantiate(withOwner: nil).first as? MSGTravCollectionViewCell
        
        MSGTravCollectionView.textIncomingCell = UINib(nibName: "MSGIncomingTravCollectionViewCell", bundle: MessengerKit.bundle).instantiate(withOwner: nil).first as? MSGTravCollectionViewCell
        
        MSGTravCollectionView.textOutgoingReplyCell = UINib(nibName: "MSGOutgoingTravReplyCollectionViewCell", bundle: MessengerKit.bundle).instantiate(withOwner: nil).first as? MSGTravReplyCollectionViewCell
        
        MSGTravCollectionView.textIncomingReplyCell = UINib(nibName: "MSGIncomingTravReplyCollectionViewCell", bundle: MessengerKit.bundle).instantiate(withOwner: nil).first as? MSGTravReplyCollectionViewCell
        
        collectionViewLayout = MSGTravCollectionViewFlowLayout()
        
        // Text
        
        register(UINib(nibName: "MSGOutgoingTravCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingText")
        
        register(UINib(nibName: "MSGIncomingTravCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingText")
        
        register(UINib(nibName: "MSGOutgoingTravReplyCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingReplyText")
        
        register(UINib(nibName: "MSGIncomingTravReplyCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingReplyText")
        
        // Emoji
        
        register(UINib(nibName: "MSGOutgoingEmojiCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingEmoji")
        
        register(UINib(nibName: "MSGIncomingEmojiCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingEmoji")
        
        // Image
        
        register(UINib(nibName: "MSGOutgoingImageCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingImage")
        
        register(UINib(nibName: "MSGIncomingImageCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingImage")
        
        // Footers
        
        register(UINib(nibName: "MSGTravOutgoingCollectionViewSectionFooter", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "outgoingFooter")
        register(UINib(nibName: "MSGTravIncomingCollectionViewSectionFooter", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "incomingFooter")
        
        // Headers
        
        register(UINib(nibName: "MSGTravOutgoingCollectionViewSectionHeader", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "outgoingHeader")
        
        register(UINib(nibName: "MSGTravIncomingCollectionViewSectionHeader", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "incomingHeader")
    }

}
