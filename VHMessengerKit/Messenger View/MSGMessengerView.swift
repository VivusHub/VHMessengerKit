//
//  MSGMessengerView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// Internal class used to load the collection view and input view for `MSGMessengerView`.
/// This view simply contains two containers and is loaded from the `MSGMessengerView` nib.
class MSGMessengerView: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var collectionViewContainer: UIView!
    
    @IBOutlet weak var inputViewContainer: UIView!

    func add(_ collectionView: MSGCollectionView) {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewContainer.addSubview(collectionView)
        
        if #available(iOS 11.0, *) {
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
            collectionView.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor, constant: 0).isActive = true
        }

        collectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: collectionViewContainer.bottomAnchor).isActive = true
        
    }
    
    func add(_ inputView: MSGInputView) {
        
        inputView.translatesAutoresizingMaskIntoConstraints = false
        
        inputViewContainer.addSubview(inputView)
        
        inputView.topAnchor.constraint(equalTo: inputViewContainer.topAnchor).isActive = true
        inputView.leadingAnchor.constraint(equalTo: inputViewContainer.leadingAnchor).isActive = true
        inputView.trailingAnchor.constraint(equalTo: inputViewContainer.trailingAnchor).isActive = true
        inputView.bottomAnchor.constraint(equalTo: inputViewContainer.bottomAnchor).isActive = true
        
    }
    /// A helper to add the progress bar of top of the InputView with a height of 5
    func add(_ chatProgressBar: ChatProgressBar) {
        chatProgressBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(chatProgressBar)
        chatProgressBar.bottomAnchor.constraint(equalTo: inputViewContainer.topAnchor).isActive = true
        chatProgressBar.leadingAnchor.constraint(equalTo: inputViewContainer.leadingAnchor).isActive = true
        chatProgressBar.trailingAnchor.constraint(equalTo: inputViewContainer.trailingAnchor).isActive = true
        chatProgressBar.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
}
