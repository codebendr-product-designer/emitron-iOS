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

extension Date {
  @available(
    iOS, deprecated: 15,
    message: "Delete this extension now; it was added to Foundation."
  )
  static var now: Self { .init() } // swiftlint:disable:this let_var_whitespace

  static var topOfTheHour: Date {
    let cmpts = Calendar.current.dateComponents([.year, .month, .day, .hour], from: .now)
    return Calendar.current.date(from: cmpts)!
  }

  var cardString: String {
    let formatter = DateFormatter.cardDateFormatter
    return formatter.string(from: self)
  }
  
  func dateByAddingNumberOfDays(_ days: Int) -> Date {
      let timeInterval = TimeInterval(60 * 60 * 24 * days)
      return addingTimeInterval(timeInterval)
  }
  
  func equalEnough(to otherDate: Date, epsilon: Double = 0.001) -> Bool {
    abs(timeIntervalSince(otherDate)) < epsilon
  }
}
