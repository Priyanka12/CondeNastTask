//
//  NewsDetailsVC.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 08/04/21.
//

import Foundation
import UIKit

class NewsDetailsVC: UIViewController {
    
    //MARK :- @IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var likeAndCommentLbl: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var newsDescriptionLbl: UITextView!
    
    var newsInfo: Article?
    var articleId:String?
    var noOfLikes:Int?
    var comments:Int?
    let newsViewModel : DetailsViewModel = DetailsViewModel()
    
    let group = DispatchGroup()
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.async {
            self.updateUI()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Displaying Data
    func updateUI() {
        
        let articleUrl = newsInfo?.url
        let changedHttpUrl = articleUrl?.replacingOccurrences(of: "https://", with: "")
        articleId = changedHttpUrl?.replacingOccurrences(of: "/", with: "-")
        if let url = URL(string: self.newsInfo?.urlToImage ?? "") {
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            imageView.image = UIImage(data: data)
        }
        }
        else {
            print("No image")
        }
        self.newsDescriptionLbl.text = self.newsInfo?.articleDescription
        self.titleLbl.text = self.newsInfo?.title
        self.publishedLabel.text = String().getDateInString(str: self.newsInfo?.publishedAt ?? "")
        
        concurrentQueue.async {
            self.getNoOflikes()
            self.getNoOfComments()
            
        }
        
    }
    func getNoOflikes() {
        
        newsViewModel.getNoOfLikes(article: articleId ?? "") { (result) in
            self.noOfLikes = result?.likes ?? 0
        }
    }
    func getNoOfComments() {
        
        newsViewModel.getNoOfComments(article: articleId ?? "") { (result) in
            self.comments = result?.comments ?? 0
            DispatchQueue.main.async  {
                self.likeAndCommentLbl.text = "\(self.noOfLikes ?? 0) likes \u{2022} \(self.comments ?? 0) comments"
            }
        }
    }
}
