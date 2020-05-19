//
//  String+FightPandemics.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/11/20.
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

extension String {
    /// Localized string for key.
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    /// Localized string with formatting for key.
    /// - Parameter params: Parameters to insert in formatted string.
    ///
    /// - Example: given "Welcome, %@!" with key of `GreetingLabel`,  use as follows:
    /// `"GreetingLabel".localized(formattedWith: "Jane")` to produce "Welcome, Jane!"
    func localized(formattedWith params: CVarArg...) -> String {
        String(format: NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: ""),
               arguments: params)
    }
}
