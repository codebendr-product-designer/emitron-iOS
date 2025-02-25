// Copyright (c) 2022 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import SwiftyJSON
import GRDB
@testable import Emitron

extension Domain {
  static func loadAndSaveMocks(db: DatabaseWriter) throws {
    let domains = loadMocksFrom(filename: "Domains")
    try db.write { db in
      try domains.forEach { try $0.save(db) }
    }
  }
  
  private static func loadMocksFrom(filename: String) -> ([Domain]) {
    do {
      let bundle = Bundle(for: AttachmentTest.self)
      let fileURL = bundle.url(forResource: filename, withExtension: "json")
      let data = try Data(contentsOf: fileURL!)
      let json = try JSON(data: data)
      
      let document = JSONAPIDocument(json)
      let domains = try document.data.map { resource in
        try DomainAdapter.process(resource: resource)
      }
      return domains
    } catch {
      preconditionFailure("Unable to load Domain mocks: \(error)")
    }
  }
}
