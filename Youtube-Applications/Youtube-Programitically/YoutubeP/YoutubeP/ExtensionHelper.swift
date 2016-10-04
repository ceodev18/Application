//
//  ExtensionHelper.swift
//  YoutubeP
//
//  Created by SKS on 02/10/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import UIKit

extension UIView {
    func addConstrainsts(format:String ,viewsList: UIView...) {
        var viewDictionary = [String:UIView]()
        for(index,views) in viewsList.enumerated() {
            let key = "v\(index)"
            views.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = views
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:format, options: [], metrics: [:], views: viewDictionary))
    }
}

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String) {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)

            }
        }).resume()
    }
    
}

