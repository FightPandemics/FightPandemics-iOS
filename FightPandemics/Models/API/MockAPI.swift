//
//  MockAPI.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/10/20.
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

final class MockAPI: API {

    let jsonFileReader: JSONFileReader
    let latency: DispatchTimeInterval

    init(jsonFileReader: JSONFileReader = JSONFileReader(),
         latency: DispatchTimeInterval = .seconds(2)) {
        self.jsonFileReader = jsonFileReader
        self.latency = latency
    }

    func logIn(email: String, password: String, completion: @escaping (Result<User, APIError>) -> Void) {
        let user = jsonFileReader.read(fileNamed: "User", modelType: User.self)

        simulateNetworkDelay(then: {
            switch user {
            case .success(let user):
                guard email == user.email else {
                    completion(.failure(.httpClientError(value: .httpRequestError(error: .responseError(error: NSError(domain: "com.fp.fp", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"]))))))
                    return
                }
                completion(.success(user))
            case .failure:
                completion(.failure(.httpClientError(value: .jsonParsingFailed)))
            }
        })
    }

    func logOut(completion: @escaping (Result<Success, APIError>) -> Void) {
        simulateNetworkDelay(then: {
            completion(.success(Success()))
        })
    }

    private func simulateNetworkDelay(then: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + latency) {
            then()
        }
    }

}
