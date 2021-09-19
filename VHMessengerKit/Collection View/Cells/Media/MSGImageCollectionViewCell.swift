//
//  MSGImageCollectionViewCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 11/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit
import SDWebImageFLPlugin
class MSGImageCollectionViewCell: MSGMessageCell {
    
    @IBOutlet weak var imageView: FLAnimatedImageView!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var activityIndic : UIActivityIndicatorView!
    override public var message: MSGMessage? {
        didSet {
            
            guard let message = message else {
                return
            }
            
            if case let MSGMessageBody.image(image) = message.body {
                imageView.image = image
            } else if case let MSGMessageBody.imageFromUrl(imageUrl) = message.body {

                self.setGif(from: imageUrl)
            }else if case let MSGMessageBody.gifFromUrl(imageUrl) = message.body {
                self.setGif(from: imageUrl)
            }
            
        }
    }
    private func setGif(from url: URL) {
      
            self.imageView.sd_setImage(with: url, placeholderImage: UIImage(), options: .progressiveLoad)
//            DispatchQueue.global(qos: .background).async { [weak self] in
//                guard let strongSelf = self else {return }
//                strongSelf.getData(from: url) { data , response,error in
//                    if let _data = data {
//                        DispatchQueue.main.async {
//                           let gifImage = FLAnimatedImage(gifData: _data)
//                            strongSelf.imageView.animatedImage = gifImage
//                            strongSelf.activityIndic.stopAnimating()
//                        }
//                    }
//                }
//
//            }
            
        
    }
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func downloadImage(from url: URL,type:String) {
        print("Download Started")
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                if type == "gif"{
            self.imageView.image = UIImage.gif(data:data)
                }else{
            self.imageView.image = UIImage(data: data)
                }
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true  
    }

}
