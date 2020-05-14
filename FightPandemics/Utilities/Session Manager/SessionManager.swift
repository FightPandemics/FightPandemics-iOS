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

import UIKit

final class SessionManager {

    // MARK: - Types

    enum AuthState {
        case loggedIn(user: User)
        case guest
    }

    enum AutoLogInResult {
        case noStoredCredentials
        case success
        case forceLogOut
    }

    // MARK: - Properties

    private(set) var authState: AuthState!
    let api: API
    let jsonFileReader: JSONFileReader

    // MARK: - Init/Deinit

    init(api: API, authState: AuthState, jsonFileReader: JSONFileReader = JSONFileReader()) {
        self.api = api
        self.authState = authState
        self.jsonFileReader = jsonFileReader
    }

    // MARK: - Instance methods

    func autoLogIn(completion: @escaping (AutoLogInResult) -> Void) {
        guard let credentials = restoreCredentials() else {
            completion(.noStoredCredentials)
            return
        }

        logIn(email: credentials.email, password: credentials.password) { [weak self] result in
            switch result {
            case .success:
                completion(.success)
            case .failure:
                self?.logOut()
                completion(.forceLogOut)
            }
        }
    }

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
        clearCredentials()
    }

    // MARK: Private instance methods

    private func storeCredentials(_ credentials: AuthCredentials) {
        // Store credentials in keychain
    }

    private func restoreCredentials() -> AuthCredentials? {
        // TODO: Auto-login https://github.com/FightPandemics/FightPandemics-iOS/issues/52
        guard case let .success(mockUser) = jsonFileReader.read(fileNamed: "User", modelType: User.self) else {
            return nil
        }
        return AuthCredentials(email: mockUser.email, password: "Pass123")
    }

    private func clearCredentials() {
        // Clear credentials from keychain
    }

}
