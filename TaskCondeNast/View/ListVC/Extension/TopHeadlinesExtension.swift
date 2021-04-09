//
//  TopHeadlinesExtension.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 06/04/21.
//

import Foundation
import UIKit


extension TopHeadlinesListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsTableData?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TopHeadLinesTVCell else { return UITableViewCell() }
        cell.newsImageView.image = nil
        cell.authorLbl.text = self.newsTableData?.articles?[indexPath.row].author
        cell.newsDescriptionLbl.text = self.newsTableData?.articles?[indexPath.row].articleDescription
        // Create URL
        if let url = self.newsTableData?.articles?[indexPath.row].urlToImage {
        // Fetch Image Data
            cell.newsImageView.setImageFromURl(stringImageUrl: url)
        }
        else {
            DispatchQueue.main.async {
                cell.newsImageView.image = UIImage(named: "placeholderImage")
            }
            
        }
        cell.publishedAtLbl.text = String().getDateInString(str: self.newsTableData?.articles?[indexPath.row].publishedAt ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "NewsDetailsVC") as? NewsDetailsVC else { return }
        vc.newsInfo = self.newsTableData?.articles?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func getDateInString(str:String) -> String {
//
//        let isoDate = str
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let date = dateFormatter.date(from:isoDate)!
//        return date.timeAgoSinceDate()
//    }
}
