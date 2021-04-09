//
//  ListResource.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 08/04/21.
//

import Foundation

struct ListResource
{
    
    func getTenRecordsOnetime(completion: @escaping(_ result : ListResponse?) -> Void)
    {
        let httpUtility = HttpUtility()

        let requestUrl = URL(string:ApiEndpoints.usTopHeadlines)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: ListResponse.self) { (listApiResponse) in

            _ = completion(listApiResponse)
        }
    }
}
