//
//  SessionManager.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/13/20.
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

final class SessionManager {

    // MARK: - Types

    enum AuthState {
        case loggedIn(user: User)
        case guest
    }

    // MARK: - Properties

    private(set) var authState: AuthState!
    let api: API

    // MARK: - Init/Deinit

    init(api: API, authState: AuthState) {
        self.api = api
        self.authState = authState
    }

    // MARK: - Instance methods

    func logIn(email: String, password: String, completion: @escaping (Result<Success, SessionManagerError>) -> Void) {
        api.logIn(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.authState = .loggedIn(user: user)
                completion(.success(Success()))
            case .failure(let error):
                completion(.failure(.apiError(value: error)))
            }
        }
    }

    func logOut() {
        api.logOut { _ in
            // Regardless of whether backend is successful cleaning up session,
            // still enact a front-end logout by clearing application state
        }
        authState = .guest
    }

}
