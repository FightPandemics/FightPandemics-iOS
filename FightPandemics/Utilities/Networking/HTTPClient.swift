//
//  HTTPClient.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/7/20.
//
//  Copyright (c) 2020 FightPandemics
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// HTTP client returning JSON that utilizes a URL session.
class HTTPClient {
    // MARK: - Properties

    /// URL session used for requests.
    let urlSession: URLSession

    /// Decoder used to parse JSON in responses.
    let decoder: JSONDecoder

    /// Options used when converting Data to JSON.
    let options: JSONSerialization.ReadingOptions

    // MARK: - Initializers

    init(urlSession: URLSession = URLSession.shared,
         decoder: JSONDecoder = JSONDecoder(),
         options: JSONSerialization.ReadingOptions = []) {
        self.urlSession = urlSession
        self.decoder = decoder
        self.options = options
    }

    // MARK: - Instance methods

    func sendModelRequest<T: Decodable>(url: URL,
                                        httpMethod: HTTPMethod,
                                        modelType: T.Type,
                                        completion: @escaping (Result<T, HTTPClientError>) -> Void) {
        var httpRequest = HTTPRequest(url: url)
        httpRequest.httpMethod = httpMethod.rawValue
        sendModelRequest(httpRequest, modelType: modelType, completion: completion)
    }

    func sendModelRequest<T: Decodable>(_ httpRequest: HTTPRequest,
                                        modelType: T.Type,
                                        completion: @escaping (Result<T, HTTPClientError>) -> Void) {
        sendJSONRequest(httpRequest) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(response):
                do {
                    let model = try self.decoder.decode(modelType.self, from: response.data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.jsonParsingFailed))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func sendJSONRequest(_ httpRequest: HTTPRequest,
                         completion: @escaping (Result<(data: Data, json: JSON), HTTPClientError>) -> Void) {
        urlSession.httpRequest(httpRequest) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: self.options)

                    guard JSONSerialization.isValidJSONObject(json) else {
                        completion(.failure(.invalidJSON(value: json)))
                        return
                    }

                    completion(.success((data, json)))
                } catch {
                    completion(.failure(.invalidJSON(value: data)))
                }
            case let .failure(error):
                completion(.failure(.httpRequestError(error: error)))
            }
        }
    }
}
