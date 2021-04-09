//
//  UIImageView.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 09/04/21.
//

import Foundation
import UIKit

//extension UIImageView {
//    
//    func loadImage(fromURL urlString: String) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//
//        let activityView = UIActivityIndicatorView(style: .medium)
//        self.addSubview(activityView)
//        activityView.frame = self.bounds
//        activityView.translatesAutoresizingMaskIntoConstraints = false
//        activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        activityView.startAnimating()
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            DispatchQueue.main.async {
//                activityView.stopAnimating()
//                activityView.removeFromSuperview()
//            }
//
//            if let data = data {
//                let image = UIImage(data: data)
//                DispatchQueue.main.async {
//                    self.image = image
//                }
//            }
//        }.resume()
//    }
//}

extension UIImageView{
func setImageFromURl(stringImageUrl url: String){
    if let url = NSURL(string: url) {
        DispatchQueue.global(qos: .default).async{
            if let data = NSData(contentsOf: url as URL) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data as Data)
                }
            }
        }
    }
 }
}
