//
//  ListViewModel.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 08/04/21.
//

import Foundation

struct ListViewModel {
    
    func getListDetails(completion: @escaping(_ result: ListResponse?)-> Void)
    {
        let listResource = ListResource()
        listResource.getTenRecordsOnetime { (listApiResponse) in
            _ = completion(listApiResponse)
        }
    }
    
}
