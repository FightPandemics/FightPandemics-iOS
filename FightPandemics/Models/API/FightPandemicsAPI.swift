//
//  FightPandemicsAPI.swift
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

final class FightPandemicsAPI: API {

    // MARK: - Properties

    let baseURL: String
    let httpClient: HTTPClient
    let jsonFileReader: JSONFileReader

    // MARK: - Init/Deinit

    init( baseURL: String, httpClient: HTTPClient, jsonFileReader: JSONFileReader) {
        self.baseURL = baseURL
        self.httpClient = httpClient
        self.jsonFileReader = jsonFileReader
    }

    // MARK: - Protocol conformance

    // MARK: API

    func logIn(email: String, password: String, completion: @escaping (Result<User, APIError>) -> Void) {
        assertionFailure("API not implemented yet")
        completion(.failure(.unimplemented(endpoint: "/login")))
    }

    func logOut(completion: @escaping (Result<Success, APIError>) -> Void) {
        assertionFailure("API not implemented yet")
        completion(.failure(.unimplemented(endpoint: "/logout")))
    }

    func downloadOpenSourceLicenses(completion: @escaping ([(license: OpenSourceLicense, details: HTML)]) -> Void) {
        let licenses = (try? jsonFileReader.read(fileNamed: "OpenSourceCredits", modelType: [OpenSourceLicense].self).get()) ?? []
        let licenseGroup = DispatchGroup()
        var downloadedLicenses: [(license: OpenSourceLicense, details: HTML)] = []

        for license in licenses {
            licenseGroup.enter()

            guard let url = license.url else {
                licenseGroup.leave()
                continue
            }

            httpClient.urlSession.httpRequest(.init(url: url)) { result in
                if let data = try? result.get(), let html = HTML(data: data, encoding: String.Encoding.utf8) {
                    downloadedLicenses.append((license, html))
                }

                licenseGroup.leave()
            }
        }

        licenseGroup.notify(queue: .main) {
            completion(downloadedLicenses)
        }
    }

}
