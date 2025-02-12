import XCTest
import SwiftSyntax
import SwiftSyntaxBuilder

final class ArrowExprTests: XCTestCase {
  func testArrowExpr() {
    let leadingTrivia = Trivia.garbageText("␣")

    let testCases: [UInt: (ExpressibleAsArrowExpr, String)] = [
      #line: (ArrowExpr(), "␣ -> "),
      #line: (ArrowExpr(asyncKeyword: "async"), "␣async -> ")
    ]

    for (line, testCase) in testCases {
      let (builder, expected) = testCase
      let arrowExpr = builder.createArrowExpr()
      let syntax = arrowExpr.buildSyntax(format: Format(), leadingTrivia: leadingTrivia)

      var text = ""
      syntax.write(to: &text)

      XCTAssertEqual(text, expected, line: line)
    }
  }
}
