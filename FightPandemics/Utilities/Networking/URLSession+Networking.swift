//
//  URLSession+Networking.swift
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

extension URLSession {
    func httpRequest(_ httpRequest: HTTPRequest,
                     completion: @escaping (Result<Data, HTTPRequestError>) -> Void) {
        _ = dataTask(with: httpRequest, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(.responseError(error: error)))
                return
            }

            guard
                let unwrappedData = data,
                let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.incompleteResponse(data: data, response: response as? HTTPURLResponse)))
                return
            }

            let successStatusCodes: Range<Int> = 200 ..< 300

            guard successStatusCodes.contains(httpResponse.statusCode) else {
                completion(.failure(.errorStatusCode(value: httpResponse.statusCode)))
                return
            }

            completion(.success(unwrappedData))
            }).resume()
    }
}
