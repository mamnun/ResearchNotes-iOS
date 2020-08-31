//
//  ContactsWebService.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 31/8/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import Foundation
import Combine

final class ContactsWebService: WebService {
    func getContacts() -> AnyPublisher<[Contact], WebServiceError> {
        let endpoint = Endpoint<[Contact], JSONDecoder>(decoder: JSONDecoder()) { () -> URLRequest in
            return URLRequest(url: URL(string: "https://vhb9sgvwc2.execute-api.ap-southeast-2.amazonaws.com/Prod/contacts")!)
        }
        return load(endpoint: endpoint, session: URLSession.shared)
    }
    
    func getContacts(page: Int, limit: Int) -> AnyPublisher<[Contact], WebServiceError> {
        let endpoint = Endpoint<[Contact], JSONDecoder>(decoder: JSONDecoder()) { () -> URLRequest in
            return URLRequest(url: URL(string: "https://vhb9sgvwc2.execute-api.ap-southeast-2.amazonaws.com/Prod/contacts?limit=\(limit)&page=\(page)")!)
        }
        return load(endpoint: endpoint, session: URLSession.shared)
    }
}
