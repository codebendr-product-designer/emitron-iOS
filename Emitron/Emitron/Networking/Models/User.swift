/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

public struct User: Codable {

  public let externalId: String
  public let email: String
  public let username: String
  public let avatarUrl: URL
  public let name: String
  public let token: String

  internal init?(dictionary: [String: String]) {
    guard
      let externalId = dictionary["external_id"],
      let email = dictionary["email"],
      let username = dictionary["username"],
      let avatarUrlString = dictionary["avatar_url"],
      let avatarUrl = URL(string: avatarUrlString),
      let name = dictionary["name"]?.replacingOccurrences(of: "+", with: " "),
      let token = dictionary["token"]
      else
    { return nil }

    self.externalId = externalId
    self.email = email
    self.username = username
    self.avatarUrl = avatarUrl
    self.name = name
    self.token = token
  }
}

extension User: Equatable {
  public static func == (lhs: User, rhs: User) -> Bool {
    return lhs.externalId == rhs.externalId &&
      lhs.email == rhs.email &&
      lhs.username == rhs.username &&
      lhs.avatarUrl == rhs.avatarUrl &&
      lhs.name == rhs.name &&
      lhs.token == rhs.token
  }
}
