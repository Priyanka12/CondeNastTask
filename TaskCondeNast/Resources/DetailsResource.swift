//
//  DetailsResource.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 08/04/21.
//

import Foundation

struct DetailsResource
{
    
    func getNoOfLikes(article:String, completion: @escaping(_ result : LikesResponse?) -> Void)
    {
        let httpUtility = HttpUtility()
        let url = ApiEndpoints.noOfLikes + article
        print(url)
        let requestUrl = URL(string:url)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: LikesResponse.self) { (listApiResponse) in

            _ = completion(listApiResponse)
        }
    }
    
    func getNoOfComments(article:String, completion: @escaping(_ result : CommentResponse?) -> Void)
    {
        let httpUtility = HttpUtility()
        let url = ApiEndpoints.comments + article
        print(url)
        let requestUrl = URL(string:url)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: CommentResponse.self) { (listApiResponse) in

            _ = completion(listApiResponse)
        }
    }
}
