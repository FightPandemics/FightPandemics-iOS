//
//  JSONFileReader.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/9/20.
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

/// Reads files containing JSON.
final class JSONFileReader {
    // MARK: - Properties

    let decoder: JSONDecoder
    let options: JSONSerialization.ReadingOptions

    // MARK: - Init/Deinit

    init(decoder: JSONDecoder = JSONDecoder(),
         options: JSONSerialization.ReadingOptions = []) {
        self.decoder = decoder
        self.options = options
    }

    // MARK: - Instance methods

    /// Reads and parses the provided JSON file into a model.
    /// - Parameter fileName: JSON file name.
    /// - Parameter modelType: Type of model created from JSON.
    func read<T: Decodable>(fileNamed fileName: String,
                            modelType: T.Type) -> Result<T, JSONFileReaderError> {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return .failure(.fileNotFound(fileName: "\(fileName).json"))
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let model = try decoder.decode(modelType.self, from: data)
            return .success(model)
        } catch {
            return .failure(.error(value: error))
        }
    }
}
