//
//  DetailsViewModel.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 08/04/21.
//

import Foundation

struct DetailsViewModel {
    
    func getNoOfLikes(article:String, completion: @escaping(_ result: LikesResponse?)-> Void)
    {
        let listResource = DetailsResource()
        listResource.getNoOfLikes(article: article) { (likesResponse) in
            _ = completion(likesResponse)
        }
    }
    
    func getNoOfComments(article:String, completion: @escaping(_ result: CommentResponse?)-> Void)
    {
        let listResource = DetailsResource()
        listResource.getNoOfComments(article: article) { (likesResponse) in
            _ = completion(likesResponse)
        }
    }
}
