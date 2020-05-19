//
//  HTTPRequestError.swift
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

/// Errors when making an HTTP request.
///
/// - responseError: HTTP request returned with an error.
/// - incompleteResponse: HTTP request returned without error but with incomplete info.
/// - errorStatusCode: HTTP request returned without error but with error status code.
enum HTTPRequestError: Error, LocalizedError {
    case responseError(error: Error)
    case incompleteResponse(data: Data?, response: HTTPURLResponse?)
    case errorStatusCode(value: Int)

    var errorDescription: String? {
        switch self {
        case let .responseError(error):
            return error.localizedDescription
        case let .incompleteResponse(_, response):
            let urlResponseString = response == nil ? "nil" : response!.description
            return "Incomplete response: \(urlResponseString)"
        case let .errorStatusCode(statusCode):
            return "Error Status Code: \(statusCode)"
        }
    }
}
