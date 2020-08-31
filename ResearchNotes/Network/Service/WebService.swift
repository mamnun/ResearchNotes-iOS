//
//  WebService.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 31/8/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import Foundation
import Combine

struct Endpoint<Model: Decodable, Decoder: TopLevelDecoder> where Decoder.Input == Data {
    let decoder: Decoder
    let request: () -> URLRequest
}

enum WebServiceError: Error {
    case parsing(underlying: Error)
    case network(underlying: Error)
}

protocol WebService {
    func load<Model, Decoder>(endpoint: Endpoint<Model, Decoder>, session: URLSession) -> AnyPublisher<Model, WebServiceError>
}

extension WebService {
    func load<Model, Decoder>(endpoint: Endpoint<Model, Decoder>, session: URLSession) -> AnyPublisher<Model, WebServiceError> {
        session.dataTaskPublisher(for: endpoint.request())
            .map { $0.data }
            .mapError { WebServiceError.network(underlying: $0) }
            .decode(type: Model.self, decoder: endpoint.decoder)
            .mapError { WebServiceError.parsing(underlying: $0) }
            .eraseToAnyPublisher()
    }
}
