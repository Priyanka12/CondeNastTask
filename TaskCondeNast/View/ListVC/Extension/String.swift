//
//  String.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 09/04/21.
//

import Foundation

extension String {
func getDateInString(str:String) -> String {
    
    let isoDate = str

    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from:isoDate)!
    return date.timeAgoSinceDate()
}
}
