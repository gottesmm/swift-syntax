//// Automatically Generated From SyntaxNodes.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxNodes.swift - Syntax Node definitions -------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//


// MARK: - MissingSyntax

public struct MissingSyntax: SyntaxProtocol, SyntaxHashable {

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MissingSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .missing else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MissingSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .missing)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 0)
  }
}

extension MissingSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
    ])
  }
}

// MARK: - CodeBlockItemSyntax

/// 
/// A CodeBlockItem is any Syntax node that appears on its own line inside
/// a CodeBlock.
/// 
public struct CodeBlockItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeItem
    case item
    case garbageBetweenItemAndSemicolon
    case semicolon
    case garbageBetweenSemicolonAndErrorTokens
    case errorTokens
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CodeBlockItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .codeBlockItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CodeBlockItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .codeBlockItem)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeItem: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeItem,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeItem(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeItem` replaced.
  /// - param newChild: The new `garbageBeforeItem` to replace the node's
  ///                   current `garbageBeforeItem`, if present.
  public func withGarbageBeforeItem(
    _ newChild: GarbageNodesSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeItem)
    return CodeBlockItemSyntax(newData)
  }

  /// The underlying node inside the code block.
  public var item: Syntax {
    get {
      let childData = data.child(at: Cursor.item,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withItem(value)
    }
  }

  /// Returns a copy of the receiver with its `item` replaced.
  /// - param newChild: The new `item` to replace the node's
  ///                   current `item`, if present.
  public func withItem(
    _ newChild: Syntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.item)
    return CodeBlockItemSyntax(newData)
  }

  public var garbageBetweenItemAndSemicolon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenItemAndSemicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenItemAndSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenItemAndSemicolon` replaced.
  /// - param newChild: The new `garbageBetweenItemAndSemicolon` to replace the node's
  ///                   current `garbageBetweenItemAndSemicolon`, if present.
  public func withGarbageBetweenItemAndSemicolon(
    _ newChild: GarbageNodesSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenItemAndSemicolon)
    return CodeBlockItemSyntax(newData)
  }

  /// 
  /// If present, the trailing semicolon at the end of the item.
  /// 
  public var semicolon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.semicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.semicolon)
    return CodeBlockItemSyntax(newData)
  }

  public var garbageBetweenSemicolonAndErrorTokens: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenSemicolonAndErrorTokens,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenSemicolonAndErrorTokens(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenSemicolonAndErrorTokens` replaced.
  /// - param newChild: The new `garbageBetweenSemicolonAndErrorTokens` to replace the node's
  ///                   current `garbageBetweenSemicolonAndErrorTokens`, if present.
  public func withGarbageBetweenSemicolonAndErrorTokens(
    _ newChild: GarbageNodesSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenSemicolonAndErrorTokens)
    return CodeBlockItemSyntax(newData)
  }

  public var errorTokens: Syntax? {
    get {
      let childData = data.child(at: Cursor.errorTokens,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withErrorTokens(value)
    }
  }

  /// Returns a copy of the receiver with its `errorTokens` replaced.
  /// - param newChild: The new `errorTokens` to replace the node's
  ///                   current `errorTokens`, if present.
  public func withErrorTokens(
    _ newChild: Syntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.errorTokens)
    return CodeBlockItemSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
  }
}

extension CodeBlockItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeItem": garbageBeforeItem.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "item": Syntax(item).asProtocol(SyntaxProtocol.self),
      "garbageBetweenItemAndSemicolon": garbageBetweenItemAndSemicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "semicolon": semicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenSemicolonAndErrorTokens": garbageBetweenSemicolonAndErrorTokens.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "errorTokens": errorTokens.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - CodeBlockSyntax

public struct CodeBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftBrace
    case leftBrace
    case garbageBetweenLeftBraceAndStatements
    case statements
    case garbageBetweenStatementsAndRightBrace
    case rightBrace
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CodeBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .codeBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CodeBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .codeBlock)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftBrace: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftBrace` replaced.
  /// - param newChild: The new `garbageBeforeLeftBrace` to replace the node's
  ///                   current `garbageBeforeLeftBrace`, if present.
  public func withGarbageBeforeLeftBrace(
    _ newChild: GarbageNodesSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftBrace)
    return CodeBlockSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftBrace)
    let newData = data.replacingChild(raw, at: Cursor.leftBrace)
    return CodeBlockSyntax(newData)
  }

  public var garbageBetweenLeftBraceAndStatements: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftBraceAndStatements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftBraceAndStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftBraceAndStatements` replaced.
  /// - param newChild: The new `garbageBetweenLeftBraceAndStatements` to replace the node's
  ///                   current `garbageBetweenLeftBraceAndStatements`, if present.
  public func withGarbageBetweenLeftBraceAndStatements(
    _ newChild: GarbageNodesSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftBraceAndStatements)
    return CodeBlockSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: Cursor.statements,
                                 parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> CodeBlockSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.codeBlockItemList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.statements)
    return CodeBlockSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.codeBlockItemList)
    let newData = data.replacingChild(raw, at: Cursor.statements)
    return CodeBlockSyntax(newData)
  }

  public var garbageBetweenStatementsAndRightBrace: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenStatementsAndRightBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenStatementsAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenStatementsAndRightBrace` replaced.
  /// - param newChild: The new `garbageBetweenStatementsAndRightBrace` to replace the node's
  ///                   current `garbageBetweenStatementsAndRightBrace`, if present.
  public func withGarbageBetweenStatementsAndRightBrace(
    _ newChild: GarbageNodesSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenStatementsAndRightBrace)
    return CodeBlockSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightBrace)
    let newData = data.replacingChild(raw, at: Cursor.rightBrace)
    return CodeBlockSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is CodeBlockItemListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CodeBlockItemListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension CodeBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftBrace": garbageBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftBraceAndStatements": garbageBetweenLeftBraceAndStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
      "garbageBetweenStatementsAndRightBrace": garbageBetweenStatementsAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclNameArgumentSyntax

public struct DeclNameArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declNameArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclNameArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declNameArgument)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return DeclNameArgumentSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.unknown(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return DeclNameArgumentSyntax(newData)
  }

  public var garbageBetweenNameAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndColon` replaced.
  /// - param newChild: The new `garbageBetweenNameAndColon` to replace the node's
  ///                   current `garbageBetweenNameAndColon`, if present.
  public func withGarbageBetweenNameAndColon(
    _ newChild: GarbageNodesSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndColon)
    return DeclNameArgumentSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DeclNameArgumentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension DeclNameArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndColon": garbageBetweenNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclNameArgumentsSyntax

public struct DeclNameArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftParen
    case leftParen
    case garbageBetweenLeftParenAndArguments
    case arguments
    case garbageBetweenArgumentsAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declNameArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclNameArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declNameArguments)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftParen` replaced.
  /// - param newChild: The new `garbageBeforeLeftParen` to replace the node's
  ///                   current `garbageBeforeLeftParen`, if present.
  public func withGarbageBeforeLeftParen(
    _ newChild: GarbageNodesSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftParen)
    return DeclNameArgumentsSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return DeclNameArgumentsSyntax(newData)
  }

  public var garbageBetweenLeftParenAndArguments: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndArguments` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndArguments` to replace the node's
  ///                   current `garbageBetweenLeftParenAndArguments`, if present.
  public func withGarbageBetweenLeftParenAndArguments(
    _ newChild: GarbageNodesSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndArguments)
    return DeclNameArgumentsSyntax(newData)
  }

  public var arguments: DeclNameArgumentListSyntax {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      return DeclNameArgumentListSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Adds the provided `Argument` to the node's `arguments`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `arguments` collection.
  public func addArgument(_ element: DeclNameArgumentSyntax) -> DeclNameArgumentsSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.declNameArgumentList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.arguments)
    return DeclNameArgumentsSyntax(newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentListSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.declNameArgumentList)
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return DeclNameArgumentsSyntax(newData)
  }

  public var garbageBetweenArgumentsAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenArgumentsAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenArgumentsAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenArgumentsAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenArgumentsAndRightParen` to replace the node's
  ///                   current `garbageBetweenArgumentsAndRightParen`, if present.
  public func withGarbageBetweenArgumentsAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenArgumentsAndRightParen)
    return DeclNameArgumentsSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return DeclNameArgumentsSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is DeclNameArgumentListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclNameArgumentListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension DeclNameArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftParen": garbageBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndArguments": garbageBetweenLeftParenAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": Syntax(arguments).asProtocol(SyntaxProtocol.self),
      "garbageBetweenArgumentsAndRightParen": garbageBetweenArgumentsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - TupleExprElementSyntax

public struct TupleExprElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabel
    case label
    case garbageBetweenLabelAndColon
    case colon
    case garbageBetweenColonAndExpression
    case expression
    case garbageBetweenExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TupleExprElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tupleExprElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TupleExprElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleExprElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeLabel` to replace the node's
  ///                   current `garbageBeforeLabel`, if present.
  public func withGarbageBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabel)
    return TupleExprElementSyntax(newData)
  }

  public var label: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.label)
    return TupleExprElementSyntax(newData)
  }

  public var garbageBetweenLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndColon` to replace the node's
  ///                   current `garbageBetweenLabelAndColon`, if present.
  public func withGarbageBetweenLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndColon)
    return TupleExprElementSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TupleExprElementSyntax(newData)
  }

  public var garbageBetweenColonAndExpression: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndExpression` replaced.
  /// - param newChild: The new `garbageBetweenColonAndExpression` to replace the node's
  ///                   current `garbageBetweenColonAndExpression`, if present.
  public func withGarbageBetweenColonAndExpression(
    _ newChild: GarbageNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndExpression)
    return TupleExprElementSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.expression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.expression)
    return TupleExprElementSyntax(newData)
  }

  public var garbageBetweenExpressionAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenExpressionAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenExpressionAndTrailingComma`, if present.
  public func withGarbageBetweenExpressionAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenExpressionAndTrailingComma)
    return TupleExprElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TupleExprElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is ExprSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension TupleExprElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabel": garbageBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": label.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenLabelAndColon": garbageBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenColonAndExpression": garbageBetweenColonAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "garbageBetweenExpressionAndTrailingComma": garbageBetweenExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ArrayElementSyntax

public struct ArrayElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeExpression
    case expression
    case garbageBetweenExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ArrayElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .arrayElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ArrayElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .arrayElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeExpression: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeExpression` replaced.
  /// - param newChild: The new `garbageBeforeExpression` to replace the node's
  ///                   current `garbageBeforeExpression`, if present.
  public func withGarbageBeforeExpression(
    _ newChild: GarbageNodesSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeExpression)
    return ArrayElementSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.expression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.expression)
    return ArrayElementSyntax(newData)
  }

  public var garbageBetweenExpressionAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenExpressionAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenExpressionAndTrailingComma`, if present.
  public func withGarbageBetweenExpressionAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenExpressionAndTrailingComma)
    return ArrayElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ArrayElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is ExprSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ArrayElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeExpression": garbageBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "garbageBetweenExpressionAndTrailingComma": garbageBetweenExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DictionaryElementSyntax

public struct DictionaryElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeKeyExpression
    case keyExpression
    case garbageBetweenKeyExpressionAndColon
    case colon
    case garbageBetweenColonAndValueExpression
    case valueExpression
    case garbageBetweenValueExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DictionaryElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .dictionaryElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DictionaryElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .dictionaryElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeKeyExpression: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeKeyExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeKeyExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeKeyExpression` replaced.
  /// - param newChild: The new `garbageBeforeKeyExpression` to replace the node's
  ///                   current `garbageBeforeKeyExpression`, if present.
  public func withGarbageBeforeKeyExpression(
    _ newChild: GarbageNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeKeyExpression)
    return DictionaryElementSyntax(newData)
  }

  public var keyExpression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.keyExpression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withKeyExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `keyExpression` replaced.
  /// - param newChild: The new `keyExpression` to replace the node's
  ///                   current `keyExpression`, if present.
  public func withKeyExpression(
    _ newChild: ExprSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.keyExpression)
    return DictionaryElementSyntax(newData)
  }

  public var garbageBetweenKeyExpressionAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenKeyExpressionAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenKeyExpressionAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenKeyExpressionAndColon` replaced.
  /// - param newChild: The new `garbageBetweenKeyExpressionAndColon` to replace the node's
  ///                   current `garbageBetweenKeyExpressionAndColon`, if present.
  public func withGarbageBetweenKeyExpressionAndColon(
    _ newChild: GarbageNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenKeyExpressionAndColon)
    return DictionaryElementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DictionaryElementSyntax(newData)
  }

  public var garbageBetweenColonAndValueExpression: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndValueExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndValueExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndValueExpression` replaced.
  /// - param newChild: The new `garbageBetweenColonAndValueExpression` to replace the node's
  ///                   current `garbageBetweenColonAndValueExpression`, if present.
  public func withGarbageBetweenColonAndValueExpression(
    _ newChild: GarbageNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndValueExpression)
    return DictionaryElementSyntax(newData)
  }

  public var valueExpression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.valueExpression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withValueExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `valueExpression` replaced.
  /// - param newChild: The new `valueExpression` to replace the node's
  ///                   current `valueExpression`, if present.
  public func withValueExpression(
    _ newChild: ExprSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.valueExpression)
    return DictionaryElementSyntax(newData)
  }

  public var garbageBetweenValueExpressionAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenValueExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenValueExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenValueExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenValueExpressionAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenValueExpressionAndTrailingComma`, if present.
  public func withGarbageBetweenValueExpressionAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenValueExpressionAndTrailingComma)
    return DictionaryElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return DictionaryElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is ExprSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is ExprSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension DictionaryElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeKeyExpression": garbageBeforeKeyExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "keyExpression": Syntax(keyExpression).asProtocol(SyntaxProtocol.self),
      "garbageBetweenKeyExpressionAndColon": garbageBetweenKeyExpressionAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndValueExpression": garbageBetweenColonAndValueExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "valueExpression": Syntax(valueExpression).asProtocol(SyntaxProtocol.self),
      "garbageBetweenValueExpressionAndTrailingComma": garbageBetweenValueExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureCaptureItemSyntax

public struct ClosureCaptureItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeSpecifier
    case specifier
    case garbageBetweenSpecifierAndName
    case name
    case garbageBetweenNameAndAssignToken
    case assignToken
    case garbageBetweenAssignTokenAndExpression
    case expression
    case garbageBetweenExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureCaptureItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureCaptureItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureCaptureItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureCaptureItem)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeSpecifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeSpecifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeSpecifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeSpecifier` replaced.
  /// - param newChild: The new `garbageBeforeSpecifier` to replace the node's
  ///                   current `garbageBeforeSpecifier`, if present.
  public func withGarbageBeforeSpecifier(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeSpecifier)
    return ClosureCaptureItemSyntax(newData)
  }

  public var specifier: TokenListSyntax? {
    get {
      let childData = data.child(at: Cursor.specifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenListSyntax(childData!)
    }
    set(value) {
      self = withSpecifier(value)
    }
  }

  /// Adds the provided `SpecifierToken` to the node's `specifier`
  /// collection.
  /// - param element: The new `SpecifierToken` to add to the node's
  ///                  `specifier` collection.
  /// - returns: A copy of the receiver with the provided `SpecifierToken`
  ///            appended to its `specifier` collection.
  public func addSpecifierToken(_ element: TokenSyntax) -> ClosureCaptureItemSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.specifier] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.tokenList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.specifier)
    return ClosureCaptureItemSyntax(newData)
  }

  /// Returns a copy of the receiver with its `specifier` replaced.
  /// - param newChild: The new `specifier` to replace the node's
  ///                   current `specifier`, if present.
  public func withSpecifier(
    _ newChild: TokenListSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.specifier)
    return ClosureCaptureItemSyntax(newData)
  }

  public var garbageBetweenSpecifierAndName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenSpecifierAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenSpecifierAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenSpecifierAndName` replaced.
  /// - param newChild: The new `garbageBetweenSpecifierAndName` to replace the node's
  ///                   current `garbageBetweenSpecifierAndName`, if present.
  public func withGarbageBetweenSpecifierAndName(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenSpecifierAndName)
    return ClosureCaptureItemSyntax(newData)
  }

  public var name: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ClosureCaptureItemSyntax(newData)
  }

  public var garbageBetweenNameAndAssignToken: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndAssignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndAssignToken` replaced.
  /// - param newChild: The new `garbageBetweenNameAndAssignToken` to replace the node's
  ///                   current `garbageBetweenNameAndAssignToken`, if present.
  public func withGarbageBetweenNameAndAssignToken(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndAssignToken)
    return ClosureCaptureItemSyntax(newData)
  }

  public var assignToken: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.assignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `assignToken` replaced.
  /// - param newChild: The new `assignToken` to replace the node's
  ///                   current `assignToken`, if present.
  public func withAssignToken(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.assignToken)
    return ClosureCaptureItemSyntax(newData)
  }

  public var garbageBetweenAssignTokenAndExpression: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAssignTokenAndExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAssignTokenAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAssignTokenAndExpression` replaced.
  /// - param newChild: The new `garbageBetweenAssignTokenAndExpression` to replace the node's
  ///                   current `garbageBetweenAssignTokenAndExpression`, if present.
  public func withGarbageBetweenAssignTokenAndExpression(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAssignTokenAndExpression)
    return ClosureCaptureItemSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.expression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.expression)
    return ClosureCaptureItemSyntax(newData)
  }

  public var garbageBetweenExpressionAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenExpressionAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenExpressionAndTrailingComma`, if present.
  public func withGarbageBetweenExpressionAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenExpressionAndTrailingComma)
    return ClosureCaptureItemSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ClosureCaptureItemSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 10)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenListSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenListSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is ExprSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ClosureCaptureItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeSpecifier": garbageBeforeSpecifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "specifier": specifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenSpecifierAndName": garbageBetweenSpecifierAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": name.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenNameAndAssignToken": garbageBetweenNameAndAssignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "assignToken": assignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAssignTokenAndExpression": garbageBetweenAssignTokenAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "garbageBetweenExpressionAndTrailingComma": garbageBetweenExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureCaptureSignatureSyntax

public struct ClosureCaptureSignatureSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftSquare
    case leftSquare
    case garbageBetweenLeftSquareAndItems
    case items
    case garbageBetweenItemsAndRightSquare
    case rightSquare
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureCaptureSignatureSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureCaptureSignature else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureCaptureSignatureSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureCaptureSignature)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftSquare: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftSquare,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftSquare` replaced.
  /// - param newChild: The new `garbageBeforeLeftSquare` to replace the node's
  ///                   current `garbageBeforeLeftSquare`, if present.
  public func withGarbageBeforeLeftSquare(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var leftSquare: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftSquare,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(
    _ newChild: TokenSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftSquareBracket)
    let newData = data.replacingChild(raw, at: Cursor.leftSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var garbageBetweenLeftSquareAndItems: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftSquareAndItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftSquareAndItems(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftSquareAndItems` replaced.
  /// - param newChild: The new `garbageBetweenLeftSquareAndItems` to replace the node's
  ///                   current `garbageBetweenLeftSquareAndItems`, if present.
  public func withGarbageBetweenLeftSquareAndItems(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftSquareAndItems)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var items: ClosureCaptureItemListSyntax? {
    get {
      let childData = data.child(at: Cursor.items,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureCaptureItemListSyntax(childData!)
    }
    set(value) {
      self = withItems(value)
    }
  }

  /// Adds the provided `Item` to the node's `items`
  /// collection.
  /// - param element: The new `Item` to add to the node's
  ///                  `items` collection.
  /// - returns: A copy of the receiver with the provided `Item`
  ///            appended to its `items` collection.
  public func addItem(_ element: ClosureCaptureItemSyntax) -> ClosureCaptureSignatureSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.items] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.closureCaptureItemList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.items)
    return ClosureCaptureSignatureSyntax(newData)
  }

  /// Returns a copy of the receiver with its `items` replaced.
  /// - param newChild: The new `items` to replace the node's
  ///                   current `items`, if present.
  public func withItems(
    _ newChild: ClosureCaptureItemListSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.items)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var garbageBetweenItemsAndRightSquare: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenItemsAndRightSquare,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenItemsAndRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenItemsAndRightSquare` replaced.
  /// - param newChild: The new `garbageBetweenItemsAndRightSquare` to replace the node's
  ///                   current `garbageBetweenItemsAndRightSquare`, if present.
  public func withGarbageBetweenItemsAndRightSquare(
    _ newChild: GarbageNodesSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenItemsAndRightSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var rightSquare: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightSquare,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(
    _ newChild: TokenSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightSquareBracket)
    let newData = data.replacingChild(raw, at: Cursor.rightSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ClosureCaptureItemListSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ClosureCaptureItemListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ClosureCaptureSignatureSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftSquare": garbageBeforeLeftSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftSquare": Syntax(leftSquare).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftSquareAndItems": garbageBetweenLeftSquareAndItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "items": items.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenItemsAndRightSquare": garbageBetweenItemsAndRightSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightSquare": Syntax(rightSquare).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ClosureParamSyntax

public struct ClosureParamSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureParamSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureParam else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureParamSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureParam)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return ClosureParamSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ClosureParamSyntax(newData)
  }

  public var garbageBetweenNameAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenNameAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenNameAndTrailingComma`, if present.
  public func withGarbageBetweenNameAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndTrailingComma)
    return ClosureParamSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ClosureParamSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ClosureParamSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndTrailingComma": garbageBetweenNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureSignatureSyntax

public struct ClosureSignatureSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAttributes
    case attributes
    case garbageBetweenAttributesAndCapture
    case capture
    case garbageBetweenCaptureAndInput
    case input
    case garbageBetweenInputAndAsyncKeyword
    case asyncKeyword
    case garbageBetweenAsyncKeywordAndThrowsTok
    case throwsTok
    case garbageBetweenThrowsTokAndOutput
    case output
    case garbageBetweenOutputAndInTok
    case inTok
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureSignatureSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureSignature else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureSignatureSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureSignature)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAttributes: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAttributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAttributes(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAttributes` replaced.
  /// - param newChild: The new `garbageBeforeAttributes` to replace the node's
  ///                   current `garbageBeforeAttributes`, if present.
  public func withGarbageBeforeAttributes(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAttributes)
    return ClosureSignatureSyntax(newData)
  }

  public var attributes: AttributeListSyntax? {
    get {
      let childData = data.child(at: Cursor.attributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeListSyntax(childData!)
    }
    set(value) {
      self = withAttributes(value)
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ClosureSignatureSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.attributeList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.attributes)
    return ClosureSignatureSyntax(newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.attributes)
    return ClosureSignatureSyntax(newData)
  }

  public var garbageBetweenAttributesAndCapture: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAttributesAndCapture,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAttributesAndCapture(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAttributesAndCapture` replaced.
  /// - param newChild: The new `garbageBetweenAttributesAndCapture` to replace the node's
  ///                   current `garbageBetweenAttributesAndCapture`, if present.
  public func withGarbageBetweenAttributesAndCapture(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAttributesAndCapture)
    return ClosureSignatureSyntax(newData)
  }

  public var capture: ClosureCaptureSignatureSyntax? {
    get {
      let childData = data.child(at: Cursor.capture,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureCaptureSignatureSyntax(childData!)
    }
    set(value) {
      self = withCapture(value)
    }
  }

  /// Returns a copy of the receiver with its `capture` replaced.
  /// - param newChild: The new `capture` to replace the node's
  ///                   current `capture`, if present.
  public func withCapture(
    _ newChild: ClosureCaptureSignatureSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.capture)
    return ClosureSignatureSyntax(newData)
  }

  public var garbageBetweenCaptureAndInput: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCaptureAndInput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCaptureAndInput(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCaptureAndInput` replaced.
  /// - param newChild: The new `garbageBetweenCaptureAndInput` to replace the node's
  ///                   current `garbageBetweenCaptureAndInput`, if present.
  public func withGarbageBetweenCaptureAndInput(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCaptureAndInput)
    return ClosureSignatureSyntax(newData)
  }

  public var input: Syntax? {
    get {
      let childData = data.child(at: Cursor.input,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withInput(value)
    }
  }

  /// Returns a copy of the receiver with its `input` replaced.
  /// - param newChild: The new `input` to replace the node's
  ///                   current `input`, if present.
  public func withInput(
    _ newChild: Syntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.input)
    return ClosureSignatureSyntax(newData)
  }

  public var garbageBetweenInputAndAsyncKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenInputAndAsyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenInputAndAsyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenInputAndAsyncKeyword` replaced.
  /// - param newChild: The new `garbageBetweenInputAndAsyncKeyword` to replace the node's
  ///                   current `garbageBetweenInputAndAsyncKeyword`, if present.
  public func withGarbageBetweenInputAndAsyncKeyword(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenInputAndAsyncKeyword)
    return ClosureSignatureSyntax(newData)
  }

  public var asyncKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.asyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `asyncKeyword` replaced.
  /// - param newChild: The new `asyncKeyword` to replace the node's
  ///                   current `asyncKeyword`, if present.
  public func withAsyncKeyword(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.asyncKeyword)
    return ClosureSignatureSyntax(newData)
  }

  public var garbageBetweenAsyncKeywordAndThrowsTok: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAsyncKeywordAndThrowsTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAsyncKeywordAndThrowsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAsyncKeywordAndThrowsTok` replaced.
  /// - param newChild: The new `garbageBetweenAsyncKeywordAndThrowsTok` to replace the node's
  ///                   current `garbageBetweenAsyncKeywordAndThrowsTok`, if present.
  public func withGarbageBetweenAsyncKeywordAndThrowsTok(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAsyncKeywordAndThrowsTok)
    return ClosureSignatureSyntax(newData)
  }

  public var throwsTok: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.throwsTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withThrowsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `throwsTok` replaced.
  /// - param newChild: The new `throwsTok` to replace the node's
  ///                   current `throwsTok`, if present.
  public func withThrowsTok(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.throwsTok)
    return ClosureSignatureSyntax(newData)
  }

  public var garbageBetweenThrowsTokAndOutput: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenThrowsTokAndOutput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenThrowsTokAndOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenThrowsTokAndOutput` replaced.
  /// - param newChild: The new `garbageBetweenThrowsTokAndOutput` to replace the node's
  ///                   current `garbageBetweenThrowsTokAndOutput`, if present.
  public func withGarbageBetweenThrowsTokAndOutput(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenThrowsTokAndOutput)
    return ClosureSignatureSyntax(newData)
  }

  public var output: ReturnClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.output,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ReturnClauseSyntax(childData!)
    }
    set(value) {
      self = withOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `output` replaced.
  /// - param newChild: The new `output` to replace the node's
  ///                   current `output`, if present.
  public func withOutput(
    _ newChild: ReturnClauseSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.output)
    return ClosureSignatureSyntax(newData)
  }

  public var garbageBetweenOutputAndInTok: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenOutputAndInTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenOutputAndInTok(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenOutputAndInTok` replaced.
  /// - param newChild: The new `garbageBetweenOutputAndInTok` to replace the node's
  ///                   current `garbageBetweenOutputAndInTok`, if present.
  public func withGarbageBetweenOutputAndInTok(
    _ newChild: GarbageNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenOutputAndInTok)
    return ClosureSignatureSyntax(newData)
  }

  public var inTok: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.inTok,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withInTok(value)
    }
  }

  /// Returns a copy of the receiver with its `inTok` replaced.
  /// - param newChild: The new `inTok` to replace the node's
  ///                   current `inTok`, if present.
  public func withInTok(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.inKeyword)
    let newData = data.replacingChild(raw, at: Cursor.inTok)
    return ClosureSignatureSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 14)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is AttributeListSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AttributeListSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ClosureCaptureSignatureSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ClosureCaptureSignatureSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is ReturnClauseSyntax or missing
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ReturnClauseSyntax.self))
    }
    // Check child #12 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[12].raw {
      let info = rawChildren[12].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #13 child is TokenSyntax 
    assert(rawChildren[13].raw != nil)
    if let raw = rawChildren[13].raw {
      let info = rawChildren[13].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ClosureSignatureSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAttributes": garbageBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAttributesAndCapture": garbageBetweenAttributesAndCapture.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "capture": capture.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenCaptureAndInput": garbageBetweenCaptureAndInput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "input": input.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenInputAndAsyncKeyword": garbageBetweenInputAndAsyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asyncKeyword": asyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAsyncKeywordAndThrowsTok": garbageBetweenAsyncKeywordAndThrowsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "throwsTok": throwsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenThrowsTokAndOutput": garbageBetweenThrowsTokAndOutput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "output": output.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenOutputAndInTok": garbageBetweenOutputAndInTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inTok": Syntax(inTok).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MultipleTrailingClosureElementSyntax

public struct MultipleTrailingClosureElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabel
    case label
    case garbageBetweenLabelAndColon
    case colon
    case garbageBetweenColonAndClosure
    case closure
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MultipleTrailingClosureElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .multipleTrailingClosureElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MultipleTrailingClosureElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .multipleTrailingClosureElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeLabel` to replace the node's
  ///                   current `garbageBeforeLabel`, if present.
  public func withGarbageBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabel)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.label)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var garbageBetweenLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndColon` to replace the node's
  ///                   current `garbageBetweenLabelAndColon`, if present.
  public func withGarbageBetweenLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndColon)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var garbageBetweenColonAndClosure: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndClosure,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndClosure` replaced.
  /// - param newChild: The new `garbageBetweenColonAndClosure` to replace the node's
  ///                   current `garbageBetweenColonAndClosure`, if present.
  public func withGarbageBetweenColonAndClosure(
    _ newChild: GarbageNodesSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndClosure)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var closure: ClosureExprSyntax {
    get {
      let childData = data.child(at: Cursor.closure,
                                 parent: Syntax(self))
      return ClosureExprSyntax(childData!)
    }
    set(value) {
      self = withClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `closure` replaced.
  /// - param newChild: The new `closure` to replace the node's
  ///                   current `closure`, if present.
  public func withClosure(
    _ newChild: ClosureExprSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.closureExpr)
    let newData = data.replacingChild(raw, at: Cursor.closure)
    return MultipleTrailingClosureElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is ClosureExprSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ClosureExprSyntax.self))
    }
  }
}

extension MultipleTrailingClosureElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabel": garbageBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLabelAndColon": garbageBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndClosure": garbageBetweenColonAndClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "closure": Syntax(closure).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - StringSegmentSyntax

public struct StringSegmentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeContent
    case content
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `StringSegmentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .stringSegment else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `StringSegmentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .stringSegment)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeContent: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeContent,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeContent(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeContent` replaced.
  /// - param newChild: The new `garbageBeforeContent` to replace the node's
  ///                   current `garbageBeforeContent`, if present.
  public func withGarbageBeforeContent(
    _ newChild: GarbageNodesSyntax?) -> StringSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeContent)
    return StringSegmentSyntax(newData)
  }

  public var content: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.content,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withContent(value)
    }
  }

  /// Returns a copy of the receiver with its `content` replaced.
  /// - param newChild: The new `content` to replace the node's
  ///                   current `content`, if present.
  public func withContent(
    _ newChild: TokenSyntax?) -> StringSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.stringSegment(""))
    let newData = data.replacingChild(raw, at: Cursor.content)
    return StringSegmentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 2)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension StringSegmentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeContent": garbageBeforeContent.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "content": Syntax(content).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ExpressionSegmentSyntax

public struct ExpressionSegmentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeBackslash
    case backslash
    case garbageBetweenBackslashAndDelimiter
    case delimiter
    case garbageBetweenDelimiterAndLeftParen
    case leftParen
    case garbageBetweenLeftParenAndExpressions
    case expressions
    case garbageBetweenExpressionsAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ExpressionSegmentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .expressionSegment else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ExpressionSegmentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .expressionSegment)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeBackslash: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeBackslash,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeBackslash(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeBackslash` replaced.
  /// - param newChild: The new `garbageBeforeBackslash` to replace the node's
  ///                   current `garbageBeforeBackslash`, if present.
  public func withGarbageBeforeBackslash(
    _ newChild: GarbageNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeBackslash)
    return ExpressionSegmentSyntax(newData)
  }

  public var backslash: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.backslash,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withBackslash(value)
    }
  }

  /// Returns a copy of the receiver with its `backslash` replaced.
  /// - param newChild: The new `backslash` to replace the node's
  ///                   current `backslash`, if present.
  public func withBackslash(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.backslash)
    let newData = data.replacingChild(raw, at: Cursor.backslash)
    return ExpressionSegmentSyntax(newData)
  }

  public var garbageBetweenBackslashAndDelimiter: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenBackslashAndDelimiter,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenBackslashAndDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenBackslashAndDelimiter` replaced.
  /// - param newChild: The new `garbageBetweenBackslashAndDelimiter` to replace the node's
  ///                   current `garbageBetweenBackslashAndDelimiter`, if present.
  public func withGarbageBetweenBackslashAndDelimiter(
    _ newChild: GarbageNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenBackslashAndDelimiter)
    return ExpressionSegmentSyntax(newData)
  }

  public var delimiter: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.delimiter,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `delimiter` replaced.
  /// - param newChild: The new `delimiter` to replace the node's
  ///                   current `delimiter`, if present.
  public func withDelimiter(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.delimiter)
    return ExpressionSegmentSyntax(newData)
  }

  public var garbageBetweenDelimiterAndLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDelimiterAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDelimiterAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDelimiterAndLeftParen` replaced.
  /// - param newChild: The new `garbageBetweenDelimiterAndLeftParen` to replace the node's
  ///                   current `garbageBetweenDelimiterAndLeftParen`, if present.
  public func withGarbageBetweenDelimiterAndLeftParen(
    _ newChild: GarbageNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDelimiterAndLeftParen)
    return ExpressionSegmentSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return ExpressionSegmentSyntax(newData)
  }

  public var garbageBetweenLeftParenAndExpressions: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndExpressions,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndExpressions(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndExpressions` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndExpressions` to replace the node's
  ///                   current `garbageBetweenLeftParenAndExpressions`, if present.
  public func withGarbageBetweenLeftParenAndExpressions(
    _ newChild: GarbageNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndExpressions)
    return ExpressionSegmentSyntax(newData)
  }

  public var expressions: TupleExprElementListSyntax {
    get {
      let childData = data.child(at: Cursor.expressions,
                                 parent: Syntax(self))
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withExpressions(value)
    }
  }

  /// Adds the provided `Expression` to the node's `expressions`
  /// collection.
  /// - param element: The new `Expression` to add to the node's
  ///                  `expressions` collection.
  /// - returns: A copy of the receiver with the provided `Expression`
  ///            appended to its `expressions` collection.
  public func addExpression(_ element: TupleExprElementSyntax) -> ExpressionSegmentSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.expressions] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.tupleExprElementList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.expressions)
    return ExpressionSegmentSyntax(newData)
  }

  /// Returns a copy of the receiver with its `expressions` replaced.
  /// - param newChild: The new `expressions` to replace the node's
  ///                   current `expressions`, if present.
  public func withExpressions(
    _ newChild: TupleExprElementListSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.tupleExprElementList)
    let newData = data.replacingChild(raw, at: Cursor.expressions)
    return ExpressionSegmentSyntax(newData)
  }

  public var garbageBetweenExpressionsAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenExpressionsAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenExpressionsAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenExpressionsAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenExpressionsAndRightParen` to replace the node's
  ///                   current `garbageBetweenExpressionsAndRightParen`, if present.
  public func withGarbageBetweenExpressionsAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenExpressionsAndRightParen)
    return ExpressionSegmentSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.stringInterpolationAnchor)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return ExpressionSegmentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 10)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TupleExprElementListSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TupleExprElementListSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax 
    assert(rawChildren[9].raw != nil)
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ExpressionSegmentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeBackslash": garbageBeforeBackslash.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "backslash": Syntax(backslash).asProtocol(SyntaxProtocol.self),
      "garbageBetweenBackslashAndDelimiter": garbageBetweenBackslashAndDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "delimiter": delimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDelimiterAndLeftParen": garbageBetweenDelimiterAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndExpressions": garbageBetweenLeftParenAndExpressions.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expressions": Syntax(expressions).asProtocol(SyntaxProtocol.self),
      "garbageBetweenExpressionsAndRightParen": garbageBetweenExpressionsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ObjcNamePieceSyntax

public struct ObjcNamePieceSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndDot
    case dot
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ObjcNamePieceSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .objcNamePiece else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ObjcNamePieceSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .objcNamePiece)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return ObjcNamePieceSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ObjcNamePieceSyntax(newData)
  }

  public var garbageBetweenNameAndDot: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndDot(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndDot` replaced.
  /// - param newChild: The new `garbageBetweenNameAndDot` to replace the node's
  ///                   current `garbageBetweenNameAndDot`, if present.
  public func withGarbageBetweenNameAndDot(
    _ newChild: GarbageNodesSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndDot)
    return ObjcNamePieceSyntax(newData)
  }

  public var dot: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.dot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDot(value)
    }
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.dot)
    return ObjcNamePieceSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ObjcNamePieceSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndDot": garbageBetweenNameAndDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "dot": dot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TypeInitializerClauseSyntax

public struct TypeInitializerClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeEqual
    case equal
    case garbageBetweenEqualAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TypeInitializerClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .typeInitializerClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TypeInitializerClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeInitializerClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeEqual: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeEqual,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeEqual` replaced.
  /// - param newChild: The new `garbageBeforeEqual` to replace the node's
  ///                   current `garbageBeforeEqual`, if present.
  public func withGarbageBeforeEqual(
    _ newChild: GarbageNodesSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeEqual)
    return TypeInitializerClauseSyntax(newData)
  }

  public var equal: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.equal,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `equal` replaced.
  /// - param newChild: The new `equal` to replace the node's
  ///                   current `equal`, if present.
  public func withEqual(
    _ newChild: TokenSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.equal)
    let newData = data.replacingChild(raw, at: Cursor.equal)
    return TypeInitializerClauseSyntax(newData)
  }

  public var garbageBetweenEqualAndValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenEqualAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenEqualAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenEqualAndValue` replaced.
  /// - param newChild: The new `garbageBetweenEqualAndValue` to replace the node's
  ///                   current `garbageBetweenEqualAndValue`, if present.
  public func withGarbageBetweenEqualAndValue(
    _ newChild: GarbageNodesSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenEqualAndValue)
    return TypeInitializerClauseSyntax(newData)
  }

  public var value: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TypeSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return TypeInitializerClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TypeSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
  }
}

extension TypeInitializerClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeEqual": garbageBeforeEqual.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "equal": Syntax(equal).asProtocol(SyntaxProtocol.self),
      "garbageBetweenEqualAndValue": garbageBetweenEqualAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ParameterClauseSyntax

public struct ParameterClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftParen
    case leftParen
    case garbageBetweenLeftParenAndParameterList
    case parameterList
    case garbageBetweenParameterListAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ParameterClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .parameterClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ParameterClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .parameterClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftParen` replaced.
  /// - param newChild: The new `garbageBeforeLeftParen` to replace the node's
  ///                   current `garbageBeforeLeftParen`, if present.
  public func withGarbageBeforeLeftParen(
    _ newChild: GarbageNodesSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftParen)
    return ParameterClauseSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return ParameterClauseSyntax(newData)
  }

  public var garbageBetweenLeftParenAndParameterList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndParameterList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndParameterList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndParameterList` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndParameterList` to replace the node's
  ///                   current `garbageBetweenLeftParenAndParameterList`, if present.
  public func withGarbageBetweenLeftParenAndParameterList(
    _ newChild: GarbageNodesSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndParameterList)
    return ParameterClauseSyntax(newData)
  }

  public var parameterList: FunctionParameterListSyntax {
    get {
      let childData = data.child(at: Cursor.parameterList,
                                 parent: Syntax(self))
      return FunctionParameterListSyntax(childData!)
    }
    set(value) {
      self = withParameterList(value)
    }
  }

  /// Adds the provided `Parameter` to the node's `parameterList`
  /// collection.
  /// - param element: The new `Parameter` to add to the node's
  ///                  `parameterList` collection.
  /// - returns: A copy of the receiver with the provided `Parameter`
  ///            appended to its `parameterList` collection.
  public func addParameter(_ element: FunctionParameterSyntax) -> ParameterClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.parameterList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.functionParameterList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.parameterList)
    return ParameterClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `parameterList` replaced.
  /// - param newChild: The new `parameterList` to replace the node's
  ///                   current `parameterList`, if present.
  public func withParameterList(
    _ newChild: FunctionParameterListSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.functionParameterList)
    let newData = data.replacingChild(raw, at: Cursor.parameterList)
    return ParameterClauseSyntax(newData)
  }

  public var garbageBetweenParameterListAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenParameterListAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenParameterListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenParameterListAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenParameterListAndRightParen` to replace the node's
  ///                   current `garbageBetweenParameterListAndRightParen`, if present.
  public func withGarbageBetweenParameterListAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenParameterListAndRightParen)
    return ParameterClauseSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return ParameterClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is FunctionParameterListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(FunctionParameterListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ParameterClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftParen": garbageBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndParameterList": garbageBetweenLeftParenAndParameterList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameterList": Syntax(parameterList).asProtocol(SyntaxProtocol.self),
      "garbageBetweenParameterListAndRightParen": garbageBetweenParameterListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ReturnClauseSyntax

public struct ReturnClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeArrow
    case arrow
    case garbageBetweenArrowAndReturnType
    case returnType
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ReturnClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .returnClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ReturnClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .returnClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeArrow: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeArrow,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeArrow(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeArrow` replaced.
  /// - param newChild: The new `garbageBeforeArrow` to replace the node's
  ///                   current `garbageBeforeArrow`, if present.
  public func withGarbageBeforeArrow(
    _ newChild: GarbageNodesSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeArrow)
    return ReturnClauseSyntax(newData)
  }

  public var arrow: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.arrow,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withArrow(value)
    }
  }

  /// Returns a copy of the receiver with its `arrow` replaced.
  /// - param newChild: The new `arrow` to replace the node's
  ///                   current `arrow`, if present.
  public func withArrow(
    _ newChild: TokenSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.arrow)
    let newData = data.replacingChild(raw, at: Cursor.arrow)
    return ReturnClauseSyntax(newData)
  }

  public var garbageBetweenArrowAndReturnType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenArrowAndReturnType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenArrowAndReturnType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenArrowAndReturnType` replaced.
  /// - param newChild: The new `garbageBetweenArrowAndReturnType` to replace the node's
  ///                   current `garbageBetweenArrowAndReturnType`, if present.
  public func withGarbageBetweenArrowAndReturnType(
    _ newChild: GarbageNodesSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenArrowAndReturnType)
    return ReturnClauseSyntax(newData)
  }

  public var returnType: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.returnType,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withReturnType(value)
    }
  }

  /// Returns a copy of the receiver with its `returnType` replaced.
  /// - param newChild: The new `returnType` to replace the node's
  ///                   current `returnType`, if present.
  public func withReturnType(
    _ newChild: TypeSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.returnType)
    return ReturnClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TypeSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
  }
}

extension ReturnClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeArrow": garbageBeforeArrow.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arrow": Syntax(arrow).asProtocol(SyntaxProtocol.self),
      "garbageBetweenArrowAndReturnType": garbageBetweenArrowAndReturnType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "returnType": Syntax(returnType).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - FunctionSignatureSyntax

public struct FunctionSignatureSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeInput
    case input
    case garbageBetweenInputAndAsyncOrReasyncKeyword
    case asyncOrReasyncKeyword
    case garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword
    case throwsOrRethrowsKeyword
    case garbageBetweenThrowsOrRethrowsKeywordAndOutput
    case output
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionSignatureSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionSignature else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `FunctionSignatureSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionSignature)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeInput: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeInput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeInput(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeInput` replaced.
  /// - param newChild: The new `garbageBeforeInput` to replace the node's
  ///                   current `garbageBeforeInput`, if present.
  public func withGarbageBeforeInput(
    _ newChild: GarbageNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeInput)
    return FunctionSignatureSyntax(newData)
  }

  public var input: ParameterClauseSyntax {
    get {
      let childData = data.child(at: Cursor.input,
                                 parent: Syntax(self))
      return ParameterClauseSyntax(childData!)
    }
    set(value) {
      self = withInput(value)
    }
  }

  /// Returns a copy of the receiver with its `input` replaced.
  /// - param newChild: The new `input` to replace the node's
  ///                   current `input`, if present.
  public func withInput(
    _ newChild: ParameterClauseSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.parameterClause)
    let newData = data.replacingChild(raw, at: Cursor.input)
    return FunctionSignatureSyntax(newData)
  }

  public var garbageBetweenInputAndAsyncOrReasyncKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenInputAndAsyncOrReasyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenInputAndAsyncOrReasyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenInputAndAsyncOrReasyncKeyword` replaced.
  /// - param newChild: The new `garbageBetweenInputAndAsyncOrReasyncKeyword` to replace the node's
  ///                   current `garbageBetweenInputAndAsyncOrReasyncKeyword`, if present.
  public func withGarbageBetweenInputAndAsyncOrReasyncKeyword(
    _ newChild: GarbageNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenInputAndAsyncOrReasyncKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var asyncOrReasyncKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.asyncOrReasyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsyncOrReasyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `asyncOrReasyncKeyword` replaced.
  /// - param newChild: The new `asyncOrReasyncKeyword` to replace the node's
  ///                   current `asyncOrReasyncKeyword`, if present.
  public func withAsyncOrReasyncKeyword(
    _ newChild: TokenSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.asyncOrReasyncKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword` to replace the node's
  ///                   current `garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword`, if present.
  public func withGarbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword(
    _ newChild: GarbageNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var throwsOrRethrowsKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.throwsOrRethrowsKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withThrowsOrRethrowsKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `throwsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `throwsOrRethrowsKeyword` to replace the node's
  ///                   current `throwsOrRethrowsKeyword`, if present.
  public func withThrowsOrRethrowsKeyword(
    _ newChild: TokenSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.throwsOrRethrowsKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var garbageBetweenThrowsOrRethrowsKeywordAndOutput: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenThrowsOrRethrowsKeywordAndOutput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenThrowsOrRethrowsKeywordAndOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenThrowsOrRethrowsKeywordAndOutput` replaced.
  /// - param newChild: The new `garbageBetweenThrowsOrRethrowsKeywordAndOutput` to replace the node's
  ///                   current `garbageBetweenThrowsOrRethrowsKeywordAndOutput`, if present.
  public func withGarbageBetweenThrowsOrRethrowsKeywordAndOutput(
    _ newChild: GarbageNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenThrowsOrRethrowsKeywordAndOutput)
    return FunctionSignatureSyntax(newData)
  }

  public var output: ReturnClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.output,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ReturnClauseSyntax(childData!)
    }
    set(value) {
      self = withOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `output` replaced.
  /// - param newChild: The new `output` to replace the node's
  ///                   current `output`, if present.
  public func withOutput(
    _ newChild: ReturnClauseSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.output)
    return FunctionSignatureSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is ParameterClauseSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ParameterClauseSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is ReturnClauseSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ReturnClauseSyntax.self))
    }
  }
}

extension FunctionSignatureSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeInput": garbageBeforeInput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "input": Syntax(input).asProtocol(SyntaxProtocol.self),
      "garbageBetweenInputAndAsyncOrReasyncKeyword": garbageBetweenInputAndAsyncOrReasyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asyncOrReasyncKeyword": asyncOrReasyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword": garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "throwsOrRethrowsKeyword": throwsOrRethrowsKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenThrowsOrRethrowsKeywordAndOutput": garbageBetweenThrowsOrRethrowsKeywordAndOutput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "output": output.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IfConfigClauseSyntax

public struct IfConfigClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePoundKeyword
    case poundKeyword
    case garbageBetweenPoundKeywordAndCondition
    case condition
    case garbageBetweenConditionAndElements
    case elements
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `IfConfigClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .ifConfigClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `IfConfigClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .ifConfigClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePoundKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePoundKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePoundKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePoundKeyword` replaced.
  /// - param newChild: The new `garbageBeforePoundKeyword` to replace the node's
  ///                   current `garbageBeforePoundKeyword`, if present.
  public func withGarbageBeforePoundKeyword(
    _ newChild: GarbageNodesSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePoundKeyword)
    return IfConfigClauseSyntax(newData)
  }

  public var poundKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.poundKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `poundKeyword` replaced.
  /// - param newChild: The new `poundKeyword` to replace the node's
  ///                   current `poundKeyword`, if present.
  public func withPoundKeyword(
    _ newChild: TokenSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.poundIfKeyword)
    let newData = data.replacingChild(raw, at: Cursor.poundKeyword)
    return IfConfigClauseSyntax(newData)
  }

  public var garbageBetweenPoundKeywordAndCondition: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPoundKeywordAndCondition,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPoundKeywordAndCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPoundKeywordAndCondition` replaced.
  /// - param newChild: The new `garbageBetweenPoundKeywordAndCondition` to replace the node's
  ///                   current `garbageBetweenPoundKeywordAndCondition`, if present.
  public func withGarbageBetweenPoundKeywordAndCondition(
    _ newChild: GarbageNodesSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPoundKeywordAndCondition)
    return IfConfigClauseSyntax(newData)
  }

  public var condition: ExprSyntax? {
    get {
      let childData = data.child(at: Cursor.condition,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: ExprSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.condition)
    return IfConfigClauseSyntax(newData)
  }

  public var garbageBetweenConditionAndElements: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenConditionAndElements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenConditionAndElements(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenConditionAndElements` replaced.
  /// - param newChild: The new `garbageBetweenConditionAndElements` to replace the node's
  ///                   current `garbageBetweenConditionAndElements`, if present.
  public func withGarbageBetweenConditionAndElements(
    _ newChild: GarbageNodesSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenConditionAndElements)
    return IfConfigClauseSyntax(newData)
  }

  public var elements: Syntax {
    get {
      let childData = data.child(at: Cursor.elements,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withElements(value)
    }
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: Syntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.elements)
    return IfConfigClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ExprSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
  }
}

extension IfConfigClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePoundKeyword": garbageBeforePoundKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundKeyword": Syntax(poundKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPoundKeywordAndCondition": garbageBetweenPoundKeywordAndCondition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "condition": condition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenConditionAndElements": garbageBetweenConditionAndElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PoundSourceLocationArgsSyntax

public struct PoundSourceLocationArgsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeFileArgLabel
    case fileArgLabel
    case garbageBetweenFileArgLabelAndFileArgColon
    case fileArgColon
    case garbageBetweenFileArgColonAndFileName
    case fileName
    case garbageBetweenFileNameAndComma
    case comma
    case garbageBetweenCommaAndLineArgLabel
    case lineArgLabel
    case garbageBetweenLineArgLabelAndLineArgColon
    case lineArgColon
    case garbageBetweenLineArgColonAndLineNumber
    case lineNumber
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PoundSourceLocationArgsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .poundSourceLocationArgs else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PoundSourceLocationArgsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .poundSourceLocationArgs)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeFileArgLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeFileArgLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeFileArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeFileArgLabel` replaced.
  /// - param newChild: The new `garbageBeforeFileArgLabel` to replace the node's
  ///                   current `garbageBeforeFileArgLabel`, if present.
  public func withGarbageBeforeFileArgLabel(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeFileArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var fileArgLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.fileArgLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFileArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `fileArgLabel` replaced.
  /// - param newChild: The new `fileArgLabel` to replace the node's
  ///                   current `fileArgLabel`, if present.
  public func withFileArgLabel(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.fileArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var garbageBetweenFileArgLabelAndFileArgColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenFileArgLabelAndFileArgColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenFileArgLabelAndFileArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenFileArgLabelAndFileArgColon` replaced.
  /// - param newChild: The new `garbageBetweenFileArgLabelAndFileArgColon` to replace the node's
  ///                   current `garbageBetweenFileArgLabelAndFileArgColon`, if present.
  public func withGarbageBetweenFileArgLabelAndFileArgColon(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenFileArgLabelAndFileArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var fileArgColon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.fileArgColon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFileArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `fileArgColon` replaced.
  /// - param newChild: The new `fileArgColon` to replace the node's
  ///                   current `fileArgColon`, if present.
  public func withFileArgColon(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.fileArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var garbageBetweenFileArgColonAndFileName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenFileArgColonAndFileName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenFileArgColonAndFileName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenFileArgColonAndFileName` replaced.
  /// - param newChild: The new `garbageBetweenFileArgColonAndFileName` to replace the node's
  ///                   current `garbageBetweenFileArgColonAndFileName`, if present.
  public func withGarbageBetweenFileArgColonAndFileName(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenFileArgColonAndFileName)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var fileName: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.fileName,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFileName(value)
    }
  }

  /// Returns a copy of the receiver with its `fileName` replaced.
  /// - param newChild: The new `fileName` to replace the node's
  ///                   current `fileName`, if present.
  public func withFileName(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.stringLiteral(""))
    let newData = data.replacingChild(raw, at: Cursor.fileName)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var garbageBetweenFileNameAndComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenFileNameAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenFileNameAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenFileNameAndComma` replaced.
  /// - param newChild: The new `garbageBetweenFileNameAndComma` to replace the node's
  ///                   current `garbageBetweenFileNameAndComma`, if present.
  public func withGarbageBetweenFileNameAndComma(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenFileNameAndComma)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var comma: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.comma)
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var garbageBetweenCommaAndLineArgLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCommaAndLineArgLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCommaAndLineArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCommaAndLineArgLabel` replaced.
  /// - param newChild: The new `garbageBetweenCommaAndLineArgLabel` to replace the node's
  ///                   current `garbageBetweenCommaAndLineArgLabel`, if present.
  public func withGarbageBetweenCommaAndLineArgLabel(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCommaAndLineArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var lineArgLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.lineArgLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLineArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `lineArgLabel` replaced.
  /// - param newChild: The new `lineArgLabel` to replace the node's
  ///                   current `lineArgLabel`, if present.
  public func withLineArgLabel(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.lineArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var garbageBetweenLineArgLabelAndLineArgColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLineArgLabelAndLineArgColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLineArgLabelAndLineArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLineArgLabelAndLineArgColon` replaced.
  /// - param newChild: The new `garbageBetweenLineArgLabelAndLineArgColon` to replace the node's
  ///                   current `garbageBetweenLineArgLabelAndLineArgColon`, if present.
  public func withGarbageBetweenLineArgLabelAndLineArgColon(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLineArgLabelAndLineArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var lineArgColon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.lineArgColon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLineArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `lineArgColon` replaced.
  /// - param newChild: The new `lineArgColon` to replace the node's
  ///                   current `lineArgColon`, if present.
  public func withLineArgColon(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.lineArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var garbageBetweenLineArgColonAndLineNumber: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLineArgColonAndLineNumber,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLineArgColonAndLineNumber(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLineArgColonAndLineNumber` replaced.
  /// - param newChild: The new `garbageBetweenLineArgColonAndLineNumber` to replace the node's
  ///                   current `garbageBetweenLineArgColonAndLineNumber`, if present.
  public func withGarbageBetweenLineArgColonAndLineNumber(
    _ newChild: GarbageNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLineArgColonAndLineNumber)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var lineNumber: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.lineNumber,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLineNumber(value)
    }
  }

  /// Returns a copy of the receiver with its `lineNumber` replaced.
  /// - param newChild: The new `lineNumber` to replace the node's
  ///                   current `lineNumber`, if present.
  public func withLineNumber(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.integerLiteral(""))
    let newData = data.replacingChild(raw, at: Cursor.lineNumber)
    return PoundSourceLocationArgsSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 14)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax 
    assert(rawChildren[9].raw != nil)
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is TokenSyntax 
    assert(rawChildren[11].raw != nil)
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #12 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[12].raw {
      let info = rawChildren[12].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #13 child is TokenSyntax 
    assert(rawChildren[13].raw != nil)
    if let raw = rawChildren[13].raw {
      let info = rawChildren[13].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PoundSourceLocationArgsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeFileArgLabel": garbageBeforeFileArgLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "fileArgLabel": Syntax(fileArgLabel).asProtocol(SyntaxProtocol.self),
      "garbageBetweenFileArgLabelAndFileArgColon": garbageBetweenFileArgLabelAndFileArgColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "fileArgColon": Syntax(fileArgColon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenFileArgColonAndFileName": garbageBetweenFileArgColonAndFileName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "fileName": Syntax(fileName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenFileNameAndComma": garbageBetweenFileNameAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": Syntax(comma).asProtocol(SyntaxProtocol.self),
      "garbageBetweenCommaAndLineArgLabel": garbageBetweenCommaAndLineArgLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "lineArgLabel": Syntax(lineArgLabel).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLineArgLabelAndLineArgColon": garbageBetweenLineArgLabelAndLineArgColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "lineArgColon": Syntax(lineArgColon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLineArgColonAndLineNumber": garbageBetweenLineArgColonAndLineNumber.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "lineNumber": Syntax(lineNumber).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclModifierDetailSyntax

public struct DeclModifierDetailSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftParen
    case leftParen
    case garbageBetweenLeftParenAndDetail
    case detail
    case garbageBetweenDetailAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclModifierDetailSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declModifierDetail else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclModifierDetailSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declModifierDetail)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftParen` replaced.
  /// - param newChild: The new `garbageBeforeLeftParen` to replace the node's
  ///                   current `garbageBeforeLeftParen`, if present.
  public func withGarbageBeforeLeftParen(
    _ newChild: GarbageNodesSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftParen)
    return DeclModifierDetailSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return DeclModifierDetailSyntax(newData)
  }

  public var garbageBetweenLeftParenAndDetail: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndDetail,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndDetail` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndDetail` to replace the node's
  ///                   current `garbageBetweenLeftParenAndDetail`, if present.
  public func withGarbageBetweenLeftParenAndDetail(
    _ newChild: GarbageNodesSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndDetail)
    return DeclModifierDetailSyntax(newData)
  }

  public var detail: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.detail,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `detail` replaced.
  /// - param newChild: The new `detail` to replace the node's
  ///                   current `detail`, if present.
  public func withDetail(
    _ newChild: TokenSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.detail)
    return DeclModifierDetailSyntax(newData)
  }

  public var garbageBetweenDetailAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDetailAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDetailAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDetailAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenDetailAndRightParen` to replace the node's
  ///                   current `garbageBetweenDetailAndRightParen`, if present.
  public func withGarbageBetweenDetailAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDetailAndRightParen)
    return DeclModifierDetailSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return DeclModifierDetailSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension DeclModifierDetailSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftParen": garbageBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndDetail": garbageBetweenLeftParenAndDetail.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "detail": Syntax(detail).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDetailAndRightParen": garbageBetweenDetailAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclModifierSyntax

public struct DeclModifierSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndDetail
    case detail
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclModifierSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declModifier else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclModifierSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declModifier)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return DeclModifierSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.unknown(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return DeclModifierSyntax(newData)
  }

  public var garbageBetweenNameAndDetail: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndDetail,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndDetail` replaced.
  /// - param newChild: The new `garbageBetweenNameAndDetail` to replace the node's
  ///                   current `garbageBetweenNameAndDetail`, if present.
  public func withGarbageBetweenNameAndDetail(
    _ newChild: GarbageNodesSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndDetail)
    return DeclModifierSyntax(newData)
  }

  public var detail: DeclModifierDetailSyntax? {
    get {
      let childData = data.child(at: Cursor.detail,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclModifierDetailSyntax(childData!)
    }
    set(value) {
      self = withDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `detail` replaced.
  /// - param newChild: The new `detail` to replace the node's
  ///                   current `detail`, if present.
  public func withDetail(
    _ newChild: DeclModifierDetailSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.detail)
    return DeclModifierSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is DeclModifierDetailSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclModifierDetailSyntax.self))
    }
  }
}

extension DeclModifierSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndDetail": garbageBetweenNameAndDetail.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "detail": detail.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - InheritedTypeSyntax

public struct InheritedTypeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeTypeName
    case typeName
    case garbageBetweenTypeNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `InheritedTypeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .inheritedType else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `InheritedTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .inheritedType)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeTypeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeTypeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeTypeName` replaced.
  /// - param newChild: The new `garbageBeforeTypeName` to replace the node's
  ///                   current `garbageBeforeTypeName`, if present.
  public func withGarbageBeforeTypeName(
    _ newChild: GarbageNodesSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeTypeName)
    return InheritedTypeSyntax(newData)
  }

  public var typeName: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.typeName,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(
    _ newChild: TypeSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.typeName)
    return InheritedTypeSyntax(newData)
  }

  public var garbageBetweenTypeNameAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeNameAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenTypeNameAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenTypeNameAndTrailingComma`, if present.
  public func withGarbageBetweenTypeNameAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeNameAndTrailingComma)
    return InheritedTypeSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return InheritedTypeSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension InheritedTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeTypeName": garbageBeforeTypeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeName": Syntax(typeName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenTypeNameAndTrailingComma": garbageBetweenTypeNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TypeInheritanceClauseSyntax

public struct TypeInheritanceClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeColon
    case colon
    case garbageBetweenColonAndInheritedTypeCollection
    case inheritedTypeCollection
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TypeInheritanceClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .typeInheritanceClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TypeInheritanceClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeInheritanceClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeColon` replaced.
  /// - param newChild: The new `garbageBeforeColon` to replace the node's
  ///                   current `garbageBeforeColon`, if present.
  public func withGarbageBeforeColon(
    _ newChild: GarbageNodesSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeColon)
    return TypeInheritanceClauseSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TypeInheritanceClauseSyntax(newData)
  }

  public var garbageBetweenColonAndInheritedTypeCollection: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndInheritedTypeCollection,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndInheritedTypeCollection(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndInheritedTypeCollection` replaced.
  /// - param newChild: The new `garbageBetweenColonAndInheritedTypeCollection` to replace the node's
  ///                   current `garbageBetweenColonAndInheritedTypeCollection`, if present.
  public func withGarbageBetweenColonAndInheritedTypeCollection(
    _ newChild: GarbageNodesSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndInheritedTypeCollection)
    return TypeInheritanceClauseSyntax(newData)
  }

  public var inheritedTypeCollection: InheritedTypeListSyntax {
    get {
      let childData = data.child(at: Cursor.inheritedTypeCollection,
                                 parent: Syntax(self))
      return InheritedTypeListSyntax(childData!)
    }
    set(value) {
      self = withInheritedTypeCollection(value)
    }
  }

  /// Adds the provided `InheritedType` to the node's `inheritedTypeCollection`
  /// collection.
  /// - param element: The new `InheritedType` to add to the node's
  ///                  `inheritedTypeCollection` collection.
  /// - returns: A copy of the receiver with the provided `InheritedType`
  ///            appended to its `inheritedTypeCollection` collection.
  public func addInheritedType(_ element: InheritedTypeSyntax) -> TypeInheritanceClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.inheritedTypeCollection] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.inheritedTypeList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.inheritedTypeCollection)
    return TypeInheritanceClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `inheritedTypeCollection` replaced.
  /// - param newChild: The new `inheritedTypeCollection` to replace the node's
  ///                   current `inheritedTypeCollection`, if present.
  public func withInheritedTypeCollection(
    _ newChild: InheritedTypeListSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.inheritedTypeList)
    let newData = data.replacingChild(raw, at: Cursor.inheritedTypeCollection)
    return TypeInheritanceClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is InheritedTypeListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InheritedTypeListSyntax.self))
    }
  }
}

extension TypeInheritanceClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeColon": garbageBeforeColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndInheritedTypeCollection": garbageBetweenColonAndInheritedTypeCollection.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritedTypeCollection": Syntax(inheritedTypeCollection).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MemberDeclBlockSyntax

public struct MemberDeclBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftBrace
    case leftBrace
    case garbageBetweenLeftBraceAndMembers
    case members
    case garbageBetweenMembersAndRightBrace
    case rightBrace
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MemberDeclBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .memberDeclBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MemberDeclBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberDeclBlock)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftBrace: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftBrace` replaced.
  /// - param newChild: The new `garbageBeforeLeftBrace` to replace the node's
  ///                   current `garbageBeforeLeftBrace`, if present.
  public func withGarbageBeforeLeftBrace(
    _ newChild: GarbageNodesSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftBrace)
    return MemberDeclBlockSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftBrace)
    let newData = data.replacingChild(raw, at: Cursor.leftBrace)
    return MemberDeclBlockSyntax(newData)
  }

  public var garbageBetweenLeftBraceAndMembers: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftBraceAndMembers,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftBraceAndMembers(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftBraceAndMembers` replaced.
  /// - param newChild: The new `garbageBetweenLeftBraceAndMembers` to replace the node's
  ///                   current `garbageBetweenLeftBraceAndMembers`, if present.
  public func withGarbageBetweenLeftBraceAndMembers(
    _ newChild: GarbageNodesSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftBraceAndMembers)
    return MemberDeclBlockSyntax(newData)
  }

  public var members: MemberDeclListSyntax {
    get {
      let childData = data.child(at: Cursor.members,
                                 parent: Syntax(self))
      return MemberDeclListSyntax(childData!)
    }
    set(value) {
      self = withMembers(value)
    }
  }

  /// Adds the provided `Member` to the node's `members`
  /// collection.
  /// - param element: The new `Member` to add to the node's
  ///                  `members` collection.
  /// - returns: A copy of the receiver with the provided `Member`
  ///            appended to its `members` collection.
  public func addMember(_ element: MemberDeclListItemSyntax) -> MemberDeclBlockSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.members] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.memberDeclList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.members)
    return MemberDeclBlockSyntax(newData)
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: MemberDeclListSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.memberDeclList)
    let newData = data.replacingChild(raw, at: Cursor.members)
    return MemberDeclBlockSyntax(newData)
  }

  public var garbageBetweenMembersAndRightBrace: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenMembersAndRightBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenMembersAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenMembersAndRightBrace` replaced.
  /// - param newChild: The new `garbageBetweenMembersAndRightBrace` to replace the node's
  ///                   current `garbageBetweenMembersAndRightBrace`, if present.
  public func withGarbageBetweenMembersAndRightBrace(
    _ newChild: GarbageNodesSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenMembersAndRightBrace)
    return MemberDeclBlockSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightBrace)
    let newData = data.replacingChild(raw, at: Cursor.rightBrace)
    return MemberDeclBlockSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is MemberDeclListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(MemberDeclListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension MemberDeclBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftBrace": garbageBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftBraceAndMembers": garbageBetweenLeftBraceAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "garbageBetweenMembersAndRightBrace": garbageBetweenMembersAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MemberDeclListItemSyntax

/// 
/// A member declaration of a type consisting of a declaration and an
/// optional semicolon;
/// 
public struct MemberDeclListItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeDecl
    case decl
    case garbageBetweenDeclAndSemicolon
    case semicolon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MemberDeclListItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .memberDeclListItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MemberDeclListItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberDeclListItem)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeDecl: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeDecl,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeDecl(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeDecl` replaced.
  /// - param newChild: The new `garbageBeforeDecl` to replace the node's
  ///                   current `garbageBeforeDecl`, if present.
  public func withGarbageBeforeDecl(
    _ newChild: GarbageNodesSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeDecl)
    return MemberDeclListItemSyntax(newData)
  }

  /// The declaration of the type member.
  public var decl: DeclSyntax {
    get {
      let childData = data.child(at: Cursor.decl,
                                 parent: Syntax(self))
      return DeclSyntax(childData!)
    }
    set(value) {
      self = withDecl(value)
    }
  }

  /// Returns a copy of the receiver with its `decl` replaced.
  /// - param newChild: The new `decl` to replace the node's
  ///                   current `decl`, if present.
  public func withDecl(
    _ newChild: DeclSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingDecl)
    let newData = data.replacingChild(raw, at: Cursor.decl)
    return MemberDeclListItemSyntax(newData)
  }

  public var garbageBetweenDeclAndSemicolon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDeclAndSemicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDeclAndSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDeclAndSemicolon` replaced.
  /// - param newChild: The new `garbageBetweenDeclAndSemicolon` to replace the node's
  ///                   current `garbageBetweenDeclAndSemicolon`, if present.
  public func withGarbageBetweenDeclAndSemicolon(
    _ newChild: GarbageNodesSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDeclAndSemicolon)
    return MemberDeclListItemSyntax(newData)
  }

  /// An optional trailing semicolon.
  public var semicolon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.semicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.semicolon)
    return MemberDeclListItemSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is DeclSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension MemberDeclListItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeDecl": garbageBeforeDecl.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "decl": Syntax(decl).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDeclAndSemicolon": garbageBetweenDeclAndSemicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "semicolon": semicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SourceFileSyntax

public struct SourceFileSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeStatements
    case statements
    case garbageBetweenStatementsAndEOFToken
    case eofToken
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SourceFileSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .sourceFile else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SourceFileSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .sourceFile)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeStatements: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeStatements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeStatements` replaced.
  /// - param newChild: The new `garbageBeforeStatements` to replace the node's
  ///                   current `garbageBeforeStatements`, if present.
  public func withGarbageBeforeStatements(
    _ newChild: GarbageNodesSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeStatements)
    return SourceFileSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: Cursor.statements,
                                 parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> SourceFileSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.codeBlockItemList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.statements)
    return SourceFileSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.codeBlockItemList)
    let newData = data.replacingChild(raw, at: Cursor.statements)
    return SourceFileSyntax(newData)
  }

  public var garbageBetweenStatementsAndEOFToken: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenStatementsAndEOFToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenStatementsAndEOFToken(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenStatementsAndEOFToken` replaced.
  /// - param newChild: The new `garbageBetweenStatementsAndEOFToken` to replace the node's
  ///                   current `garbageBetweenStatementsAndEOFToken`, if present.
  public func withGarbageBetweenStatementsAndEOFToken(
    _ newChild: GarbageNodesSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenStatementsAndEOFToken)
    return SourceFileSyntax(newData)
  }

  public var eofToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.eofToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEOFToken(value)
    }
  }

  /// Returns a copy of the receiver with its `eofToken` replaced.
  /// - param newChild: The new `eofToken` to replace the node's
  ///                   current `eofToken`, if present.
  public func withEOFToken(
    _ newChild: TokenSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.unknown(""))
    let newData = data.replacingChild(raw, at: Cursor.eofToken)
    return SourceFileSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is CodeBlockItemListSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CodeBlockItemListSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension SourceFileSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeStatements": garbageBeforeStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
      "garbageBetweenStatementsAndEOFToken": garbageBetweenStatementsAndEOFToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "eofToken": Syntax(eofToken).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - InitializerClauseSyntax

public struct InitializerClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeEqual
    case equal
    case garbageBetweenEqualAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `InitializerClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .initializerClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `InitializerClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .initializerClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeEqual: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeEqual,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeEqual` replaced.
  /// - param newChild: The new `garbageBeforeEqual` to replace the node's
  ///                   current `garbageBeforeEqual`, if present.
  public func withGarbageBeforeEqual(
    _ newChild: GarbageNodesSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeEqual)
    return InitializerClauseSyntax(newData)
  }

  public var equal: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.equal,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `equal` replaced.
  /// - param newChild: The new `equal` to replace the node's
  ///                   current `equal`, if present.
  public func withEqual(
    _ newChild: TokenSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.equal)
    let newData = data.replacingChild(raw, at: Cursor.equal)
    return InitializerClauseSyntax(newData)
  }

  public var garbageBetweenEqualAndValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenEqualAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenEqualAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenEqualAndValue` replaced.
  /// - param newChild: The new `garbageBetweenEqualAndValue` to replace the node's
  ///                   current `garbageBetweenEqualAndValue`, if present.
  public func withGarbageBetweenEqualAndValue(
    _ newChild: GarbageNodesSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenEqualAndValue)
    return InitializerClauseSyntax(newData)
  }

  public var value: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: ExprSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return InitializerClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ExprSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
  }
}

extension InitializerClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeEqual": garbageBeforeEqual.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "equal": Syntax(equal).asProtocol(SyntaxProtocol.self),
      "garbageBetweenEqualAndValue": garbageBetweenEqualAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - FunctionParameterSyntax

public struct FunctionParameterSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAttributes
    case attributes
    case garbageBetweenAttributesAndFirstName
    case firstName
    case garbageBetweenFirstNameAndSecondName
    case secondName
    case garbageBetweenSecondNameAndColon
    case colon
    case garbageBetweenColonAndType
    case type
    case garbageBetweenTypeAndEllipsis
    case ellipsis
    case garbageBetweenEllipsisAndDefaultArgument
    case defaultArgument
    case garbageBetweenDefaultArgumentAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionParameterSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionParameter else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `FunctionParameterSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionParameter)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAttributes: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAttributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAttributes(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAttributes` replaced.
  /// - param newChild: The new `garbageBeforeAttributes` to replace the node's
  ///                   current `garbageBeforeAttributes`, if present.
  public func withGarbageBeforeAttributes(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAttributes)
    return FunctionParameterSyntax(newData)
  }

  public var attributes: AttributeListSyntax? {
    get {
      let childData = data.child(at: Cursor.attributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeListSyntax(childData!)
    }
    set(value) {
      self = withAttributes(value)
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> FunctionParameterSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.attributeList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.attributes)
    return FunctionParameterSyntax(newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.attributes)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenAttributesAndFirstName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAttributesAndFirstName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAttributesAndFirstName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAttributesAndFirstName` replaced.
  /// - param newChild: The new `garbageBetweenAttributesAndFirstName` to replace the node's
  ///                   current `garbageBetweenAttributesAndFirstName`, if present.
  public func withGarbageBetweenAttributesAndFirstName(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAttributesAndFirstName)
    return FunctionParameterSyntax(newData)
  }

  public var firstName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.firstName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFirstName(value)
    }
  }

  /// Returns a copy of the receiver with its `firstName` replaced.
  /// - param newChild: The new `firstName` to replace the node's
  ///                   current `firstName`, if present.
  public func withFirstName(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.firstName)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenFirstNameAndSecondName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenFirstNameAndSecondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenFirstNameAndSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenFirstNameAndSecondName` replaced.
  /// - param newChild: The new `garbageBetweenFirstNameAndSecondName` to replace the node's
  ///                   current `garbageBetweenFirstNameAndSecondName`, if present.
  public func withGarbageBetweenFirstNameAndSecondName(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenFirstNameAndSecondName)
    return FunctionParameterSyntax(newData)
  }

  public var secondName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.secondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `secondName` replaced.
  /// - param newChild: The new `secondName` to replace the node's
  ///                   current `secondName`, if present.
  public func withSecondName(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.secondName)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenSecondNameAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenSecondNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenSecondNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenSecondNameAndColon` replaced.
  /// - param newChild: The new `garbageBetweenSecondNameAndColon` to replace the node's
  ///                   current `garbageBetweenSecondNameAndColon`, if present.
  public func withGarbageBetweenSecondNameAndColon(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenSecondNameAndColon)
    return FunctionParameterSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenColonAndType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndType` replaced.
  /// - param newChild: The new `garbageBetweenColonAndType` to replace the node's
  ///                   current `garbageBetweenColonAndType`, if present.
  public func withGarbageBetweenColonAndType(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndType)
    return FunctionParameterSyntax(newData)
  }

  public var type: TypeSyntax? {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.type)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenTypeAndEllipsis: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAndEllipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAndEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAndEllipsis` replaced.
  /// - param newChild: The new `garbageBetweenTypeAndEllipsis` to replace the node's
  ///                   current `garbageBetweenTypeAndEllipsis`, if present.
  public func withGarbageBetweenTypeAndEllipsis(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAndEllipsis)
    return FunctionParameterSyntax(newData)
  }

  public var ellipsis: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.ellipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `ellipsis` replaced.
  /// - param newChild: The new `ellipsis` to replace the node's
  ///                   current `ellipsis`, if present.
  public func withEllipsis(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.ellipsis)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenEllipsisAndDefaultArgument: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenEllipsisAndDefaultArgument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenEllipsisAndDefaultArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenEllipsisAndDefaultArgument` replaced.
  /// - param newChild: The new `garbageBetweenEllipsisAndDefaultArgument` to replace the node's
  ///                   current `garbageBetweenEllipsisAndDefaultArgument`, if present.
  public func withGarbageBetweenEllipsisAndDefaultArgument(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenEllipsisAndDefaultArgument)
    return FunctionParameterSyntax(newData)
  }

  public var defaultArgument: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.defaultArgument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withDefaultArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `defaultArgument` replaced.
  /// - param newChild: The new `defaultArgument` to replace the node's
  ///                   current `defaultArgument`, if present.
  public func withDefaultArgument(
    _ newChild: InitializerClauseSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.defaultArgument)
    return FunctionParameterSyntax(newData)
  }

  public var garbageBetweenDefaultArgumentAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDefaultArgumentAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDefaultArgumentAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDefaultArgumentAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenDefaultArgumentAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenDefaultArgumentAndTrailingComma`, if present.
  public func withGarbageBetweenDefaultArgumentAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDefaultArgumentAndTrailingComma)
    return FunctionParameterSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return FunctionParameterSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 16)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is AttributeListSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AttributeListSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TypeSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is TokenSyntax or missing
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #12 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[12].raw {
      let info = rawChildren[12].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #13 child is InitializerClauseSyntax or missing
    if let raw = rawChildren[13].raw {
      let info = rawChildren[13].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InitializerClauseSyntax.self))
    }
    // Check child #14 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[14].raw {
      let info = rawChildren[14].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #15 child is TokenSyntax or missing
    if let raw = rawChildren[15].raw {
      let info = rawChildren[15].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension FunctionParameterSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAttributes": garbageBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAttributesAndFirstName": garbageBetweenAttributesAndFirstName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "firstName": firstName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenFirstNameAndSecondName": garbageBetweenFirstNameAndSecondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "secondName": secondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenSecondNameAndColon": garbageBetweenSecondNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenColonAndType": garbageBetweenColonAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": type.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenTypeAndEllipsis": garbageBetweenTypeAndEllipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ellipsis": ellipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenEllipsisAndDefaultArgument": garbageBetweenEllipsisAndDefaultArgument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "defaultArgument": defaultArgument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDefaultArgumentAndTrailingComma": garbageBetweenDefaultArgumentAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessLevelModifierSyntax

public struct AccessLevelModifierSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndModifier
    case modifier
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessLevelModifierSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessLevelModifier else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessLevelModifierSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessLevelModifier)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return AccessLevelModifierSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return AccessLevelModifierSyntax(newData)
  }

  public var garbageBetweenNameAndModifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndModifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndModifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndModifier` replaced.
  /// - param newChild: The new `garbageBetweenNameAndModifier` to replace the node's
  ///                   current `garbageBetweenNameAndModifier`, if present.
  public func withGarbageBetweenNameAndModifier(
    _ newChild: GarbageNodesSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndModifier)
    return AccessLevelModifierSyntax(newData)
  }

  public var modifier: DeclModifierDetailSyntax? {
    get {
      let childData = data.child(at: Cursor.modifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclModifierDetailSyntax(childData!)
    }
    set(value) {
      self = withModifier(value)
    }
  }

  /// Returns a copy of the receiver with its `modifier` replaced.
  /// - param newChild: The new `modifier` to replace the node's
  ///                   current `modifier`, if present.
  public func withModifier(
    _ newChild: DeclModifierDetailSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.modifier)
    return AccessLevelModifierSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is DeclModifierDetailSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclModifierDetailSyntax.self))
    }
  }
}

extension AccessLevelModifierSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndModifier": garbageBetweenNameAndModifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifier": modifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessPathComponentSyntax

public struct AccessPathComponentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndTrailingDot
    case trailingDot
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessPathComponentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessPathComponent else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessPathComponentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessPathComponent)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return AccessPathComponentSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return AccessPathComponentSyntax(newData)
  }

  public var garbageBetweenNameAndTrailingDot: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndTrailingDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndTrailingDot(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndTrailingDot` replaced.
  /// - param newChild: The new `garbageBetweenNameAndTrailingDot` to replace the node's
  ///                   current `garbageBetweenNameAndTrailingDot`, if present.
  public func withGarbageBetweenNameAndTrailingDot(
    _ newChild: GarbageNodesSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndTrailingDot)
    return AccessPathComponentSyntax(newData)
  }

  public var trailingDot: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingDot(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingDot` replaced.
  /// - param newChild: The new `trailingDot` to replace the node's
  ///                   current `trailingDot`, if present.
  public func withTrailingDot(
    _ newChild: TokenSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingDot)
    return AccessPathComponentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension AccessPathComponentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndTrailingDot": garbageBetweenNameAndTrailingDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingDot": trailingDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessorParameterSyntax

public struct AccessorParameterSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftParen
    case leftParen
    case garbageBetweenLeftParenAndName
    case name
    case garbageBetweenNameAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessorParameterSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessorParameter else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessorParameterSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessorParameter)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftParen` replaced.
  /// - param newChild: The new `garbageBeforeLeftParen` to replace the node's
  ///                   current `garbageBeforeLeftParen`, if present.
  public func withGarbageBeforeLeftParen(
    _ newChild: GarbageNodesSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftParen)
    return AccessorParameterSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return AccessorParameterSyntax(newData)
  }

  public var garbageBetweenLeftParenAndName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndName` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndName` to replace the node's
  ///                   current `garbageBetweenLeftParenAndName`, if present.
  public func withGarbageBetweenLeftParenAndName(
    _ newChild: GarbageNodesSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndName)
    return AccessorParameterSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return AccessorParameterSyntax(newData)
  }

  public var garbageBetweenNameAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenNameAndRightParen` to replace the node's
  ///                   current `garbageBetweenNameAndRightParen`, if present.
  public func withGarbageBetweenNameAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndRightParen)
    return AccessorParameterSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return AccessorParameterSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension AccessorParameterSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftParen": garbageBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndName": garbageBetweenLeftParenAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndRightParen": garbageBetweenNameAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - AccessorBlockSyntax

public struct AccessorBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftBrace
    case leftBrace
    case garbageBetweenLeftBraceAndAccessors
    case accessors
    case garbageBetweenAccessorsAndRightBrace
    case rightBrace
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessorBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessorBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessorBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessorBlock)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftBrace: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftBrace` replaced.
  /// - param newChild: The new `garbageBeforeLeftBrace` to replace the node's
  ///                   current `garbageBeforeLeftBrace`, if present.
  public func withGarbageBeforeLeftBrace(
    _ newChild: GarbageNodesSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftBrace)
    return AccessorBlockSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftBrace)
    let newData = data.replacingChild(raw, at: Cursor.leftBrace)
    return AccessorBlockSyntax(newData)
  }

  public var garbageBetweenLeftBraceAndAccessors: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftBraceAndAccessors,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftBraceAndAccessors(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftBraceAndAccessors` replaced.
  /// - param newChild: The new `garbageBetweenLeftBraceAndAccessors` to replace the node's
  ///                   current `garbageBetweenLeftBraceAndAccessors`, if present.
  public func withGarbageBetweenLeftBraceAndAccessors(
    _ newChild: GarbageNodesSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftBraceAndAccessors)
    return AccessorBlockSyntax(newData)
  }

  public var accessors: AccessorListSyntax {
    get {
      let childData = data.child(at: Cursor.accessors,
                                 parent: Syntax(self))
      return AccessorListSyntax(childData!)
    }
    set(value) {
      self = withAccessors(value)
    }
  }

  /// Adds the provided `Accessor` to the node's `accessors`
  /// collection.
  /// - param element: The new `Accessor` to add to the node's
  ///                  `accessors` collection.
  /// - returns: A copy of the receiver with the provided `Accessor`
  ///            appended to its `accessors` collection.
  public func addAccessor(_ element: AccessorDeclSyntax) -> AccessorBlockSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.accessors] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.accessorList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.accessors)
    return AccessorBlockSyntax(newData)
  }

  /// Returns a copy of the receiver with its `accessors` replaced.
  /// - param newChild: The new `accessors` to replace the node's
  ///                   current `accessors`, if present.
  public func withAccessors(
    _ newChild: AccessorListSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.accessorList)
    let newData = data.replacingChild(raw, at: Cursor.accessors)
    return AccessorBlockSyntax(newData)
  }

  public var garbageBetweenAccessorsAndRightBrace: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAccessorsAndRightBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAccessorsAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAccessorsAndRightBrace` replaced.
  /// - param newChild: The new `garbageBetweenAccessorsAndRightBrace` to replace the node's
  ///                   current `garbageBetweenAccessorsAndRightBrace`, if present.
  public func withGarbageBetweenAccessorsAndRightBrace(
    _ newChild: GarbageNodesSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAccessorsAndRightBrace)
    return AccessorBlockSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightBrace)
    let newData = data.replacingChild(raw, at: Cursor.rightBrace)
    return AccessorBlockSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is AccessorListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AccessorListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension AccessorBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftBrace": garbageBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftBraceAndAccessors": garbageBetweenLeftBraceAndAccessors.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessors": Syntax(accessors).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAccessorsAndRightBrace": garbageBetweenAccessorsAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PatternBindingSyntax

public struct PatternBindingSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePattern
    case pattern
    case garbageBetweenPatternAndTypeAnnotation
    case typeAnnotation
    case garbageBetweenTypeAnnotationAndInitializer
    case initializer
    case garbageBetweenInitializerAndAccessor
    case accessor
    case garbageBetweenAccessorAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PatternBindingSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .patternBinding else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PatternBindingSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .patternBinding)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePattern: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePattern` replaced.
  /// - param newChild: The new `garbageBeforePattern` to replace the node's
  ///                   current `garbageBeforePattern`, if present.
  public func withGarbageBeforePattern(
    _ newChild: GarbageNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePattern)
    return PatternBindingSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingPattern)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return PatternBindingSyntax(newData)
  }

  public var garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatternAndTypeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatternAndTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatternAndTypeAnnotation` replaced.
  /// - param newChild: The new `garbageBetweenPatternAndTypeAnnotation` to replace the node's
  ///                   current `garbageBetweenPatternAndTypeAnnotation`, if present.
  public func withGarbageBetweenPatternAndTypeAnnotation(
    _ newChild: GarbageNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatternAndTypeAnnotation)
    return PatternBindingSyntax(newData)
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      let childData = data.child(at: Cursor.typeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeAnnotationSyntax(childData!)
    }
    set(value) {
      self = withTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.typeAnnotation)
    return PatternBindingSyntax(newData)
  }

  public var garbageBetweenTypeAnnotationAndInitializer: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAnnotationAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAnnotationAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAnnotationAndInitializer` replaced.
  /// - param newChild: The new `garbageBetweenTypeAnnotationAndInitializer` to replace the node's
  ///                   current `garbageBetweenTypeAnnotationAndInitializer`, if present.
  public func withGarbageBetweenTypeAnnotationAndInitializer(
    _ newChild: GarbageNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAnnotationAndInitializer)
    return PatternBindingSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return PatternBindingSyntax(newData)
  }

  public var garbageBetweenInitializerAndAccessor: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenInitializerAndAccessor,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenInitializerAndAccessor(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenInitializerAndAccessor` replaced.
  /// - param newChild: The new `garbageBetweenInitializerAndAccessor` to replace the node's
  ///                   current `garbageBetweenInitializerAndAccessor`, if present.
  public func withGarbageBetweenInitializerAndAccessor(
    _ newChild: GarbageNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenInitializerAndAccessor)
    return PatternBindingSyntax(newData)
  }

  public var accessor: Syntax? {
    get {
      let childData = data.child(at: Cursor.accessor,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withAccessor(value)
    }
  }

  /// Returns a copy of the receiver with its `accessor` replaced.
  /// - param newChild: The new `accessor` to replace the node's
  ///                   current `accessor`, if present.
  public func withAccessor(
    _ newChild: Syntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.accessor)
    return PatternBindingSyntax(newData)
  }

  public var garbageBetweenAccessorAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAccessorAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAccessorAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAccessorAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenAccessorAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenAccessorAndTrailingComma`, if present.
  public func withGarbageBetweenAccessorAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAccessorAndTrailingComma)
    return PatternBindingSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return PatternBindingSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 10)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is PatternSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PatternSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TypeAnnotationSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeAnnotationSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is InitializerClauseSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InitializerClauseSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is Syntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PatternBindingSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePattern": garbageBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPatternAndTypeAnnotation": garbageBetweenPatternAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenTypeAnnotationAndInitializer": garbageBetweenTypeAnnotationAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenInitializerAndAccessor": garbageBetweenInitializerAndAccessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessor": accessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAccessorAndTrailingComma": garbageBetweenAccessorAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - EnumCaseElementSyntax

/// 
/// An element of an enum case, containing the name of the case and,
/// optionally, either associated values or an assignment to a raw value.
/// 
public struct EnumCaseElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeIdentifier
    case identifier
    case garbageBetweenIdentifierAndAssociatedValue
    case associatedValue
    case garbageBetweenAssociatedValueAndRawValue
    case rawValue
    case garbageBetweenRawValueAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `EnumCaseElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .enumCaseElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `EnumCaseElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .enumCaseElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeIdentifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeIdentifier` replaced.
  /// - param newChild: The new `garbageBeforeIdentifier` to replace the node's
  ///                   current `garbageBeforeIdentifier`, if present.
  public func withGarbageBeforeIdentifier(
    _ newChild: GarbageNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeIdentifier)
    return EnumCaseElementSyntax(newData)
  }

  /// The name of this case.
  public var identifier: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.identifier,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.identifier)
    return EnumCaseElementSyntax(newData)
  }

  public var garbageBetweenIdentifierAndAssociatedValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenIdentifierAndAssociatedValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenIdentifierAndAssociatedValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenIdentifierAndAssociatedValue` replaced.
  /// - param newChild: The new `garbageBetweenIdentifierAndAssociatedValue` to replace the node's
  ///                   current `garbageBetweenIdentifierAndAssociatedValue`, if present.
  public func withGarbageBetweenIdentifierAndAssociatedValue(
    _ newChild: GarbageNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenIdentifierAndAssociatedValue)
    return EnumCaseElementSyntax(newData)
  }

  /// The set of associated values of the case.
  public var associatedValue: ParameterClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.associatedValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ParameterClauseSyntax(childData!)
    }
    set(value) {
      self = withAssociatedValue(value)
    }
  }

  /// Returns a copy of the receiver with its `associatedValue` replaced.
  /// - param newChild: The new `associatedValue` to replace the node's
  ///                   current `associatedValue`, if present.
  public func withAssociatedValue(
    _ newChild: ParameterClauseSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.associatedValue)
    return EnumCaseElementSyntax(newData)
  }

  public var garbageBetweenAssociatedValueAndRawValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAssociatedValueAndRawValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAssociatedValueAndRawValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAssociatedValueAndRawValue` replaced.
  /// - param newChild: The new `garbageBetweenAssociatedValueAndRawValue` to replace the node's
  ///                   current `garbageBetweenAssociatedValueAndRawValue`, if present.
  public func withGarbageBetweenAssociatedValueAndRawValue(
    _ newChild: GarbageNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAssociatedValueAndRawValue)
    return EnumCaseElementSyntax(newData)
  }

  /// 
  /// The raw value of this enum element, if present.
  /// 
  public var rawValue: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.rawValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withRawValue(value)
    }
  }

  /// Returns a copy of the receiver with its `rawValue` replaced.
  /// - param newChild: The new `rawValue` to replace the node's
  ///                   current `rawValue`, if present.
  public func withRawValue(
    _ newChild: InitializerClauseSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rawValue)
    return EnumCaseElementSyntax(newData)
  }

  public var garbageBetweenRawValueAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenRawValueAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenRawValueAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenRawValueAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenRawValueAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenRawValueAndTrailingComma`, if present.
  public func withGarbageBetweenRawValueAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenRawValueAndTrailingComma)
    return EnumCaseElementSyntax(newData)
  }

  /// 
  /// The trailing comma of this element, if the case has
  /// multiple elements.
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return EnumCaseElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ParameterClauseSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ParameterClauseSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is InitializerClauseSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InitializerClauseSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension EnumCaseElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeIdentifier": garbageBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "garbageBetweenIdentifierAndAssociatedValue": garbageBetweenIdentifierAndAssociatedValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "associatedValue": associatedValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAssociatedValueAndRawValue": garbageBetweenAssociatedValueAndRawValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rawValue": rawValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenRawValueAndTrailingComma": garbageBetweenRawValueAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - OperatorPrecedenceAndTypesSyntax

/// 
/// A clause to specify precedence group in infix operator declarations, and designated types in any operator declaration.
/// 
public struct OperatorPrecedenceAndTypesSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeColon
    case colon
    case garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes
    case precedenceGroupAndDesignatedTypes
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `OperatorPrecedenceAndTypesSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .operatorPrecedenceAndTypes else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `OperatorPrecedenceAndTypesSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .operatorPrecedenceAndTypes)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeColon` replaced.
  /// - param newChild: The new `garbageBeforeColon` to replace the node's
  ///                   current `garbageBeforeColon`, if present.
  public func withGarbageBeforeColon(
    _ newChild: GarbageNodesSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeColon)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  public var garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndPrecedenceGroupAndDesignatedTypes(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes` replaced.
  /// - param newChild: The new `garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes` to replace the node's
  ///                   current `garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes`, if present.
  public func withGarbageBetweenColonAndPrecedenceGroupAndDesignatedTypes(
    _ newChild: GarbageNodesSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  /// 
  /// The precedence group and designated types for this operator
  /// 
  public var precedenceGroupAndDesignatedTypes: IdentifierListSyntax {
    get {
      let childData = data.child(at: Cursor.precedenceGroupAndDesignatedTypes,
                                 parent: Syntax(self))
      return IdentifierListSyntax(childData!)
    }
    set(value) {
      self = withPrecedenceGroupAndDesignatedTypes(value)
    }
  }

  /// Adds the provided `PrecedenceGroupAndDesignatedType` to the node's `precedenceGroupAndDesignatedTypes`
  /// collection.
  /// - param element: The new `PrecedenceGroupAndDesignatedType` to add to the node's
  ///                  `precedenceGroupAndDesignatedTypes` collection.
  /// - returns: A copy of the receiver with the provided `PrecedenceGroupAndDesignatedType`
  ///            appended to its `precedenceGroupAndDesignatedTypes` collection.
  public func addPrecedenceGroupAndDesignatedType(_ element: TokenSyntax) -> OperatorPrecedenceAndTypesSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.precedenceGroupAndDesignatedTypes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.identifierList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.precedenceGroupAndDesignatedTypes)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  /// Returns a copy of the receiver with its `precedenceGroupAndDesignatedTypes` replaced.
  /// - param newChild: The new `precedenceGroupAndDesignatedTypes` to replace the node's
  ///                   current `precedenceGroupAndDesignatedTypes`, if present.
  public func withPrecedenceGroupAndDesignatedTypes(
    _ newChild: IdentifierListSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.identifierList)
    let newData = data.replacingChild(raw, at: Cursor.precedenceGroupAndDesignatedTypes)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is IdentifierListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(IdentifierListSyntax.self))
    }
  }
}

extension OperatorPrecedenceAndTypesSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeColon": garbageBeforeColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes": garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "precedenceGroupAndDesignatedTypes": Syntax(precedenceGroupAndDesignatedTypes).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrecedenceGroupRelationSyntax

/// 
/// Specify the new precedence group's relation to existing precedence
/// groups.
/// 
public struct PrecedenceGroupRelationSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeHigherThanOrLowerThan
    case higherThanOrLowerThan
    case garbageBetweenHigherThanOrLowerThanAndColon
    case colon
    case garbageBetweenColonAndOtherNames
    case otherNames
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupRelationSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupRelation else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupRelationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupRelation)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeHigherThanOrLowerThan: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeHigherThanOrLowerThan,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeHigherThanOrLowerThan(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeHigherThanOrLowerThan` replaced.
  /// - param newChild: The new `garbageBeforeHigherThanOrLowerThan` to replace the node's
  ///                   current `garbageBeforeHigherThanOrLowerThan`, if present.
  public func withGarbageBeforeHigherThanOrLowerThan(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeHigherThanOrLowerThan)
    return PrecedenceGroupRelationSyntax(newData)
  }

  /// 
  /// The relation to specified other precedence groups.
  /// 
  public var higherThanOrLowerThan: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.higherThanOrLowerThan,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withHigherThanOrLowerThan(value)
    }
  }

  /// Returns a copy of the receiver with its `higherThanOrLowerThan` replaced.
  /// - param newChild: The new `higherThanOrLowerThan` to replace the node's
  ///                   current `higherThanOrLowerThan`, if present.
  public func withHigherThanOrLowerThan(
    _ newChild: TokenSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.higherThanOrLowerThan)
    return PrecedenceGroupRelationSyntax(newData)
  }

  public var garbageBetweenHigherThanOrLowerThanAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenHigherThanOrLowerThanAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenHigherThanOrLowerThanAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenHigherThanOrLowerThanAndColon` replaced.
  /// - param newChild: The new `garbageBetweenHigherThanOrLowerThanAndColon` to replace the node's
  ///                   current `garbageBetweenHigherThanOrLowerThanAndColon`, if present.
  public func withGarbageBetweenHigherThanOrLowerThanAndColon(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenHigherThanOrLowerThanAndColon)
    return PrecedenceGroupRelationSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return PrecedenceGroupRelationSyntax(newData)
  }

  public var garbageBetweenColonAndOtherNames: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndOtherNames,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndOtherNames(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndOtherNames` replaced.
  /// - param newChild: The new `garbageBetweenColonAndOtherNames` to replace the node's
  ///                   current `garbageBetweenColonAndOtherNames`, if present.
  public func withGarbageBetweenColonAndOtherNames(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndOtherNames)
    return PrecedenceGroupRelationSyntax(newData)
  }

  /// 
  /// The name of other precedence group to which this precedence
  /// group relates.
  /// 
  public var otherNames: PrecedenceGroupNameListSyntax {
    get {
      let childData = data.child(at: Cursor.otherNames,
                                 parent: Syntax(self))
      return PrecedenceGroupNameListSyntax(childData!)
    }
    set(value) {
      self = withOtherNames(value)
    }
  }

  /// Adds the provided `OtherName` to the node's `otherNames`
  /// collection.
  /// - param element: The new `OtherName` to add to the node's
  ///                  `otherNames` collection.
  /// - returns: A copy of the receiver with the provided `OtherName`
  ///            appended to its `otherNames` collection.
  public func addOtherName(_ element: PrecedenceGroupNameElementSyntax) -> PrecedenceGroupRelationSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.otherNames] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.precedenceGroupNameList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.otherNames)
    return PrecedenceGroupRelationSyntax(newData)
  }

  /// Returns a copy of the receiver with its `otherNames` replaced.
  /// - param newChild: The new `otherNames` to replace the node's
  ///                   current `otherNames`, if present.
  public func withOtherNames(
    _ newChild: PrecedenceGroupNameListSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.precedenceGroupNameList)
    let newData = data.replacingChild(raw, at: Cursor.otherNames)
    return PrecedenceGroupRelationSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is PrecedenceGroupNameListSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PrecedenceGroupNameListSyntax.self))
    }
  }
}

extension PrecedenceGroupRelationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeHigherThanOrLowerThan": garbageBeforeHigherThanOrLowerThan.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "higherThanOrLowerThan": Syntax(higherThanOrLowerThan).asProtocol(SyntaxProtocol.self),
      "garbageBetweenHigherThanOrLowerThanAndColon": garbageBetweenHigherThanOrLowerThanAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndOtherNames": garbageBetweenColonAndOtherNames.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "otherNames": Syntax(otherNames).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrecedenceGroupNameElementSyntax

public struct PrecedenceGroupNameElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupNameElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupNameElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupNameElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupNameElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return PrecedenceGroupNameElementSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return PrecedenceGroupNameElementSyntax(newData)
  }

  public var garbageBetweenNameAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenNameAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenNameAndTrailingComma`, if present.
  public func withGarbageBetweenNameAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndTrailingComma)
    return PrecedenceGroupNameElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return PrecedenceGroupNameElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PrecedenceGroupNameElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndTrailingComma": garbageBetweenNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PrecedenceGroupAssignmentSyntax

/// 
/// Specifies the precedence of an operator when used in an operation
/// that includes optional chaining.
/// 
public struct PrecedenceGroupAssignmentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAssignmentKeyword
    case assignmentKeyword
    case garbageBetweenAssignmentKeywordAndColon
    case colon
    case garbageBetweenColonAndFlag
    case flag
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupAssignmentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupAssignment else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupAssignmentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupAssignment)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAssignmentKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAssignmentKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAssignmentKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAssignmentKeyword` replaced.
  /// - param newChild: The new `garbageBeforeAssignmentKeyword` to replace the node's
  ///                   current `garbageBeforeAssignmentKeyword`, if present.
  public func withGarbageBeforeAssignmentKeyword(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAssignmentKeyword)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var assignmentKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.assignmentKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssignmentKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `assignmentKeyword` replaced.
  /// - param newChild: The new `assignmentKeyword` to replace the node's
  ///                   current `assignmentKeyword`, if present.
  public func withAssignmentKeyword(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.assignmentKeyword)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var garbageBetweenAssignmentKeywordAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAssignmentKeywordAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAssignmentKeywordAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAssignmentKeywordAndColon` replaced.
  /// - param newChild: The new `garbageBetweenAssignmentKeywordAndColon` to replace the node's
  ///                   current `garbageBetweenAssignmentKeywordAndColon`, if present.
  public func withGarbageBetweenAssignmentKeywordAndColon(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAssignmentKeywordAndColon)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var garbageBetweenColonAndFlag: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndFlag,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndFlag(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndFlag` replaced.
  /// - param newChild: The new `garbageBetweenColonAndFlag` to replace the node's
  ///                   current `garbageBetweenColonAndFlag`, if present.
  public func withGarbageBetweenColonAndFlag(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndFlag)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  /// 
  /// When true, an operator in the corresponding precedence group
  /// uses the same grouping rules during optional chaining as the
  /// assignment operators from the standard library. Otherwise,
  /// operators in the precedence group follows the same optional
  /// chaining rules as operators that don't perform assignment.
  /// 
  public var flag: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.flag,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFlag(value)
    }
  }

  /// Returns a copy of the receiver with its `flag` replaced.
  /// - param newChild: The new `flag` to replace the node's
  ///                   current `flag`, if present.
  public func withFlag(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.trueKeyword)
    let newData = data.replacingChild(raw, at: Cursor.flag)
    return PrecedenceGroupAssignmentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PrecedenceGroupAssignmentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAssignmentKeyword": garbageBeforeAssignmentKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "assignmentKeyword": Syntax(assignmentKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAssignmentKeywordAndColon": garbageBetweenAssignmentKeywordAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndFlag": garbageBetweenColonAndFlag.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "flag": Syntax(flag).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrecedenceGroupAssociativitySyntax

/// 
/// Specifies how a sequence of operators with the same precedence level
/// are grouped together in the absence of grouping parentheses.
/// 
public struct PrecedenceGroupAssociativitySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAssociativityKeyword
    case associativityKeyword
    case garbageBetweenAssociativityKeywordAndColon
    case colon
    case garbageBetweenColonAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupAssociativitySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupAssociativity else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupAssociativitySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupAssociativity)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAssociativityKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAssociativityKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAssociativityKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAssociativityKeyword` replaced.
  /// - param newChild: The new `garbageBeforeAssociativityKeyword` to replace the node's
  ///                   current `garbageBeforeAssociativityKeyword`, if present.
  public func withGarbageBeforeAssociativityKeyword(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAssociativityKeyword)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var associativityKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.associativityKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssociativityKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `associativityKeyword` replaced.
  /// - param newChild: The new `associativityKeyword` to replace the node's
  ///                   current `associativityKeyword`, if present.
  public func withAssociativityKeyword(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.associativityKeyword)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var garbageBetweenAssociativityKeywordAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAssociativityKeywordAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAssociativityKeywordAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAssociativityKeywordAndColon` replaced.
  /// - param newChild: The new `garbageBetweenAssociativityKeywordAndColon` to replace the node's
  ///                   current `garbageBetweenAssociativityKeywordAndColon`, if present.
  public func withGarbageBetweenAssociativityKeywordAndColon(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAssociativityKeywordAndColon)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var garbageBetweenColonAndValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndValue` replaced.
  /// - param newChild: The new `garbageBetweenColonAndValue` to replace the node's
  ///                   current `garbageBetweenColonAndValue`, if present.
  public func withGarbageBetweenColonAndValue(
    _ newChild: GarbageNodesSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndValue)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  /// 
  /// Operators that are `left`-associative group left-to-right.
  /// Operators that are `right`-associative group right-to-left.
  /// Operators that are specified with an associativity of `none`
  /// don't associate at all
  /// 
  public var value: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.value)
    return PrecedenceGroupAssociativitySyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PrecedenceGroupAssociativitySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAssociativityKeyword": garbageBeforeAssociativityKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "associativityKeyword": Syntax(associativityKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAssociativityKeywordAndColon": garbageBetweenAssociativityKeywordAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndValue": garbageBetweenColonAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CustomAttributeSyntax

/// 
/// A custom `@` attribute.
/// 
public struct CustomAttributeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAtSignToken
    case atSignToken
    case garbageBetweenAtSignTokenAndAttributeName
    case attributeName
    case garbageBetweenAttributeNameAndLeftParen
    case leftParen
    case garbageBetweenLeftParenAndArgumentList
    case argumentList
    case garbageBetweenArgumentListAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CustomAttributeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .customAttribute else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CustomAttributeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .customAttribute)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAtSignToken: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAtSignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAtSignToken` replaced.
  /// - param newChild: The new `garbageBeforeAtSignToken` to replace the node's
  ///                   current `garbageBeforeAtSignToken`, if present.
  public func withGarbageBeforeAtSignToken(
    _ newChild: GarbageNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAtSignToken)
    return CustomAttributeSyntax(newData)
  }

  /// The `@` sign.
  public var atSignToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.atSignToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `atSignToken` replaced.
  /// - param newChild: The new `atSignToken` to replace the node's
  ///                   current `atSignToken`, if present.
  public func withAtSignToken(
    _ newChild: TokenSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.atSign)
    let newData = data.replacingChild(raw, at: Cursor.atSignToken)
    return CustomAttributeSyntax(newData)
  }

  public var garbageBetweenAtSignTokenAndAttributeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAtSignTokenAndAttributeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAtSignTokenAndAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAtSignTokenAndAttributeName` replaced.
  /// - param newChild: The new `garbageBetweenAtSignTokenAndAttributeName` to replace the node's
  ///                   current `garbageBetweenAtSignTokenAndAttributeName`, if present.
  public func withGarbageBetweenAtSignTokenAndAttributeName(
    _ newChild: GarbageNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAtSignTokenAndAttributeName)
    return CustomAttributeSyntax(newData)
  }

  /// The name of the attribute.
  public var attributeName: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.attributeName,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `attributeName` replaced.
  /// - param newChild: The new `attributeName` to replace the node's
  ///                   current `attributeName`, if present.
  public func withAttributeName(
    _ newChild: TypeSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.attributeName)
    return CustomAttributeSyntax(newData)
  }

  public var garbageBetweenAttributeNameAndLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAttributeNameAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAttributeNameAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAttributeNameAndLeftParen` replaced.
  /// - param newChild: The new `garbageBetweenAttributeNameAndLeftParen` to replace the node's
  ///                   current `garbageBetweenAttributeNameAndLeftParen`, if present.
  public func withGarbageBetweenAttributeNameAndLeftParen(
    _ newChild: GarbageNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAttributeNameAndLeftParen)
    return CustomAttributeSyntax(newData)
  }

  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return CustomAttributeSyntax(newData)
  }

  public var garbageBetweenLeftParenAndArgumentList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndArgumentList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndArgumentList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndArgumentList` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndArgumentList` to replace the node's
  ///                   current `garbageBetweenLeftParenAndArgumentList`, if present.
  public func withGarbageBetweenLeftParenAndArgumentList(
    _ newChild: GarbageNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndArgumentList)
    return CustomAttributeSyntax(newData)
  }

  public var argumentList: TupleExprElementListSyntax? {
    get {
      let childData = data.child(at: Cursor.argumentList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withArgumentList(value)
    }
  }

  /// Adds the provided `Argument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `argumentList` collection.
  public func addArgument(_ element: TupleExprElementSyntax) -> CustomAttributeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.argumentList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.tupleExprElementList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.argumentList)
    return CustomAttributeSyntax(newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(
    _ newChild: TupleExprElementListSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.argumentList)
    return CustomAttributeSyntax(newData)
  }

  public var garbageBetweenArgumentListAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenArgumentListAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenArgumentListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenArgumentListAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenArgumentListAndRightParen` to replace the node's
  ///                   current `garbageBetweenArgumentListAndRightParen`, if present.
  public func withGarbageBetweenArgumentListAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenArgumentListAndRightParen)
    return CustomAttributeSyntax(newData)
  }

  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return CustomAttributeSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 10)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TypeSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TupleExprElementListSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TupleExprElementListSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension CustomAttributeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAtSignToken": garbageBeforeAtSignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "atSignToken": Syntax(atSignToken).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAtSignTokenAndAttributeName": garbageBetweenAtSignTokenAndAttributeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributeName": Syntax(attributeName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAttributeNameAndLeftParen": garbageBetweenAttributeNameAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenLeftParenAndArgumentList": garbageBetweenLeftParenAndArgumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentList": argumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenArgumentListAndRightParen": garbageBetweenArgumentListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AttributeSyntax

/// 
/// An `@` attribute.
/// 
public struct AttributeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAtSignToken
    case atSignToken
    case garbageBetweenAtSignTokenAndAttributeName
    case attributeName
    case garbageBetweenAttributeNameAndLeftParen
    case leftParen
    case garbageBetweenLeftParenAndArgument
    case argument
    case garbageBetweenArgumentAndRightParen
    case rightParen
    case garbageBetweenRightParenAndTokenList
    case tokenList
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AttributeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .attribute else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AttributeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .attribute)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAtSignToken: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAtSignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAtSignToken` replaced.
  /// - param newChild: The new `garbageBeforeAtSignToken` to replace the node's
  ///                   current `garbageBeforeAtSignToken`, if present.
  public func withGarbageBeforeAtSignToken(
    _ newChild: GarbageNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAtSignToken)
    return AttributeSyntax(newData)
  }

  /// The `@` sign.
  public var atSignToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.atSignToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `atSignToken` replaced.
  /// - param newChild: The new `atSignToken` to replace the node's
  ///                   current `atSignToken`, if present.
  public func withAtSignToken(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.atSign)
    let newData = data.replacingChild(raw, at: Cursor.atSignToken)
    return AttributeSyntax(newData)
  }

  public var garbageBetweenAtSignTokenAndAttributeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAtSignTokenAndAttributeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAtSignTokenAndAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAtSignTokenAndAttributeName` replaced.
  /// - param newChild: The new `garbageBetweenAtSignTokenAndAttributeName` to replace the node's
  ///                   current `garbageBetweenAtSignTokenAndAttributeName`, if present.
  public func withGarbageBetweenAtSignTokenAndAttributeName(
    _ newChild: GarbageNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAtSignTokenAndAttributeName)
    return AttributeSyntax(newData)
  }

  /// The name of the attribute.
  public var attributeName: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.attributeName,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `attributeName` replaced.
  /// - param newChild: The new `attributeName` to replace the node's
  ///                   current `attributeName`, if present.
  public func withAttributeName(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.unknown(""))
    let newData = data.replacingChild(raw, at: Cursor.attributeName)
    return AttributeSyntax(newData)
  }

  public var garbageBetweenAttributeNameAndLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAttributeNameAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAttributeNameAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAttributeNameAndLeftParen` replaced.
  /// - param newChild: The new `garbageBetweenAttributeNameAndLeftParen` to replace the node's
  ///                   current `garbageBetweenAttributeNameAndLeftParen`, if present.
  public func withGarbageBetweenAttributeNameAndLeftParen(
    _ newChild: GarbageNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAttributeNameAndLeftParen)
    return AttributeSyntax(newData)
  }

  /// 
  /// If the attribute takes arguments, the opening parenthesis.
  /// 
  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return AttributeSyntax(newData)
  }

  public var garbageBetweenLeftParenAndArgument: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndArgument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndArgument` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndArgument` to replace the node's
  ///                   current `garbageBetweenLeftParenAndArgument`, if present.
  public func withGarbageBetweenLeftParenAndArgument(
    _ newChild: GarbageNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndArgument)
    return AttributeSyntax(newData)
  }

  /// 
  /// The arguments of the attribute. In case the attribute
  /// takes multiple arguments, they are gather in the
  /// appropriate takes first.
  /// 
  public var argument: Syntax? {
    get {
      let childData = data.child(at: Cursor.argument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `argument` replaced.
  /// - param newChild: The new `argument` to replace the node's
  ///                   current `argument`, if present.
  public func withArgument(
    _ newChild: Syntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.argument)
    return AttributeSyntax(newData)
  }

  public var garbageBetweenArgumentAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenArgumentAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenArgumentAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenArgumentAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenArgumentAndRightParen` to replace the node's
  ///                   current `garbageBetweenArgumentAndRightParen`, if present.
  public func withGarbageBetweenArgumentAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenArgumentAndRightParen)
    return AttributeSyntax(newData)
  }

  /// 
  /// If the attribute takes arguments, the closing parenthesis.
  /// 
  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return AttributeSyntax(newData)
  }

  public var garbageBetweenRightParenAndTokenList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenRightParenAndTokenList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenRightParenAndTokenList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenRightParenAndTokenList` replaced.
  /// - param newChild: The new `garbageBetweenRightParenAndTokenList` to replace the node's
  ///                   current `garbageBetweenRightParenAndTokenList`, if present.
  public func withGarbageBetweenRightParenAndTokenList(
    _ newChild: GarbageNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenRightParenAndTokenList)
    return AttributeSyntax(newData)
  }

  public var tokenList: TokenListSyntax? {
    get {
      let childData = data.child(at: Cursor.tokenList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenListSyntax(childData!)
    }
    set(value) {
      self = withTokenList(value)
    }
  }

  /// Adds the provided `Token` to the node's `tokenList`
  /// collection.
  /// - param element: The new `Token` to add to the node's
  ///                  `tokenList` collection.
  /// - returns: A copy of the receiver with the provided `Token`
  ///            appended to its `tokenList` collection.
  public func addToken(_ element: TokenSyntax) -> AttributeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.tokenList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.tokenList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.tokenList)
    return AttributeSyntax(newData)
  }

  /// Returns a copy of the receiver with its `tokenList` replaced.
  /// - param newChild: The new `tokenList` to replace the node's
  ///                   current `tokenList`, if present.
  public func withTokenList(
    _ newChild: TokenListSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.tokenList)
    return AttributeSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 12)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is Syntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is TokenListSyntax or missing
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenListSyntax.self))
    }
  }
}

extension AttributeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAtSignToken": garbageBeforeAtSignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "atSignToken": Syntax(atSignToken).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAtSignTokenAndAttributeName": garbageBetweenAtSignTokenAndAttributeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributeName": Syntax(attributeName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAttributeNameAndLeftParen": garbageBetweenAttributeNameAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenLeftParenAndArgument": garbageBetweenLeftParenAndArgument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argument": argument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenArgumentAndRightParen": garbageBetweenArgumentAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenRightParenAndTokenList": garbageBetweenRightParenAndTokenList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "tokenList": tokenList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityEntrySyntax

/// 
/// The availability argument for the _specialize attribute
/// 
public struct AvailabilityEntrySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabel
    case label
    case garbageBetweenLabelAndColon
    case colon
    case garbageBetweenColonAndAvailabilityList
    case availabilityList
    case garbageBetweenAvailabilityListAndSemicolon
    case semicolon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityEntrySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityEntry else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityEntrySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityEntry)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeLabel` to replace the node's
  ///                   current `garbageBeforeLabel`, if present.
  public func withGarbageBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabel)
    return AvailabilityEntrySyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.label)
    return AvailabilityEntrySyntax(newData)
  }

  public var garbageBetweenLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndColon` to replace the node's
  ///                   current `garbageBetweenLabelAndColon`, if present.
  public func withGarbageBetweenLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndColon)
    return AvailabilityEntrySyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return AvailabilityEntrySyntax(newData)
  }

  public var garbageBetweenColonAndAvailabilityList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndAvailabilityList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndAvailabilityList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndAvailabilityList` replaced.
  /// - param newChild: The new `garbageBetweenColonAndAvailabilityList` to replace the node's
  ///                   current `garbageBetweenColonAndAvailabilityList`, if present.
  public func withGarbageBetweenColonAndAvailabilityList(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndAvailabilityList)
    return AvailabilityEntrySyntax(newData)
  }

  public var availabilityList: AvailabilitySpecListSyntax {
    get {
      let childData = data.child(at: Cursor.availabilityList,
                                 parent: Syntax(self))
      return AvailabilitySpecListSyntax(childData!)
    }
    set(value) {
      self = withAvailabilityList(value)
    }
  }

  /// Adds the provided `Availability` to the node's `availabilityList`
  /// collection.
  /// - param element: The new `Availability` to add to the node's
  ///                  `availabilityList` collection.
  /// - returns: A copy of the receiver with the provided `Availability`
  ///            appended to its `availabilityList` collection.
  public func addAvailability(_ element: AvailabilityArgumentSyntax) -> AvailabilityEntrySyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.availabilityList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.availabilitySpecList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.availabilityList)
    return AvailabilityEntrySyntax(newData)
  }

  /// Returns a copy of the receiver with its `availabilityList` replaced.
  /// - param newChild: The new `availabilityList` to replace the node's
  ///                   current `availabilityList`, if present.
  public func withAvailabilityList(
    _ newChild: AvailabilitySpecListSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.availabilitySpecList)
    let newData = data.replacingChild(raw, at: Cursor.availabilityList)
    return AvailabilityEntrySyntax(newData)
  }

  public var garbageBetweenAvailabilityListAndSemicolon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAvailabilityListAndSemicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAvailabilityListAndSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAvailabilityListAndSemicolon` replaced.
  /// - param newChild: The new `garbageBetweenAvailabilityListAndSemicolon` to replace the node's
  ///                   current `garbageBetweenAvailabilityListAndSemicolon`, if present.
  public func withGarbageBetweenAvailabilityListAndSemicolon(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAvailabilityListAndSemicolon)
    return AvailabilityEntrySyntax(newData)
  }

  public var semicolon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.semicolon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.semicolon)
    let newData = data.replacingChild(raw, at: Cursor.semicolon)
    return AvailabilityEntrySyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is AvailabilitySpecListSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AvailabilitySpecListSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension AvailabilityEntrySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabel": garbageBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLabelAndColon": garbageBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndAvailabilityList": garbageBetweenColonAndAvailabilityList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilityList": Syntax(availabilityList).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAvailabilityListAndSemicolon": garbageBetweenAvailabilityListAndSemicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "semicolon": Syntax(semicolon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - LabeledSpecializeEntrySyntax

/// 
/// A labeled argument for the `@_specialize` attribute like
/// `exported: true`
/// 
public struct LabeledSpecializeEntrySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabel
    case label
    case garbageBetweenLabelAndColon
    case colon
    case garbageBetweenColonAndValue
    case value
    case garbageBetweenValueAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `LabeledSpecializeEntrySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .labeledSpecializeEntry else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `LabeledSpecializeEntrySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .labeledSpecializeEntry)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeLabel` to replace the node's
  ///                   current `garbageBeforeLabel`, if present.
  public func withGarbageBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabel)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.label)
    return LabeledSpecializeEntrySyntax(newData)
  }

  public var garbageBetweenLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndColon` to replace the node's
  ///                   current `garbageBetweenLabelAndColon`, if present.
  public func withGarbageBetweenLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndColon)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return LabeledSpecializeEntrySyntax(newData)
  }

  public var garbageBetweenColonAndValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndValue` replaced.
  /// - param newChild: The new `garbageBetweenColonAndValue` to replace the node's
  ///                   current `garbageBetweenColonAndValue`, if present.
  public func withGarbageBetweenColonAndValue(
    _ newChild: GarbageNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndValue)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// The value for this argument
  public var value: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.unknown(""))
    let newData = data.replacingChild(raw, at: Cursor.value)
    return LabeledSpecializeEntrySyntax(newData)
  }

  public var garbageBetweenValueAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenValueAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenValueAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenValueAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenValueAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenValueAndTrailingComma`, if present.
  public func withGarbageBetweenValueAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenValueAndTrailingComma)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// 
  /// A trailing comma if this argument is followed by another one
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return LabeledSpecializeEntrySyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension LabeledSpecializeEntrySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabel": garbageBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLabelAndColon": garbageBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndValue": garbageBetweenColonAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
      "garbageBetweenValueAndTrailingComma": garbageBetweenValueAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TargetFunctionEntrySyntax

/// 
/// A labeled argument for the `@_specialize` attribute with a function
/// decl value like
/// `target: myFunc(_:)`
/// 
public struct TargetFunctionEntrySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabel
    case label
    case garbageBetweenLabelAndColon
    case colon
    case garbageBetweenColonAndDeclname
    case declname
    case garbageBetweenDeclnameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TargetFunctionEntrySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .targetFunctionEntry else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TargetFunctionEntrySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .targetFunctionEntry)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeLabel` to replace the node's
  ///                   current `garbageBeforeLabel`, if present.
  public func withGarbageBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabel)
    return TargetFunctionEntrySyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.label)
    return TargetFunctionEntrySyntax(newData)
  }

  public var garbageBetweenLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndColon` to replace the node's
  ///                   current `garbageBetweenLabelAndColon`, if present.
  public func withGarbageBetweenLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndColon)
    return TargetFunctionEntrySyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TargetFunctionEntrySyntax(newData)
  }

  public var garbageBetweenColonAndDeclname: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndDeclname,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndDeclname` replaced.
  /// - param newChild: The new `garbageBetweenColonAndDeclname` to replace the node's
  ///                   current `garbageBetweenColonAndDeclname`, if present.
  public func withGarbageBetweenColonAndDeclname(
    _ newChild: GarbageNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndDeclname)
    return TargetFunctionEntrySyntax(newData)
  }

  /// The value for this argument
  public var declname: DeclNameSyntax {
    get {
      let childData = data.child(at: Cursor.declname,
                                 parent: Syntax(self))
      return DeclNameSyntax(childData!)
    }
    set(value) {
      self = withDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `declname` replaced.
  /// - param newChild: The new `declname` to replace the node's
  ///                   current `declname`, if present.
  public func withDeclname(
    _ newChild: DeclNameSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.declName)
    let newData = data.replacingChild(raw, at: Cursor.declname)
    return TargetFunctionEntrySyntax(newData)
  }

  public var garbageBetweenDeclnameAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDeclnameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDeclnameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDeclnameAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenDeclnameAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenDeclnameAndTrailingComma`, if present.
  public func withGarbageBetweenDeclnameAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDeclnameAndTrailingComma)
    return TargetFunctionEntrySyntax(newData)
  }

  /// 
  /// A trailing comma if this argument is followed by another one
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TargetFunctionEntrySyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is DeclNameSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclNameSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension TargetFunctionEntrySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabel": garbageBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLabelAndColon": garbageBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndDeclname": garbageBetweenColonAndDeclname.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declname": Syntax(declname).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDeclnameAndTrailingComma": garbageBetweenDeclnameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - NamedAttributeStringArgumentSyntax

/// 
/// The argument for the `@_dynamic_replacement` or `@_private`
/// attribute of the form `for: "function()"` or `sourceFile:
/// "Src.swift"`
/// 
public struct NamedAttributeStringArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeNameTok
    case nameTok
    case garbageBetweenNameTokAndColon
    case colon
    case garbageBetweenColonAndStringOrDeclname
    case stringOrDeclname
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `NamedAttributeStringArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .namedAttributeStringArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `NamedAttributeStringArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .namedAttributeStringArgument)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeNameTok: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeNameTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeNameTok(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeNameTok` replaced.
  /// - param newChild: The new `garbageBeforeNameTok` to replace the node's
  ///                   current `garbageBeforeNameTok`, if present.
  public func withGarbageBeforeNameTok(
    _ newChild: GarbageNodesSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeNameTok)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  /// The label of the argument
  public var nameTok: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.nameTok,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withNameTok(value)
    }
  }

  /// Returns a copy of the receiver with its `nameTok` replaced.
  /// - param newChild: The new `nameTok` to replace the node's
  ///                   current `nameTok`, if present.
  public func withNameTok(
    _ newChild: TokenSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.unknown(""))
    let newData = data.replacingChild(raw, at: Cursor.nameTok)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  public var garbageBetweenNameTokAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameTokAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameTokAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameTokAndColon` replaced.
  /// - param newChild: The new `garbageBetweenNameTokAndColon` to replace the node's
  ///                   current `garbageBetweenNameTokAndColon`, if present.
  public func withGarbageBetweenNameTokAndColon(
    _ newChild: GarbageNodesSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameTokAndColon)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  public var garbageBetweenColonAndStringOrDeclname: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndStringOrDeclname,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndStringOrDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndStringOrDeclname` replaced.
  /// - param newChild: The new `garbageBetweenColonAndStringOrDeclname` to replace the node's
  ///                   current `garbageBetweenColonAndStringOrDeclname`, if present.
  public func withGarbageBetweenColonAndStringOrDeclname(
    _ newChild: GarbageNodesSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndStringOrDeclname)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  public var stringOrDeclname: Syntax {
    get {
      let childData = data.child(at: Cursor.stringOrDeclname,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withStringOrDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `stringOrDeclname` replaced.
  /// - param newChild: The new `stringOrDeclname` to replace the node's
  ///                   current `stringOrDeclname`, if present.
  public func withStringOrDeclname(
    _ newChild: Syntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.stringOrDeclname)
    return NamedAttributeStringArgumentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
  }
}

extension NamedAttributeStringArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeNameTok": garbageBeforeNameTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "nameTok": Syntax(nameTok).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameTokAndColon": garbageBetweenNameTokAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndStringOrDeclname": garbageBetweenColonAndStringOrDeclname.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "stringOrDeclname": Syntax(stringOrDeclname).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclNameSyntax

public struct DeclNameSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeDeclBaseName
    case declBaseName
    case garbageBetweenDeclBaseNameAndDeclNameArguments
    case declNameArguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclNameSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declName)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeDeclBaseName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeDeclBaseName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeDeclBaseName` replaced.
  /// - param newChild: The new `garbageBeforeDeclBaseName` to replace the node's
  ///                   current `garbageBeforeDeclBaseName`, if present.
  public func withGarbageBeforeDeclBaseName(
    _ newChild: GarbageNodesSyntax?) -> DeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeDeclBaseName)
    return DeclNameSyntax(newData)
  }

  /// 
  /// The base name of the protocol's requirement.
  /// 
  public var declBaseName: Syntax {
    get {
      let childData = data.child(at: Cursor.declBaseName,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `declBaseName` replaced.
  /// - param newChild: The new `declBaseName` to replace the node's
  ///                   current `declBaseName`, if present.
  public func withDeclBaseName(
    _ newChild: Syntax?) -> DeclNameSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.declBaseName)
    return DeclNameSyntax(newData)
  }

  public var garbageBetweenDeclBaseNameAndDeclNameArguments: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDeclBaseNameAndDeclNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDeclBaseNameAndDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDeclBaseNameAndDeclNameArguments` replaced.
  /// - param newChild: The new `garbageBetweenDeclBaseNameAndDeclNameArguments` to replace the node's
  ///                   current `garbageBetweenDeclBaseNameAndDeclNameArguments`, if present.
  public func withGarbageBetweenDeclBaseNameAndDeclNameArguments(
    _ newChild: GarbageNodesSyntax?) -> DeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDeclBaseNameAndDeclNameArguments)
    return DeclNameSyntax(newData)
  }

  /// 
  /// The argument labels of the protocol's requirement if it
  /// is a function requirement.
  /// 
  public var declNameArguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.declNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> DeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.declNameArguments)
    return DeclNameSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is DeclNameArgumentsSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclNameArgumentsSyntax.self))
    }
  }
}

extension DeclNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeDeclBaseName": garbageBeforeDeclBaseName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declBaseName": Syntax(declBaseName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDeclBaseNameAndDeclNameArguments": garbageBetweenDeclBaseNameAndDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declNameArguments": declNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ImplementsAttributeArgumentsSyntax

/// 
/// The arguments for the `@_implements` attribute of the form
/// `Type, methodName(arg1Label:arg2Label:)`
/// 
public struct ImplementsAttributeArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeType
    case type
    case garbageBetweenTypeAndComma
    case comma
    case garbageBetweenCommaAndDeclBaseName
    case declBaseName
    case garbageBetweenDeclBaseNameAndDeclNameArguments
    case declNameArguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ImplementsAttributeArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .implementsAttributeArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ImplementsAttributeArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .implementsAttributeArguments)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeType` replaced.
  /// - param newChild: The new `garbageBeforeType` to replace the node's
  ///                   current `garbageBeforeType`, if present.
  public func withGarbageBeforeType(
    _ newChild: GarbageNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeType)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The type for which the method with this attribute
  /// implements a requirement.
  /// 
  public var type: SimpleTypeIdentifierSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return SimpleTypeIdentifierSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: SimpleTypeIdentifierSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.simpleTypeIdentifier)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenTypeAndComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAndComma` replaced.
  /// - param newChild: The new `garbageBetweenTypeAndComma` to replace the node's
  ///                   current `garbageBetweenTypeAndComma`, if present.
  public func withGarbageBetweenTypeAndComma(
    _ newChild: GarbageNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAndComma)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The comma separating the type and method name
  /// 
  public var comma: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.comma)
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenCommaAndDeclBaseName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCommaAndDeclBaseName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCommaAndDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCommaAndDeclBaseName` replaced.
  /// - param newChild: The new `garbageBetweenCommaAndDeclBaseName` to replace the node's
  ///                   current `garbageBetweenCommaAndDeclBaseName`, if present.
  public func withGarbageBetweenCommaAndDeclBaseName(
    _ newChild: GarbageNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCommaAndDeclBaseName)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The base name of the protocol's requirement.
  /// 
  public var declBaseName: Syntax {
    get {
      let childData = data.child(at: Cursor.declBaseName,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `declBaseName` replaced.
  /// - param newChild: The new `declBaseName` to replace the node's
  ///                   current `declBaseName`, if present.
  public func withDeclBaseName(
    _ newChild: Syntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.declBaseName)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenDeclBaseNameAndDeclNameArguments: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDeclBaseNameAndDeclNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDeclBaseNameAndDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDeclBaseNameAndDeclNameArguments` replaced.
  /// - param newChild: The new `garbageBetweenDeclBaseNameAndDeclNameArguments` to replace the node's
  ///                   current `garbageBetweenDeclBaseNameAndDeclNameArguments`, if present.
  public func withGarbageBetweenDeclBaseNameAndDeclNameArguments(
    _ newChild: GarbageNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDeclBaseNameAndDeclNameArguments)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The argument labels of the protocol's requirement if it
  /// is a function requirement.
  /// 
  public var declNameArguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.declNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.declNameArguments)
    return ImplementsAttributeArgumentsSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is SimpleTypeIdentifierSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(SimpleTypeIdentifierSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is DeclNameArgumentsSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclNameArgumentsSyntax.self))
    }
  }
}

extension ImplementsAttributeArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeType": garbageBeforeType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "garbageBetweenTypeAndComma": garbageBetweenTypeAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": Syntax(comma).asProtocol(SyntaxProtocol.self),
      "garbageBetweenCommaAndDeclBaseName": garbageBetweenCommaAndDeclBaseName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declBaseName": Syntax(declBaseName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDeclBaseNameAndDeclNameArguments": garbageBetweenDeclBaseNameAndDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declNameArguments": declNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ObjCSelectorPieceSyntax

/// 
/// A piece of an Objective-C selector. Either consisting of just an
/// identifier for a nullary selector, an identifier and a colon for a
/// labeled argument or just a colon for an unlabeled argument
/// 
public struct ObjCSelectorPieceSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ObjCSelectorPieceSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .objCSelectorPiece else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ObjCSelectorPieceSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .objCSelectorPiece)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return ObjCSelectorPieceSyntax(newData)
  }

  public var name: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ObjCSelectorPieceSyntax(newData)
  }

  public var garbageBetweenNameAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndColon` replaced.
  /// - param newChild: The new `garbageBetweenNameAndColon` to replace the node's
  ///                   current `garbageBetweenNameAndColon`, if present.
  public func withGarbageBetweenNameAndColon(
    _ newChild: GarbageNodesSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndColon)
    return ObjCSelectorPieceSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return ObjCSelectorPieceSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ObjCSelectorPieceSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": name.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenNameAndColon": garbageBetweenNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DifferentiableAttributeArgumentsSyntax

/// 
/// The arguments for the `@differentiable` attribute: an optional
/// differentiability kind, an optional differentiability parameter clause,
/// and an optional 'where' clause.
/// 
public struct DifferentiableAttributeArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeDiffKind
    case diffKind
    case garbageBetweenDiffKindAndDiffKindComma
    case diffKindComma
    case garbageBetweenDiffKindCommaAndDiffParams
    case diffParams
    case garbageBetweenDiffParamsAndDiffParamsComma
    case diffParamsComma
    case garbageBetweenDiffParamsCommaAndWhereClause
    case whereClause
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiableAttributeArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiableAttributeArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiableAttributeArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiableAttributeArguments)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeDiffKind: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeDiffKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeDiffKind(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeDiffKind` replaced.
  /// - param newChild: The new `garbageBeforeDiffKind` to replace the node's
  ///                   current `garbageBeforeDiffKind`, if present.
  public func withGarbageBeforeDiffKind(
    _ newChild: GarbageNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeDiffKind)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var diffKind: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.diffKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDiffKind(value)
    }
  }

  /// Returns a copy of the receiver with its `diffKind` replaced.
  /// - param newChild: The new `diffKind` to replace the node's
  ///                   current `diffKind`, if present.
  public func withDiffKind(
    _ newChild: TokenSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffKind)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenDiffKindAndDiffKindComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDiffKindAndDiffKindComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDiffKindAndDiffKindComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDiffKindAndDiffKindComma` replaced.
  /// - param newChild: The new `garbageBetweenDiffKindAndDiffKindComma` to replace the node's
  ///                   current `garbageBetweenDiffKindAndDiffKindComma`, if present.
  public func withGarbageBetweenDiffKindAndDiffKindComma(
    _ newChild: GarbageNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDiffKindAndDiffKindComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The comma following the differentiability kind, if it exists.
  /// 
  public var diffKindComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.diffKindComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDiffKindComma(value)
    }
  }

  /// Returns a copy of the receiver with its `diffKindComma` replaced.
  /// - param newChild: The new `diffKindComma` to replace the node's
  ///                   current `diffKindComma`, if present.
  public func withDiffKindComma(
    _ newChild: TokenSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffKindComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenDiffKindCommaAndDiffParams: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDiffKindCommaAndDiffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDiffKindCommaAndDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDiffKindCommaAndDiffParams` replaced.
  /// - param newChild: The new `garbageBetweenDiffKindCommaAndDiffParams` to replace the node's
  ///                   current `garbageBetweenDiffKindCommaAndDiffParams`, if present.
  public func withGarbageBetweenDiffKindCommaAndDiffParams(
    _ newChild: GarbageNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDiffKindCommaAndDiffParams)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var diffParams: DifferentiabilityParamsClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.diffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DifferentiabilityParamsClauseSyntax(childData!)
    }
    set(value) {
      self = withDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `diffParams` replaced.
  /// - param newChild: The new `diffParams` to replace the node's
  ///                   current `diffParams`, if present.
  public func withDiffParams(
    _ newChild: DifferentiabilityParamsClauseSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffParams)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenDiffParamsAndDiffParamsComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDiffParamsAndDiffParamsComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDiffParamsAndDiffParamsComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDiffParamsAndDiffParamsComma` replaced.
  /// - param newChild: The new `garbageBetweenDiffParamsAndDiffParamsComma` to replace the node's
  ///                   current `garbageBetweenDiffParamsAndDiffParamsComma`, if present.
  public func withGarbageBetweenDiffParamsAndDiffParamsComma(
    _ newChild: GarbageNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDiffParamsAndDiffParamsComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The comma following the differentiability parameters clause,
  /// if it exists.
  /// 
  public var diffParamsComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.diffParamsComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDiffParamsComma(value)
    }
  }

  /// Returns a copy of the receiver with its `diffParamsComma` replaced.
  /// - param newChild: The new `diffParamsComma` to replace the node's
  ///                   current `diffParamsComma`, if present.
  public func withDiffParamsComma(
    _ newChild: TokenSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffParamsComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenDiffParamsCommaAndWhereClause: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDiffParamsCommaAndWhereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDiffParamsCommaAndWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDiffParamsCommaAndWhereClause` replaced.
  /// - param newChild: The new `garbageBetweenDiffParamsCommaAndWhereClause` to replace the node's
  ///                   current `garbageBetweenDiffParamsCommaAndWhereClause`, if present.
  public func withGarbageBetweenDiffParamsCommaAndWhereClause(
    _ newChild: GarbageNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDiffParamsCommaAndWhereClause)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var whereClause: GenericWhereClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.whereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GenericWhereClauseSyntax(childData!)
    }
    set(value) {
      self = withWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.whereClause)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 10)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is DifferentiabilityParamsClauseSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DifferentiabilityParamsClauseSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is GenericWhereClauseSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GenericWhereClauseSyntax.self))
    }
  }
}

extension DifferentiableAttributeArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeDiffKind": garbageBeforeDiffKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffKind": diffKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDiffKindAndDiffKindComma": garbageBetweenDiffKindAndDiffKindComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffKindComma": diffKindComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDiffKindCommaAndDiffParams": garbageBetweenDiffKindCommaAndDiffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParams": diffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDiffParamsAndDiffParamsComma": garbageBetweenDiffParamsAndDiffParamsComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParamsComma": diffParamsComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDiffParamsCommaAndWhereClause": garbageBetweenDiffParamsCommaAndWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereClause": whereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DifferentiabilityParamsClauseSyntax

/// A clause containing differentiability parameters.
public struct DifferentiabilityParamsClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeWrtLabel
    case wrtLabel
    case garbageBetweenWrtLabelAndColon
    case colon
    case garbageBetweenColonAndParameters
    case parameters
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiabilityParamsClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiabilityParamsClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiabilityParamsClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiabilityParamsClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeWrtLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeWrtLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeWrtLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeWrtLabel` replaced.
  /// - param newChild: The new `garbageBeforeWrtLabel` to replace the node's
  ///                   current `garbageBeforeWrtLabel`, if present.
  public func withGarbageBeforeWrtLabel(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeWrtLabel)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  /// The "wrt" label.
  public var wrtLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.wrtLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWrtLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `wrtLabel` replaced.
  /// - param newChild: The new `wrtLabel` to replace the node's
  ///                   current `wrtLabel`, if present.
  public func withWrtLabel(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.wrtLabel)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  public var garbageBetweenWrtLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenWrtLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenWrtLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenWrtLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenWrtLabelAndColon` to replace the node's
  ///                   current `garbageBetweenWrtLabelAndColon`, if present.
  public func withGarbageBetweenWrtLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenWrtLabelAndColon)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  /// 
  /// The colon separating "wrt" and the parameter list.
  /// 
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  public var garbageBetweenColonAndParameters: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndParameters,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndParameters(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndParameters` replaced.
  /// - param newChild: The new `garbageBetweenColonAndParameters` to replace the node's
  ///                   current `garbageBetweenColonAndParameters`, if present.
  public func withGarbageBetweenColonAndParameters(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndParameters)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  public var parameters: Syntax {
    get {
      let childData = data.child(at: Cursor.parameters,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withParameters(value)
    }
  }

  /// Returns a copy of the receiver with its `parameters` replaced.
  /// - param newChild: The new `parameters` to replace the node's
  ///                   current `parameters`, if present.
  public func withParameters(
    _ newChild: Syntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.parameters)
    return DifferentiabilityParamsClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
  }
}

extension DifferentiabilityParamsClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeWrtLabel": garbageBeforeWrtLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "wrtLabel": Syntax(wrtLabel).asProtocol(SyntaxProtocol.self),
      "garbageBetweenWrtLabelAndColon": garbageBetweenWrtLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndParameters": garbageBetweenColonAndParameters.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameters": Syntax(parameters).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DifferentiabilityParamsSyntax

/// The differentiability parameters.
public struct DifferentiabilityParamsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftParen
    case leftParen
    case garbageBetweenLeftParenAndDiffParams
    case diffParams
    case garbageBetweenDiffParamsAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiabilityParamsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiabilityParams else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiabilityParamsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiabilityParams)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftParen` replaced.
  /// - param newChild: The new `garbageBeforeLeftParen` to replace the node's
  ///                   current `garbageBeforeLeftParen`, if present.
  public func withGarbageBeforeLeftParen(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftParen)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var garbageBetweenLeftParenAndDiffParams: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndDiffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndDiffParams` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndDiffParams` to replace the node's
  ///                   current `garbageBetweenLeftParenAndDiffParams`, if present.
  public func withGarbageBetweenLeftParenAndDiffParams(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndDiffParams)
    return DifferentiabilityParamsSyntax(newData)
  }

  /// The parameters for differentiation.
  public var diffParams: DifferentiabilityParamListSyntax {
    get {
      let childData = data.child(at: Cursor.diffParams,
                                 parent: Syntax(self))
      return DifferentiabilityParamListSyntax(childData!)
    }
    set(value) {
      self = withDiffParams(value)
    }
  }

  /// Adds the provided `DifferentiabilityParam` to the node's `diffParams`
  /// collection.
  /// - param element: The new `DifferentiabilityParam` to add to the node's
  ///                  `diffParams` collection.
  /// - returns: A copy of the receiver with the provided `DifferentiabilityParam`
  ///            appended to its `diffParams` collection.
  public func addDifferentiabilityParam(_ element: DifferentiabilityParamSyntax) -> DifferentiabilityParamsSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.diffParams] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.differentiabilityParamList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.diffParams)
    return DifferentiabilityParamsSyntax(newData)
  }

  /// Returns a copy of the receiver with its `diffParams` replaced.
  /// - param newChild: The new `diffParams` to replace the node's
  ///                   current `diffParams`, if present.
  public func withDiffParams(
    _ newChild: DifferentiabilityParamListSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.differentiabilityParamList)
    let newData = data.replacingChild(raw, at: Cursor.diffParams)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var garbageBetweenDiffParamsAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDiffParamsAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDiffParamsAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDiffParamsAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenDiffParamsAndRightParen` to replace the node's
  ///                   current `garbageBetweenDiffParamsAndRightParen`, if present.
  public func withGarbageBetweenDiffParamsAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDiffParamsAndRightParen)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return DifferentiabilityParamsSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is DifferentiabilityParamListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DifferentiabilityParamListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension DifferentiabilityParamsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftParen": garbageBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndDiffParams": garbageBetweenLeftParenAndDiffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParams": Syntax(diffParams).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDiffParamsAndRightParen": garbageBetweenDiffParamsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DifferentiabilityParamSyntax

/// 
/// A differentiability parameter: either the "self" identifier, a function
/// parameter name, or a function parameter index.
/// 
public struct DifferentiabilityParamSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeParameter
    case parameter
    case garbageBetweenParameterAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiabilityParamSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiabilityParam else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiabilityParamSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiabilityParam)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeParameter: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeParameter,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeParameter(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeParameter` replaced.
  /// - param newChild: The new `garbageBeforeParameter` to replace the node's
  ///                   current `garbageBeforeParameter`, if present.
  public func withGarbageBeforeParameter(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeParameter)
    return DifferentiabilityParamSyntax(newData)
  }

  public var parameter: Syntax {
    get {
      let childData = data.child(at: Cursor.parameter,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withParameter(value)
    }
  }

  /// Returns a copy of the receiver with its `parameter` replaced.
  /// - param newChild: The new `parameter` to replace the node's
  ///                   current `parameter`, if present.
  public func withParameter(
    _ newChild: Syntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.parameter)
    return DifferentiabilityParamSyntax(newData)
  }

  public var garbageBetweenParameterAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenParameterAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenParameterAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenParameterAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenParameterAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenParameterAndTrailingComma`, if present.
  public func withGarbageBetweenParameterAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenParameterAndTrailingComma)
    return DifferentiabilityParamSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return DifferentiabilityParamSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension DifferentiabilityParamSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeParameter": garbageBeforeParameter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameter": Syntax(parameter).asProtocol(SyntaxProtocol.self),
      "garbageBetweenParameterAndTrailingComma": garbageBetweenParameterAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DerivativeRegistrationAttributeArgumentsSyntax

/// 
/// The arguments for the '@derivative(of:)' and '@transpose(of:)'
/// attributes: the 'of:' label, the original declaration name, and an
/// optional differentiability parameter list.
/// 
public struct DerivativeRegistrationAttributeArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeOfLabel
    case ofLabel
    case garbageBetweenOfLabelAndColon
    case colon
    case garbageBetweenColonAndOriginalDeclName
    case originalDeclName
    case garbageBetweenOriginalDeclNameAndPeriod
    case period
    case garbageBetweenPeriodAndAccessorKind
    case accessorKind
    case garbageBetweenAccessorKindAndComma
    case comma
    case garbageBetweenCommaAndDiffParams
    case diffParams
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DerivativeRegistrationAttributeArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .derivativeRegistrationAttributeArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DerivativeRegistrationAttributeArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .derivativeRegistrationAttributeArguments)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeOfLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeOfLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeOfLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeOfLabel` replaced.
  /// - param newChild: The new `garbageBeforeOfLabel` to replace the node's
  ///                   current `garbageBeforeOfLabel`, if present.
  public func withGarbageBeforeOfLabel(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeOfLabel)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// The "of" label.
  public var ofLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.ofLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOfLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `ofLabel` replaced.
  /// - param newChild: The new `ofLabel` to replace the node's
  ///                   current `ofLabel`, if present.
  public func withOfLabel(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.ofLabel)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenOfLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenOfLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenOfLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenOfLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenOfLabelAndColon` to replace the node's
  ///                   current `garbageBetweenOfLabelAndColon`, if present.
  public func withGarbageBetweenOfLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenOfLabelAndColon)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The colon separating the "of" label and the original
  /// declaration name.
  /// 
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenColonAndOriginalDeclName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndOriginalDeclName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndOriginalDeclName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndOriginalDeclName` replaced.
  /// - param newChild: The new `garbageBetweenColonAndOriginalDeclName` to replace the node's
  ///                   current `garbageBetweenColonAndOriginalDeclName`, if present.
  public func withGarbageBetweenColonAndOriginalDeclName(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndOriginalDeclName)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// The referenced original declaration name.
  public var originalDeclName: QualifiedDeclNameSyntax {
    get {
      let childData = data.child(at: Cursor.originalDeclName,
                                 parent: Syntax(self))
      return QualifiedDeclNameSyntax(childData!)
    }
    set(value) {
      self = withOriginalDeclName(value)
    }
  }

  /// Returns a copy of the receiver with its `originalDeclName` replaced.
  /// - param newChild: The new `originalDeclName` to replace the node's
  ///                   current `originalDeclName`, if present.
  public func withOriginalDeclName(
    _ newChild: QualifiedDeclNameSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.qualifiedDeclName)
    let newData = data.replacingChild(raw, at: Cursor.originalDeclName)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenOriginalDeclNameAndPeriod: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenOriginalDeclNameAndPeriod,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenOriginalDeclNameAndPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenOriginalDeclNameAndPeriod` replaced.
  /// - param newChild: The new `garbageBetweenOriginalDeclNameAndPeriod` to replace the node's
  ///                   current `garbageBetweenOriginalDeclNameAndPeriod`, if present.
  public func withGarbageBetweenOriginalDeclNameAndPeriod(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenOriginalDeclNameAndPeriod)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The period separating the original declaration name and the
  /// accessor name.
  /// 
  public var period: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.period,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `period` replaced.
  /// - param newChild: The new `period` to replace the node's
  ///                   current `period`, if present.
  public func withPeriod(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.period)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenPeriodAndAccessorKind: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPeriodAndAccessorKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPeriodAndAccessorKind(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPeriodAndAccessorKind` replaced.
  /// - param newChild: The new `garbageBetweenPeriodAndAccessorKind` to replace the node's
  ///                   current `garbageBetweenPeriodAndAccessorKind`, if present.
  public func withGarbageBetweenPeriodAndAccessorKind(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPeriodAndAccessorKind)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// The accessor name.
  public var accessorKind: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.accessorKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAccessorKind(value)
    }
  }

  /// Returns a copy of the receiver with its `accessorKind` replaced.
  /// - param newChild: The new `accessorKind` to replace the node's
  ///                   current `accessorKind`, if present.
  public func withAccessorKind(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.accessorKind)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenAccessorKindAndComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAccessorKindAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAccessorKindAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAccessorKindAndComma` replaced.
  /// - param newChild: The new `garbageBetweenAccessorKindAndComma` to replace the node's
  ///                   current `garbageBetweenAccessorKindAndComma`, if present.
  public func withGarbageBetweenAccessorKindAndComma(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAccessorKindAndComma)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var comma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var garbageBetweenCommaAndDiffParams: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCommaAndDiffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCommaAndDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCommaAndDiffParams` replaced.
  /// - param newChild: The new `garbageBetweenCommaAndDiffParams` to replace the node's
  ///                   current `garbageBetweenCommaAndDiffParams`, if present.
  public func withGarbageBetweenCommaAndDiffParams(
    _ newChild: GarbageNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCommaAndDiffParams)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var diffParams: DifferentiabilityParamsClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.diffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DifferentiabilityParamsClauseSyntax(childData!)
    }
    set(value) {
      self = withDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `diffParams` replaced.
  /// - param newChild: The new `diffParams` to replace the node's
  ///                   current `diffParams`, if present.
  public func withDiffParams(
    _ newChild: DifferentiabilityParamsClauseSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffParams)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 14)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is QualifiedDeclNameSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(QualifiedDeclNameSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is TokenSyntax or missing
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #12 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[12].raw {
      let info = rawChildren[12].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #13 child is DifferentiabilityParamsClauseSyntax or missing
    if let raw = rawChildren[13].raw {
      let info = rawChildren[13].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DifferentiabilityParamsClauseSyntax.self))
    }
  }
}

extension DerivativeRegistrationAttributeArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeOfLabel": garbageBeforeOfLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ofLabel": Syntax(ofLabel).asProtocol(SyntaxProtocol.self),
      "garbageBetweenOfLabelAndColon": garbageBetweenOfLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndOriginalDeclName": garbageBetweenColonAndOriginalDeclName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "originalDeclName": Syntax(originalDeclName).asProtocol(SyntaxProtocol.self),
      "garbageBetweenOriginalDeclNameAndPeriod": garbageBetweenOriginalDeclNameAndPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "period": period.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenPeriodAndAccessorKind": garbageBetweenPeriodAndAccessorKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessorKind": accessorKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAccessorKindAndComma": garbageBetweenAccessorKindAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": comma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenCommaAndDiffParams": garbageBetweenCommaAndDiffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParams": diffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - QualifiedDeclNameSyntax

/// 
/// An optionally qualified function declaration name (e.g. `+(_:_:)`,
/// `A.B.C.foo(_:_:)`).
/// 
public struct QualifiedDeclNameSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeBaseType
    case baseType
    case garbageBetweenBaseTypeAndDot
    case dot
    case garbageBetweenDotAndName
    case name
    case garbageBetweenNameAndArguments
    case arguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `QualifiedDeclNameSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .qualifiedDeclName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `QualifiedDeclNameSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .qualifiedDeclName)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeBaseType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeBaseType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeBaseType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeBaseType` replaced.
  /// - param newChild: The new `garbageBeforeBaseType` to replace the node's
  ///                   current `garbageBeforeBaseType`, if present.
  public func withGarbageBeforeBaseType(
    _ newChild: GarbageNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeBaseType)
    return QualifiedDeclNameSyntax(newData)
  }

  /// 
  /// The base type of the qualified name, optionally specified.
  /// 
  public var baseType: TypeSyntax? {
    get {
      let childData = data.child(at: Cursor.baseType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withBaseType(value)
    }
  }

  /// Returns a copy of the receiver with its `baseType` replaced.
  /// - param newChild: The new `baseType` to replace the node's
  ///                   current `baseType`, if present.
  public func withBaseType(
    _ newChild: TypeSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.baseType)
    return QualifiedDeclNameSyntax(newData)
  }

  public var garbageBetweenBaseTypeAndDot: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenBaseTypeAndDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenBaseTypeAndDot(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenBaseTypeAndDot` replaced.
  /// - param newChild: The new `garbageBetweenBaseTypeAndDot` to replace the node's
  ///                   current `garbageBetweenBaseTypeAndDot`, if present.
  public func withGarbageBetweenBaseTypeAndDot(
    _ newChild: GarbageNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenBaseTypeAndDot)
    return QualifiedDeclNameSyntax(newData)
  }

  public var dot: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.dot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDot(value)
    }
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.dot)
    return QualifiedDeclNameSyntax(newData)
  }

  public var garbageBetweenDotAndName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDotAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDotAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDotAndName` replaced.
  /// - param newChild: The new `garbageBetweenDotAndName` to replace the node's
  ///                   current `garbageBetweenDotAndName`, if present.
  public func withGarbageBetweenDotAndName(
    _ newChild: GarbageNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDotAndName)
    return QualifiedDeclNameSyntax(newData)
  }

  /// 
  /// The base name of the referenced function.
  /// 
  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return QualifiedDeclNameSyntax(newData)
  }

  public var garbageBetweenNameAndArguments: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndArguments` replaced.
  /// - param newChild: The new `garbageBetweenNameAndArguments` to replace the node's
  ///                   current `garbageBetweenNameAndArguments`, if present.
  public func withGarbageBetweenNameAndArguments(
    _ newChild: GarbageNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndArguments)
    return QualifiedDeclNameSyntax(newData)
  }

  /// 
  /// The argument labels of the referenced function, optionally
  /// specified.
  /// 
  public var arguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return QualifiedDeclNameSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is DeclNameArgumentsSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclNameArgumentsSyntax.self))
    }
  }
}

extension QualifiedDeclNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeBaseType": garbageBeforeBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": baseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenBaseTypeAndDot": garbageBetweenBaseTypeAndDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "dot": dot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenDotAndName": garbageBetweenDotAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndArguments": garbageBetweenNameAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": arguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - FunctionDeclNameSyntax

/// A function declaration name (e.g. `foo(_:_:)`).
public struct FunctionDeclNameSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndArguments
    case arguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionDeclNameSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionDeclName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `FunctionDeclNameSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionDeclName)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return FunctionDeclNameSyntax(newData)
  }

  /// 
  /// The base name of the referenced function.
  /// 
  public var name: Syntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: Syntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return FunctionDeclNameSyntax(newData)
  }

  public var garbageBetweenNameAndArguments: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndArguments` replaced.
  /// - param newChild: The new `garbageBetweenNameAndArguments` to replace the node's
  ///                   current `garbageBetweenNameAndArguments`, if present.
  public func withGarbageBetweenNameAndArguments(
    _ newChild: GarbageNodesSyntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndArguments)
    return FunctionDeclNameSyntax(newData)
  }

  /// 
  /// The argument labels of the referenced function, optionally
  /// specified.
  /// 
  public var arguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return FunctionDeclNameSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is DeclNameArgumentsSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(DeclNameArgumentsSyntax.self))
    }
  }
}

extension FunctionDeclNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndArguments": garbageBetweenNameAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": arguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - BackDeployAttributeSpecListSyntax

/// 
/// A collection of arguments for the `@_backDeploy` attribute
/// 
public struct BackDeployAttributeSpecListSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeBeforeLabel
    case beforeLabel
    case garbageBetweenBeforeLabelAndColon
    case colon
    case garbageBetweenColonAndVersionList
    case versionList
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `BackDeployAttributeSpecListSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .backDeployAttributeSpecList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `BackDeployAttributeSpecListSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .backDeployAttributeSpecList)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeBeforeLabel` to replace the node's
  ///                   current `garbageBeforeBeforeLabel`, if present.
  public func withGarbageBeforeBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeBeforeLabel)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// The "before" label.
  public var beforeLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.beforeLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `beforeLabel` replaced.
  /// - param newChild: The new `beforeLabel` to replace the node's
  ///                   current `beforeLabel`, if present.
  public func withBeforeLabel(
    _ newChild: TokenSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.beforeLabel)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  public var garbageBetweenBeforeLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenBeforeLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenBeforeLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenBeforeLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenBeforeLabelAndColon` to replace the node's
  ///                   current `garbageBetweenBeforeLabelAndColon`, if present.
  public func withGarbageBetweenBeforeLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenBeforeLabelAndColon)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// 
  /// The colon separating "before" and the parameter list.
  /// 
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  public var garbageBetweenColonAndVersionList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndVersionList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndVersionList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndVersionList` replaced.
  /// - param newChild: The new `garbageBetweenColonAndVersionList` to replace the node's
  ///                   current `garbageBetweenColonAndVersionList`, if present.
  public func withGarbageBetweenColonAndVersionList(
    _ newChild: GarbageNodesSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndVersionList)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// 
  /// The list of OS versions in which the declaration became ABI
  /// stable.
  /// 
  public var versionList: BackDeployVersionListSyntax {
    get {
      let childData = data.child(at: Cursor.versionList,
                                 parent: Syntax(self))
      return BackDeployVersionListSyntax(childData!)
    }
    set(value) {
      self = withVersionList(value)
    }
  }

  /// Adds the provided `Availability` to the node's `versionList`
  /// collection.
  /// - param element: The new `Availability` to add to the node's
  ///                  `versionList` collection.
  /// - returns: A copy of the receiver with the provided `Availability`
  ///            appended to its `versionList` collection.
  public func addAvailability(_ element: BackDeployVersionArgumentSyntax) -> BackDeployAttributeSpecListSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.versionList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.backDeployVersionList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.versionList)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// Returns a copy of the receiver with its `versionList` replaced.
  /// - param newChild: The new `versionList` to replace the node's
  ///                   current `versionList`, if present.
  public func withVersionList(
    _ newChild: BackDeployVersionListSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.backDeployVersionList)
    let newData = data.replacingChild(raw, at: Cursor.versionList)
    return BackDeployAttributeSpecListSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is BackDeployVersionListSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(BackDeployVersionListSyntax.self))
    }
  }
}

extension BackDeployAttributeSpecListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeBeforeLabel": garbageBeforeBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "beforeLabel": Syntax(beforeLabel).asProtocol(SyntaxProtocol.self),
      "garbageBetweenBeforeLabelAndColon": garbageBetweenBeforeLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndVersionList": garbageBetweenColonAndVersionList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "versionList": Syntax(versionList).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - BackDeployVersionArgumentSyntax

/// 
/// A single platform/version pair in a `@_backDeploy` attribute,
/// e.g. `iOS 10.1`.
/// 
public struct BackDeployVersionArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAvailabilityVersionRestriction
    case availabilityVersionRestriction
    case garbageBetweenAvailabilityVersionRestrictionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `BackDeployVersionArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .backDeployVersionArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `BackDeployVersionArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .backDeployVersionArgument)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAvailabilityVersionRestriction: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAvailabilityVersionRestriction,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAvailabilityVersionRestriction(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAvailabilityVersionRestriction` replaced.
  /// - param newChild: The new `garbageBeforeAvailabilityVersionRestriction` to replace the node's
  ///                   current `garbageBeforeAvailabilityVersionRestriction`, if present.
  public func withGarbageBeforeAvailabilityVersionRestriction(
    _ newChild: GarbageNodesSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAvailabilityVersionRestriction)
    return BackDeployVersionArgumentSyntax(newData)
  }

  public var availabilityVersionRestriction: AvailabilityVersionRestrictionSyntax {
    get {
      let childData = data.child(at: Cursor.availabilityVersionRestriction,
                                 parent: Syntax(self))
      return AvailabilityVersionRestrictionSyntax(childData!)
    }
    set(value) {
      self = withAvailabilityVersionRestriction(value)
    }
  }

  /// Returns a copy of the receiver with its `availabilityVersionRestriction` replaced.
  /// - param newChild: The new `availabilityVersionRestriction` to replace the node's
  ///                   current `availabilityVersionRestriction`, if present.
  public func withAvailabilityVersionRestriction(
    _ newChild: AvailabilityVersionRestrictionSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.availabilityVersionRestriction)
    let newData = data.replacingChild(raw, at: Cursor.availabilityVersionRestriction)
    return BackDeployVersionArgumentSyntax(newData)
  }

  public var garbageBetweenAvailabilityVersionRestrictionAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAvailabilityVersionRestrictionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAvailabilityVersionRestrictionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAvailabilityVersionRestrictionAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenAvailabilityVersionRestrictionAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenAvailabilityVersionRestrictionAndTrailingComma`, if present.
  public func withGarbageBetweenAvailabilityVersionRestrictionAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAvailabilityVersionRestrictionAndTrailingComma)
    return BackDeployVersionArgumentSyntax(newData)
  }

  /// 
  /// A trailing comma if the argument is followed by another
  /// argument
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return BackDeployVersionArgumentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is AvailabilityVersionRestrictionSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AvailabilityVersionRestrictionSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension BackDeployVersionArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAvailabilityVersionRestriction": garbageBeforeAvailabilityVersionRestriction.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilityVersionRestriction": Syntax(availabilityVersionRestriction).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAvailabilityVersionRestrictionAndTrailingComma": garbageBetweenAvailabilityVersionRestrictionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - WhereClauseSyntax

public struct WhereClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeWhereKeyword
    case whereKeyword
    case garbageBetweenWhereKeywordAndGuardResult
    case guardResult
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `WhereClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .whereClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `WhereClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .whereClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeWhereKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeWhereKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeWhereKeyword` replaced.
  /// - param newChild: The new `garbageBeforeWhereKeyword` to replace the node's
  ///                   current `garbageBeforeWhereKeyword`, if present.
  public func withGarbageBeforeWhereKeyword(
    _ newChild: GarbageNodesSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeWhereKeyword)
    return WhereClauseSyntax(newData)
  }

  public var whereKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.whereKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `whereKeyword` replaced.
  /// - param newChild: The new `whereKeyword` to replace the node's
  ///                   current `whereKeyword`, if present.
  public func withWhereKeyword(
    _ newChild: TokenSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.whereKeyword)
    let newData = data.replacingChild(raw, at: Cursor.whereKeyword)
    return WhereClauseSyntax(newData)
  }

  public var garbageBetweenWhereKeywordAndGuardResult: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenWhereKeywordAndGuardResult,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenWhereKeywordAndGuardResult(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenWhereKeywordAndGuardResult` replaced.
  /// - param newChild: The new `garbageBetweenWhereKeywordAndGuardResult` to replace the node's
  ///                   current `garbageBetweenWhereKeywordAndGuardResult`, if present.
  public func withGarbageBetweenWhereKeywordAndGuardResult(
    _ newChild: GarbageNodesSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenWhereKeywordAndGuardResult)
    return WhereClauseSyntax(newData)
  }

  public var guardResult: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.guardResult,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withGuardResult(value)
    }
  }

  /// Returns a copy of the receiver with its `guardResult` replaced.
  /// - param newChild: The new `guardResult` to replace the node's
  ///                   current `guardResult`, if present.
  public func withGuardResult(
    _ newChild: ExprSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingExpr)
    let newData = data.replacingChild(raw, at: Cursor.guardResult)
    return WhereClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ExprSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprSyntax.self))
    }
  }
}

extension WhereClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeWhereKeyword": garbageBeforeWhereKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereKeyword": Syntax(whereKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenWhereKeywordAndGuardResult": garbageBetweenWhereKeywordAndGuardResult.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "guardResult": Syntax(guardResult).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - YieldListSyntax

public struct YieldListSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftParen
    case leftParen
    case garbageBetweenLeftParenAndElementList
    case elementList
    case garbageBetweenElementListAndTrailingComma
    case trailingComma
    case garbageBetweenTrailingCommaAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `YieldListSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .yieldList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `YieldListSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .yieldList)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftParen` replaced.
  /// - param newChild: The new `garbageBeforeLeftParen` to replace the node's
  ///                   current `garbageBeforeLeftParen`, if present.
  public func withGarbageBeforeLeftParen(
    _ newChild: GarbageNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftParen)
    return YieldListSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return YieldListSyntax(newData)
  }

  public var garbageBetweenLeftParenAndElementList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndElementList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndElementList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndElementList` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndElementList` to replace the node's
  ///                   current `garbageBetweenLeftParenAndElementList`, if present.
  public func withGarbageBetweenLeftParenAndElementList(
    _ newChild: GarbageNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndElementList)
    return YieldListSyntax(newData)
  }

  public var elementList: ExprListSyntax {
    get {
      let childData = data.child(at: Cursor.elementList,
                                 parent: Syntax(self))
      return ExprListSyntax(childData!)
    }
    set(value) {
      self = withElementList(value)
    }
  }

  /// Adds the provided `Element` to the node's `elementList`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elementList` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elementList` collection.
  public func addElement(_ element: ExprSyntax) -> YieldListSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elementList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.exprList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.elementList)
    return YieldListSyntax(newData)
  }

  /// Returns a copy of the receiver with its `elementList` replaced.
  /// - param newChild: The new `elementList` to replace the node's
  ///                   current `elementList`, if present.
  public func withElementList(
    _ newChild: ExprListSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.exprList)
    let newData = data.replacingChild(raw, at: Cursor.elementList)
    return YieldListSyntax(newData)
  }

  public var garbageBetweenElementListAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenElementListAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenElementListAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenElementListAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenElementListAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenElementListAndTrailingComma`, if present.
  public func withGarbageBetweenElementListAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenElementListAndTrailingComma)
    return YieldListSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return YieldListSyntax(newData)
  }

  public var garbageBetweenTrailingCommaAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTrailingCommaAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTrailingCommaAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTrailingCommaAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenTrailingCommaAndRightParen` to replace the node's
  ///                   current `garbageBetweenTrailingCommaAndRightParen`, if present.
  public func withGarbageBetweenTrailingCommaAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTrailingCommaAndRightParen)
    return YieldListSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return YieldListSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is ExprListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(ExprListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension YieldListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftParen": garbageBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndElementList": garbageBetweenLeftParenAndElementList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elementList": Syntax(elementList).asProtocol(SyntaxProtocol.self),
      "garbageBetweenElementListAndTrailingComma": garbageBetweenElementListAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenTrailingCommaAndRightParen": garbageBetweenTrailingCommaAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ConditionElementSyntax

public struct ConditionElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeCondition
    case condition
    case garbageBetweenConditionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ConditionElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .conditionElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ConditionElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .conditionElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeCondition: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeCondition,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeCondition` replaced.
  /// - param newChild: The new `garbageBeforeCondition` to replace the node's
  ///                   current `garbageBeforeCondition`, if present.
  public func withGarbageBeforeCondition(
    _ newChild: GarbageNodesSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeCondition)
    return ConditionElementSyntax(newData)
  }

  public var condition: Syntax {
    get {
      let childData = data.child(at: Cursor.condition,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: Syntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.condition)
    return ConditionElementSyntax(newData)
  }

  public var garbageBetweenConditionAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenConditionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenConditionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenConditionAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenConditionAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenConditionAndTrailingComma`, if present.
  public func withGarbageBetweenConditionAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenConditionAndTrailingComma)
    return ConditionElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ConditionElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension ConditionElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeCondition": garbageBeforeCondition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "condition": Syntax(condition).asProtocol(SyntaxProtocol.self),
      "garbageBetweenConditionAndTrailingComma": garbageBetweenConditionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityConditionSyntax

public struct AvailabilityConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePoundAvailableKeyword
    case poundAvailableKeyword
    case garbageBetweenPoundAvailableKeywordAndLeftParen
    case leftParen
    case garbageBetweenLeftParenAndAvailabilitySpec
    case availabilitySpec
    case garbageBetweenAvailabilitySpecAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityCondition)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePoundAvailableKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePoundAvailableKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePoundAvailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePoundAvailableKeyword` replaced.
  /// - param newChild: The new `garbageBeforePoundAvailableKeyword` to replace the node's
  ///                   current `garbageBeforePoundAvailableKeyword`, if present.
  public func withGarbageBeforePoundAvailableKeyword(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePoundAvailableKeyword)
    return AvailabilityConditionSyntax(newData)
  }

  public var poundAvailableKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.poundAvailableKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundAvailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `poundAvailableKeyword` replaced.
  /// - param newChild: The new `poundAvailableKeyword` to replace the node's
  ///                   current `poundAvailableKeyword`, if present.
  public func withPoundAvailableKeyword(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.poundAvailableKeyword)
    let newData = data.replacingChild(raw, at: Cursor.poundAvailableKeyword)
    return AvailabilityConditionSyntax(newData)
  }

  public var garbageBetweenPoundAvailableKeywordAndLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPoundAvailableKeywordAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPoundAvailableKeywordAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPoundAvailableKeywordAndLeftParen` replaced.
  /// - param newChild: The new `garbageBetweenPoundAvailableKeywordAndLeftParen` to replace the node's
  ///                   current `garbageBetweenPoundAvailableKeywordAndLeftParen`, if present.
  public func withGarbageBetweenPoundAvailableKeywordAndLeftParen(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPoundAvailableKeywordAndLeftParen)
    return AvailabilityConditionSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return AvailabilityConditionSyntax(newData)
  }

  public var garbageBetweenLeftParenAndAvailabilitySpec: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndAvailabilitySpec,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndAvailabilitySpec(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndAvailabilitySpec` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndAvailabilitySpec` to replace the node's
  ///                   current `garbageBetweenLeftParenAndAvailabilitySpec`, if present.
  public func withGarbageBetweenLeftParenAndAvailabilitySpec(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndAvailabilitySpec)
    return AvailabilityConditionSyntax(newData)
  }

  public var availabilitySpec: AvailabilitySpecListSyntax {
    get {
      let childData = data.child(at: Cursor.availabilitySpec,
                                 parent: Syntax(self))
      return AvailabilitySpecListSyntax(childData!)
    }
    set(value) {
      self = withAvailabilitySpec(value)
    }
  }

  /// Adds the provided `AvailabilityArgument` to the node's `availabilitySpec`
  /// collection.
  /// - param element: The new `AvailabilityArgument` to add to the node's
  ///                  `availabilitySpec` collection.
  /// - returns: A copy of the receiver with the provided `AvailabilityArgument`
  ///            appended to its `availabilitySpec` collection.
  public func addAvailabilityArgument(_ element: AvailabilityArgumentSyntax) -> AvailabilityConditionSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.availabilitySpec] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.availabilitySpecList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.availabilitySpec)
    return AvailabilityConditionSyntax(newData)
  }

  /// Returns a copy of the receiver with its `availabilitySpec` replaced.
  /// - param newChild: The new `availabilitySpec` to replace the node's
  ///                   current `availabilitySpec`, if present.
  public func withAvailabilitySpec(
    _ newChild: AvailabilitySpecListSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.availabilitySpecList)
    let newData = data.replacingChild(raw, at: Cursor.availabilitySpec)
    return AvailabilityConditionSyntax(newData)
  }

  public var garbageBetweenAvailabilitySpecAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAvailabilitySpecAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAvailabilitySpecAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAvailabilitySpecAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenAvailabilitySpecAndRightParen` to replace the node's
  ///                   current `garbageBetweenAvailabilitySpecAndRightParen`, if present.
  public func withGarbageBetweenAvailabilitySpecAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAvailabilitySpecAndRightParen)
    return AvailabilityConditionSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return AvailabilityConditionSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is AvailabilitySpecListSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AvailabilitySpecListSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension AvailabilityConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePoundAvailableKeyword": garbageBeforePoundAvailableKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundAvailableKeyword": Syntax(poundAvailableKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPoundAvailableKeywordAndLeftParen": garbageBetweenPoundAvailableKeywordAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndAvailabilitySpec": garbageBetweenLeftParenAndAvailabilitySpec.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilitySpec": Syntax(availabilitySpec).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAvailabilitySpecAndRightParen": garbageBetweenAvailabilitySpecAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MatchingPatternConditionSyntax

public struct MatchingPatternConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeCaseKeyword
    case caseKeyword
    case garbageBetweenCaseKeywordAndPattern
    case pattern
    case garbageBetweenPatternAndTypeAnnotation
    case typeAnnotation
    case garbageBetweenTypeAnnotationAndInitializer
    case initializer
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MatchingPatternConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .matchingPatternCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MatchingPatternConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .matchingPatternCondition)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeCaseKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeCaseKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeCaseKeyword` replaced.
  /// - param newChild: The new `garbageBeforeCaseKeyword` to replace the node's
  ///                   current `garbageBeforeCaseKeyword`, if present.
  public func withGarbageBeforeCaseKeyword(
    _ newChild: GarbageNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeCaseKeyword)
    return MatchingPatternConditionSyntax(newData)
  }

  public var caseKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.caseKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.caseKeyword)
    let newData = data.replacingChild(raw, at: Cursor.caseKeyword)
    return MatchingPatternConditionSyntax(newData)
  }

  public var garbageBetweenCaseKeywordAndPattern: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCaseKeywordAndPattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCaseKeywordAndPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCaseKeywordAndPattern` replaced.
  /// - param newChild: The new `garbageBetweenCaseKeywordAndPattern` to replace the node's
  ///                   current `garbageBetweenCaseKeywordAndPattern`, if present.
  public func withGarbageBetweenCaseKeywordAndPattern(
    _ newChild: GarbageNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCaseKeywordAndPattern)
    return MatchingPatternConditionSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingPattern)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return MatchingPatternConditionSyntax(newData)
  }

  public var garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatternAndTypeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatternAndTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatternAndTypeAnnotation` replaced.
  /// - param newChild: The new `garbageBetweenPatternAndTypeAnnotation` to replace the node's
  ///                   current `garbageBetweenPatternAndTypeAnnotation`, if present.
  public func withGarbageBetweenPatternAndTypeAnnotation(
    _ newChild: GarbageNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatternAndTypeAnnotation)
    return MatchingPatternConditionSyntax(newData)
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      let childData = data.child(at: Cursor.typeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeAnnotationSyntax(childData!)
    }
    set(value) {
      self = withTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.typeAnnotation)
    return MatchingPatternConditionSyntax(newData)
  }

  public var garbageBetweenTypeAnnotationAndInitializer: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAnnotationAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAnnotationAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAnnotationAndInitializer` replaced.
  /// - param newChild: The new `garbageBetweenTypeAnnotationAndInitializer` to replace the node's
  ///                   current `garbageBetweenTypeAnnotationAndInitializer`, if present.
  public func withGarbageBetweenTypeAnnotationAndInitializer(
    _ newChild: GarbageNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAnnotationAndInitializer)
    return MatchingPatternConditionSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.initializerClause)
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return MatchingPatternConditionSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is PatternSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PatternSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TypeAnnotationSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeAnnotationSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is InitializerClauseSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InitializerClauseSyntax.self))
    }
  }
}

extension MatchingPatternConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeCaseKeyword": garbageBeforeCaseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseKeyword": Syntax(caseKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenCaseKeywordAndPattern": garbageBetweenCaseKeywordAndPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPatternAndTypeAnnotation": garbageBetweenPatternAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenTypeAnnotationAndInitializer": garbageBetweenTypeAnnotationAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": Syntax(initializer).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - OptionalBindingConditionSyntax

public struct OptionalBindingConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLetOrVarKeyword
    case letOrVarKeyword
    case garbageBetweenLetOrVarKeywordAndPattern
    case pattern
    case garbageBetweenPatternAndTypeAnnotation
    case typeAnnotation
    case garbageBetweenTypeAnnotationAndInitializer
    case initializer
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `OptionalBindingConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .optionalBindingCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `OptionalBindingConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .optionalBindingCondition)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLetOrVarKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLetOrVarKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLetOrVarKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLetOrVarKeyword` replaced.
  /// - param newChild: The new `garbageBeforeLetOrVarKeyword` to replace the node's
  ///                   current `garbageBeforeLetOrVarKeyword`, if present.
  public func withGarbageBeforeLetOrVarKeyword(
    _ newChild: GarbageNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLetOrVarKeyword)
    return OptionalBindingConditionSyntax(newData)
  }

  public var letOrVarKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.letOrVarKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLetOrVarKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `letOrVarKeyword` replaced.
  /// - param newChild: The new `letOrVarKeyword` to replace the node's
  ///                   current `letOrVarKeyword`, if present.
  public func withLetOrVarKeyword(
    _ newChild: TokenSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.letKeyword)
    let newData = data.replacingChild(raw, at: Cursor.letOrVarKeyword)
    return OptionalBindingConditionSyntax(newData)
  }

  public var garbageBetweenLetOrVarKeywordAndPattern: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLetOrVarKeywordAndPattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLetOrVarKeywordAndPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLetOrVarKeywordAndPattern` replaced.
  /// - param newChild: The new `garbageBetweenLetOrVarKeywordAndPattern` to replace the node's
  ///                   current `garbageBetweenLetOrVarKeywordAndPattern`, if present.
  public func withGarbageBetweenLetOrVarKeywordAndPattern(
    _ newChild: GarbageNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLetOrVarKeywordAndPattern)
    return OptionalBindingConditionSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingPattern)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return OptionalBindingConditionSyntax(newData)
  }

  public var garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatternAndTypeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatternAndTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatternAndTypeAnnotation` replaced.
  /// - param newChild: The new `garbageBetweenPatternAndTypeAnnotation` to replace the node's
  ///                   current `garbageBetweenPatternAndTypeAnnotation`, if present.
  public func withGarbageBetweenPatternAndTypeAnnotation(
    _ newChild: GarbageNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatternAndTypeAnnotation)
    return OptionalBindingConditionSyntax(newData)
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      let childData = data.child(at: Cursor.typeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeAnnotationSyntax(childData!)
    }
    set(value) {
      self = withTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.typeAnnotation)
    return OptionalBindingConditionSyntax(newData)
  }

  public var garbageBetweenTypeAnnotationAndInitializer: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAnnotationAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAnnotationAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAnnotationAndInitializer` replaced.
  /// - param newChild: The new `garbageBetweenTypeAnnotationAndInitializer` to replace the node's
  ///                   current `garbageBetweenTypeAnnotationAndInitializer`, if present.
  public func withGarbageBetweenTypeAnnotationAndInitializer(
    _ newChild: GarbageNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAnnotationAndInitializer)
    return OptionalBindingConditionSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return OptionalBindingConditionSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is PatternSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PatternSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TypeAnnotationSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeAnnotationSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is InitializerClauseSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InitializerClauseSyntax.self))
    }
  }
}

extension OptionalBindingConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLetOrVarKeyword": garbageBeforeLetOrVarKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "letOrVarKeyword": Syntax(letOrVarKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLetOrVarKeywordAndPattern": garbageBetweenLetOrVarKeywordAndPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPatternAndTypeAnnotation": garbageBetweenPatternAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenTypeAnnotationAndInitializer": garbageBetweenTypeAnnotationAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - UnavailabilityConditionSyntax

public struct UnavailabilityConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePoundUnavailableKeyword
    case poundUnavailableKeyword
    case garbageBetweenPoundUnavailableKeywordAndLeftParen
    case leftParen
    case garbageBetweenLeftParenAndAvailabilitySpec
    case availabilitySpec
    case garbageBetweenAvailabilitySpecAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `UnavailabilityConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .unavailabilityCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `UnavailabilityConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .unavailabilityCondition)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePoundUnavailableKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePoundUnavailableKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePoundUnavailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePoundUnavailableKeyword` replaced.
  /// - param newChild: The new `garbageBeforePoundUnavailableKeyword` to replace the node's
  ///                   current `garbageBeforePoundUnavailableKeyword`, if present.
  public func withGarbageBeforePoundUnavailableKeyword(
    _ newChild: GarbageNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePoundUnavailableKeyword)
    return UnavailabilityConditionSyntax(newData)
  }

  public var poundUnavailableKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.poundUnavailableKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundUnavailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `poundUnavailableKeyword` replaced.
  /// - param newChild: The new `poundUnavailableKeyword` to replace the node's
  ///                   current `poundUnavailableKeyword`, if present.
  public func withPoundUnavailableKeyword(
    _ newChild: TokenSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.poundUnavailableKeyword)
    let newData = data.replacingChild(raw, at: Cursor.poundUnavailableKeyword)
    return UnavailabilityConditionSyntax(newData)
  }

  public var garbageBetweenPoundUnavailableKeywordAndLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPoundUnavailableKeywordAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPoundUnavailableKeywordAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPoundUnavailableKeywordAndLeftParen` replaced.
  /// - param newChild: The new `garbageBetweenPoundUnavailableKeywordAndLeftParen` to replace the node's
  ///                   current `garbageBetweenPoundUnavailableKeywordAndLeftParen`, if present.
  public func withGarbageBetweenPoundUnavailableKeywordAndLeftParen(
    _ newChild: GarbageNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPoundUnavailableKeywordAndLeftParen)
    return UnavailabilityConditionSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftParen)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return UnavailabilityConditionSyntax(newData)
  }

  public var garbageBetweenLeftParenAndAvailabilitySpec: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndAvailabilitySpec,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndAvailabilitySpec(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndAvailabilitySpec` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndAvailabilitySpec` to replace the node's
  ///                   current `garbageBetweenLeftParenAndAvailabilitySpec`, if present.
  public func withGarbageBetweenLeftParenAndAvailabilitySpec(
    _ newChild: GarbageNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndAvailabilitySpec)
    return UnavailabilityConditionSyntax(newData)
  }

  public var availabilitySpec: AvailabilitySpecListSyntax {
    get {
      let childData = data.child(at: Cursor.availabilitySpec,
                                 parent: Syntax(self))
      return AvailabilitySpecListSyntax(childData!)
    }
    set(value) {
      self = withAvailabilitySpec(value)
    }
  }

  /// Adds the provided `AvailabilityArgument` to the node's `availabilitySpec`
  /// collection.
  /// - param element: The new `AvailabilityArgument` to add to the node's
  ///                  `availabilitySpec` collection.
  /// - returns: A copy of the receiver with the provided `AvailabilityArgument`
  ///            appended to its `availabilitySpec` collection.
  public func addAvailabilityArgument(_ element: AvailabilityArgumentSyntax) -> UnavailabilityConditionSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.availabilitySpec] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.availabilitySpecList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.availabilitySpec)
    return UnavailabilityConditionSyntax(newData)
  }

  /// Returns a copy of the receiver with its `availabilitySpec` replaced.
  /// - param newChild: The new `availabilitySpec` to replace the node's
  ///                   current `availabilitySpec`, if present.
  public func withAvailabilitySpec(
    _ newChild: AvailabilitySpecListSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.availabilitySpecList)
    let newData = data.replacingChild(raw, at: Cursor.availabilitySpec)
    return UnavailabilityConditionSyntax(newData)
  }

  public var garbageBetweenAvailabilitySpecAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAvailabilitySpecAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAvailabilitySpecAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAvailabilitySpecAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenAvailabilitySpecAndRightParen` to replace the node's
  ///                   current `garbageBetweenAvailabilitySpecAndRightParen`, if present.
  public func withGarbageBetweenAvailabilitySpecAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAvailabilitySpecAndRightParen)
    return UnavailabilityConditionSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightParen)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return UnavailabilityConditionSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is AvailabilitySpecListSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AvailabilitySpecListSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax 
    assert(rawChildren[7].raw != nil)
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension UnavailabilityConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePoundUnavailableKeyword": garbageBeforePoundUnavailableKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundUnavailableKeyword": Syntax(poundUnavailableKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPoundUnavailableKeywordAndLeftParen": garbageBetweenPoundUnavailableKeywordAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftParenAndAvailabilitySpec": garbageBetweenLeftParenAndAvailabilitySpec.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilitySpec": Syntax(availabilitySpec).asProtocol(SyntaxProtocol.self),
      "garbageBetweenAvailabilitySpecAndRightParen": garbageBetweenAvailabilitySpecAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ElseIfContinuationSyntax

public struct ElseIfContinuationSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeIfStatement
    case ifStatement
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ElseIfContinuationSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .elseIfContinuation else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ElseIfContinuationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .elseIfContinuation)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeIfStatement: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeIfStatement,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeIfStatement(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeIfStatement` replaced.
  /// - param newChild: The new `garbageBeforeIfStatement` to replace the node's
  ///                   current `garbageBeforeIfStatement`, if present.
  public func withGarbageBeforeIfStatement(
    _ newChild: GarbageNodesSyntax?) -> ElseIfContinuationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeIfStatement)
    return ElseIfContinuationSyntax(newData)
  }

  public var ifStatement: IfStmtSyntax {
    get {
      let childData = data.child(at: Cursor.ifStatement,
                                 parent: Syntax(self))
      return IfStmtSyntax(childData!)
    }
    set(value) {
      self = withIfStatement(value)
    }
  }

  /// Returns a copy of the receiver with its `ifStatement` replaced.
  /// - param newChild: The new `ifStatement` to replace the node's
  ///                   current `ifStatement`, if present.
  public func withIfStatement(
    _ newChild: IfStmtSyntax?) -> ElseIfContinuationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.ifStmt)
    let newData = data.replacingChild(raw, at: Cursor.ifStatement)
    return ElseIfContinuationSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 2)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is IfStmtSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(IfStmtSyntax.self))
    }
  }
}

extension ElseIfContinuationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeIfStatement": garbageBeforeIfStatement.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ifStatement": Syntax(ifStatement).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ElseBlockSyntax

public struct ElseBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeElseKeyword
    case elseKeyword
    case garbageBetweenElseKeywordAndBody
    case body
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ElseBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .elseBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ElseBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .elseBlock)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeElseKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeElseKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeElseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeElseKeyword` replaced.
  /// - param newChild: The new `garbageBeforeElseKeyword` to replace the node's
  ///                   current `garbageBeforeElseKeyword`, if present.
  public func withGarbageBeforeElseKeyword(
    _ newChild: GarbageNodesSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeElseKeyword)
    return ElseBlockSyntax(newData)
  }

  public var elseKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.elseKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withElseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `elseKeyword` replaced.
  /// - param newChild: The new `elseKeyword` to replace the node's
  ///                   current `elseKeyword`, if present.
  public func withElseKeyword(
    _ newChild: TokenSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.elseKeyword)
    let newData = data.replacingChild(raw, at: Cursor.elseKeyword)
    return ElseBlockSyntax(newData)
  }

  public var garbageBetweenElseKeywordAndBody: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenElseKeywordAndBody,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenElseKeywordAndBody(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenElseKeywordAndBody` replaced.
  /// - param newChild: The new `garbageBetweenElseKeywordAndBody` to replace the node's
  ///                   current `garbageBetweenElseKeywordAndBody`, if present.
  public func withGarbageBetweenElseKeywordAndBody(
    _ newChild: GarbageNodesSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenElseKeywordAndBody)
    return ElseBlockSyntax(newData)
  }

  public var body: CodeBlockSyntax {
    get {
      let childData = data.child(at: Cursor.body,
                                 parent: Syntax(self))
      return CodeBlockSyntax(childData!)
    }
    set(value) {
      self = withBody(value)
    }
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.codeBlock)
    let newData = data.replacingChild(raw, at: Cursor.body)
    return ElseBlockSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is CodeBlockSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CodeBlockSyntax.self))
    }
  }
}

extension ElseBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeElseKeyword": garbageBeforeElseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elseKeyword": Syntax(elseKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenElseKeywordAndBody": garbageBetweenElseKeywordAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": Syntax(body).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - SwitchCaseSyntax

public struct SwitchCaseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeUnknownAttr
    case unknownAttr
    case garbageBetweenUnknownAttrAndLabel
    case label
    case garbageBetweenLabelAndStatements
    case statements
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchCaseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchCase else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SwitchCaseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchCase)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeUnknownAttr: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeUnknownAttr,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeUnknownAttr(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeUnknownAttr` replaced.
  /// - param newChild: The new `garbageBeforeUnknownAttr` to replace the node's
  ///                   current `garbageBeforeUnknownAttr`, if present.
  public func withGarbageBeforeUnknownAttr(
    _ newChild: GarbageNodesSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeUnknownAttr)
    return SwitchCaseSyntax(newData)
  }

  public var unknownAttr: AttributeSyntax? {
    get {
      let childData = data.child(at: Cursor.unknownAttr,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeSyntax(childData!)
    }
    set(value) {
      self = withUnknownAttr(value)
    }
  }

  /// Returns a copy of the receiver with its `unknownAttr` replaced.
  /// - param newChild: The new `unknownAttr` to replace the node's
  ///                   current `unknownAttr`, if present.
  public func withUnknownAttr(
    _ newChild: AttributeSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unknownAttr)
    return SwitchCaseSyntax(newData)
  }

  public var garbageBetweenUnknownAttrAndLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenUnknownAttrAndLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenUnknownAttrAndLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenUnknownAttrAndLabel` replaced.
  /// - param newChild: The new `garbageBetweenUnknownAttrAndLabel` to replace the node's
  ///                   current `garbageBetweenUnknownAttrAndLabel`, if present.
  public func withGarbageBetweenUnknownAttrAndLabel(
    _ newChild: GarbageNodesSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenUnknownAttrAndLabel)
    return SwitchCaseSyntax(newData)
  }

  public var label: Syntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: Syntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return SwitchCaseSyntax(newData)
  }

  public var garbageBetweenLabelAndStatements: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndStatements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndStatements` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndStatements` to replace the node's
  ///                   current `garbageBetweenLabelAndStatements`, if present.
  public func withGarbageBetweenLabelAndStatements(
    _ newChild: GarbageNodesSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndStatements)
    return SwitchCaseSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: Cursor.statements,
                                 parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> SwitchCaseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.codeBlockItemList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.statements)
    return SwitchCaseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.codeBlockItemList)
    let newData = data.replacingChild(raw, at: Cursor.statements)
    return SwitchCaseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is AttributeSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AttributeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is Syntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is CodeBlockItemListSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CodeBlockItemListSyntax.self))
    }
  }
}

extension SwitchCaseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeUnknownAttr": garbageBeforeUnknownAttr.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unknownAttr": unknownAttr.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenUnknownAttrAndLabel": garbageBetweenUnknownAttrAndLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLabelAndStatements": garbageBetweenLabelAndStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - SwitchDefaultLabelSyntax

public struct SwitchDefaultLabelSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeDefaultKeyword
    case defaultKeyword
    case garbageBetweenDefaultKeywordAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchDefaultLabelSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchDefaultLabel else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SwitchDefaultLabelSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchDefaultLabel)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeDefaultKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeDefaultKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeDefaultKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeDefaultKeyword` replaced.
  /// - param newChild: The new `garbageBeforeDefaultKeyword` to replace the node's
  ///                   current `garbageBeforeDefaultKeyword`, if present.
  public func withGarbageBeforeDefaultKeyword(
    _ newChild: GarbageNodesSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeDefaultKeyword)
    return SwitchDefaultLabelSyntax(newData)
  }

  public var defaultKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.defaultKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDefaultKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `defaultKeyword` replaced.
  /// - param newChild: The new `defaultKeyword` to replace the node's
  ///                   current `defaultKeyword`, if present.
  public func withDefaultKeyword(
    _ newChild: TokenSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.defaultKeyword)
    let newData = data.replacingChild(raw, at: Cursor.defaultKeyword)
    return SwitchDefaultLabelSyntax(newData)
  }

  public var garbageBetweenDefaultKeywordAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenDefaultKeywordAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenDefaultKeywordAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenDefaultKeywordAndColon` replaced.
  /// - param newChild: The new `garbageBetweenDefaultKeywordAndColon` to replace the node's
  ///                   current `garbageBetweenDefaultKeywordAndColon`, if present.
  public func withGarbageBetweenDefaultKeywordAndColon(
    _ newChild: GarbageNodesSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenDefaultKeywordAndColon)
    return SwitchDefaultLabelSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return SwitchDefaultLabelSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension SwitchDefaultLabelSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeDefaultKeyword": garbageBeforeDefaultKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "defaultKeyword": Syntax(defaultKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenDefaultKeywordAndColon": garbageBetweenDefaultKeywordAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CaseItemSyntax

public struct CaseItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePattern
    case pattern
    case garbageBetweenPatternAndWhereClause
    case whereClause
    case garbageBetweenWhereClauseAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CaseItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .caseItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CaseItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .caseItem)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePattern: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePattern` replaced.
  /// - param newChild: The new `garbageBeforePattern` to replace the node's
  ///                   current `garbageBeforePattern`, if present.
  public func withGarbageBeforePattern(
    _ newChild: GarbageNodesSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePattern)
    return CaseItemSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingPattern)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return CaseItemSyntax(newData)
  }

  public var garbageBetweenPatternAndWhereClause: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatternAndWhereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatternAndWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatternAndWhereClause` replaced.
  /// - param newChild: The new `garbageBetweenPatternAndWhereClause` to replace the node's
  ///                   current `garbageBetweenPatternAndWhereClause`, if present.
  public func withGarbageBetweenPatternAndWhereClause(
    _ newChild: GarbageNodesSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatternAndWhereClause)
    return CaseItemSyntax(newData)
  }

  public var whereClause: WhereClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.whereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return WhereClauseSyntax(childData!)
    }
    set(value) {
      self = withWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.whereClause)
    return CaseItemSyntax(newData)
  }

  public var garbageBetweenWhereClauseAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenWhereClauseAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenWhereClauseAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenWhereClauseAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenWhereClauseAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenWhereClauseAndTrailingComma`, if present.
  public func withGarbageBetweenWhereClauseAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenWhereClauseAndTrailingComma)
    return CaseItemSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return CaseItemSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is PatternSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PatternSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is WhereClauseSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(WhereClauseSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension CaseItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePattern": garbageBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPatternAndWhereClause": garbageBetweenPatternAndWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereClause": whereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenWhereClauseAndTrailingComma": garbageBetweenWhereClauseAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - CatchItemSyntax

public struct CatchItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePattern
    case pattern
    case garbageBetweenPatternAndWhereClause
    case whereClause
    case garbageBetweenWhereClauseAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CatchItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .catchItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CatchItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .catchItem)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePattern: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePattern` replaced.
  /// - param newChild: The new `garbageBeforePattern` to replace the node's
  ///                   current `garbageBeforePattern`, if present.
  public func withGarbageBeforePattern(
    _ newChild: GarbageNodesSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePattern)
    return CatchItemSyntax(newData)
  }

  public var pattern: PatternSyntax? {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return CatchItemSyntax(newData)
  }

  public var garbageBetweenPatternAndWhereClause: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatternAndWhereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatternAndWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatternAndWhereClause` replaced.
  /// - param newChild: The new `garbageBetweenPatternAndWhereClause` to replace the node's
  ///                   current `garbageBetweenPatternAndWhereClause`, if present.
  public func withGarbageBetweenPatternAndWhereClause(
    _ newChild: GarbageNodesSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatternAndWhereClause)
    return CatchItemSyntax(newData)
  }

  public var whereClause: WhereClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.whereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return WhereClauseSyntax(childData!)
    }
    set(value) {
      self = withWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.whereClause)
    return CatchItemSyntax(newData)
  }

  public var garbageBetweenWhereClauseAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenWhereClauseAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenWhereClauseAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenWhereClauseAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenWhereClauseAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenWhereClauseAndTrailingComma`, if present.
  public func withGarbageBetweenWhereClauseAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenWhereClauseAndTrailingComma)
    return CatchItemSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return CatchItemSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is PatternSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PatternSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is WhereClauseSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(WhereClauseSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension CatchItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePattern": garbageBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": pattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenPatternAndWhereClause": garbageBetweenPatternAndWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereClause": whereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenWhereClauseAndTrailingComma": garbageBetweenWhereClauseAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SwitchCaseLabelSyntax

public struct SwitchCaseLabelSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeCaseKeyword
    case caseKeyword
    case garbageBetweenCaseKeywordAndCaseItems
    case caseItems
    case garbageBetweenCaseItemsAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchCaseLabelSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchCaseLabel else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SwitchCaseLabelSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchCaseLabel)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeCaseKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeCaseKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeCaseKeyword` replaced.
  /// - param newChild: The new `garbageBeforeCaseKeyword` to replace the node's
  ///                   current `garbageBeforeCaseKeyword`, if present.
  public func withGarbageBeforeCaseKeyword(
    _ newChild: GarbageNodesSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeCaseKeyword)
    return SwitchCaseLabelSyntax(newData)
  }

  public var caseKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.caseKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.caseKeyword)
    let newData = data.replacingChild(raw, at: Cursor.caseKeyword)
    return SwitchCaseLabelSyntax(newData)
  }

  public var garbageBetweenCaseKeywordAndCaseItems: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCaseKeywordAndCaseItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCaseKeywordAndCaseItems(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCaseKeywordAndCaseItems` replaced.
  /// - param newChild: The new `garbageBetweenCaseKeywordAndCaseItems` to replace the node's
  ///                   current `garbageBetweenCaseKeywordAndCaseItems`, if present.
  public func withGarbageBetweenCaseKeywordAndCaseItems(
    _ newChild: GarbageNodesSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCaseKeywordAndCaseItems)
    return SwitchCaseLabelSyntax(newData)
  }

  public var caseItems: CaseItemListSyntax {
    get {
      let childData = data.child(at: Cursor.caseItems,
                                 parent: Syntax(self))
      return CaseItemListSyntax(childData!)
    }
    set(value) {
      self = withCaseItems(value)
    }
  }

  /// Adds the provided `CaseItem` to the node's `caseItems`
  /// collection.
  /// - param element: The new `CaseItem` to add to the node's
  ///                  `caseItems` collection.
  /// - returns: A copy of the receiver with the provided `CaseItem`
  ///            appended to its `caseItems` collection.
  public func addCaseItem(_ element: CaseItemSyntax) -> SwitchCaseLabelSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.caseItems] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.caseItemList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.caseItems)
    return SwitchCaseLabelSyntax(newData)
  }

  /// Returns a copy of the receiver with its `caseItems` replaced.
  /// - param newChild: The new `caseItems` to replace the node's
  ///                   current `caseItems`, if present.
  public func withCaseItems(
    _ newChild: CaseItemListSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.caseItemList)
    let newData = data.replacingChild(raw, at: Cursor.caseItems)
    return SwitchCaseLabelSyntax(newData)
  }

  public var garbageBetweenCaseItemsAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCaseItemsAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCaseItemsAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCaseItemsAndColon` replaced.
  /// - param newChild: The new `garbageBetweenCaseItemsAndColon` to replace the node's
  ///                   current `garbageBetweenCaseItemsAndColon`, if present.
  public func withGarbageBetweenCaseItemsAndColon(
    _ newChild: GarbageNodesSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCaseItemsAndColon)
    return SwitchCaseLabelSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return SwitchCaseLabelSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is CaseItemListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CaseItemListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension SwitchCaseLabelSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeCaseKeyword": garbageBeforeCaseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseKeyword": Syntax(caseKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenCaseKeywordAndCaseItems": garbageBetweenCaseKeywordAndCaseItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseItems": Syntax(caseItems).asProtocol(SyntaxProtocol.self),
      "garbageBetweenCaseItemsAndColon": garbageBetweenCaseItemsAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CatchClauseSyntax

public struct CatchClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeCatchKeyword
    case catchKeyword
    case garbageBetweenCatchKeywordAndCatchItems
    case catchItems
    case garbageBetweenCatchItemsAndBody
    case body
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CatchClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .catchClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CatchClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .catchClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeCatchKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeCatchKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeCatchKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeCatchKeyword` replaced.
  /// - param newChild: The new `garbageBeforeCatchKeyword` to replace the node's
  ///                   current `garbageBeforeCatchKeyword`, if present.
  public func withGarbageBeforeCatchKeyword(
    _ newChild: GarbageNodesSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeCatchKeyword)
    return CatchClauseSyntax(newData)
  }

  public var catchKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.catchKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCatchKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `catchKeyword` replaced.
  /// - param newChild: The new `catchKeyword` to replace the node's
  ///                   current `catchKeyword`, if present.
  public func withCatchKeyword(
    _ newChild: TokenSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.catchKeyword)
    let newData = data.replacingChild(raw, at: Cursor.catchKeyword)
    return CatchClauseSyntax(newData)
  }

  public var garbageBetweenCatchKeywordAndCatchItems: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCatchKeywordAndCatchItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCatchKeywordAndCatchItems(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCatchKeywordAndCatchItems` replaced.
  /// - param newChild: The new `garbageBetweenCatchKeywordAndCatchItems` to replace the node's
  ///                   current `garbageBetweenCatchKeywordAndCatchItems`, if present.
  public func withGarbageBetweenCatchKeywordAndCatchItems(
    _ newChild: GarbageNodesSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCatchKeywordAndCatchItems)
    return CatchClauseSyntax(newData)
  }

  public var catchItems: CatchItemListSyntax? {
    get {
      let childData = data.child(at: Cursor.catchItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return CatchItemListSyntax(childData!)
    }
    set(value) {
      self = withCatchItems(value)
    }
  }

  /// Adds the provided `CatchItem` to the node's `catchItems`
  /// collection.
  /// - param element: The new `CatchItem` to add to the node's
  ///                  `catchItems` collection.
  /// - returns: A copy of the receiver with the provided `CatchItem`
  ///            appended to its `catchItems` collection.
  public func addCatchItem(_ element: CatchItemSyntax) -> CatchClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.catchItems] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.catchItemList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.catchItems)
    return CatchClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `catchItems` replaced.
  /// - param newChild: The new `catchItems` to replace the node's
  ///                   current `catchItems`, if present.
  public func withCatchItems(
    _ newChild: CatchItemListSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.catchItems)
    return CatchClauseSyntax(newData)
  }

  public var garbageBetweenCatchItemsAndBody: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCatchItemsAndBody,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCatchItemsAndBody(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCatchItemsAndBody` replaced.
  /// - param newChild: The new `garbageBetweenCatchItemsAndBody` to replace the node's
  ///                   current `garbageBetweenCatchItemsAndBody`, if present.
  public func withGarbageBetweenCatchItemsAndBody(
    _ newChild: GarbageNodesSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCatchItemsAndBody)
    return CatchClauseSyntax(newData)
  }

  public var body: CodeBlockSyntax {
    get {
      let childData = data.child(at: Cursor.body,
                                 parent: Syntax(self))
      return CodeBlockSyntax(childData!)
    }
    set(value) {
      self = withBody(value)
    }
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.codeBlock)
    let newData = data.replacingChild(raw, at: Cursor.body)
    return CatchClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is CatchItemListSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CatchItemListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is CodeBlockSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(CodeBlockSyntax.self))
    }
  }
}

extension CatchClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeCatchKeyword": garbageBeforeCatchKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "catchKeyword": Syntax(catchKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenCatchKeywordAndCatchItems": garbageBetweenCatchKeywordAndCatchItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "catchItems": catchItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenCatchItemsAndBody": garbageBetweenCatchItemsAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": Syntax(body).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - GenericWhereClauseSyntax

public struct GenericWhereClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeWhereKeyword
    case whereKeyword
    case garbageBetweenWhereKeywordAndRequirementList
    case requirementList
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericWhereClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericWhereClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericWhereClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericWhereClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeWhereKeyword: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeWhereKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeWhereKeyword` replaced.
  /// - param newChild: The new `garbageBeforeWhereKeyword` to replace the node's
  ///                   current `garbageBeforeWhereKeyword`, if present.
  public func withGarbageBeforeWhereKeyword(
    _ newChild: GarbageNodesSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeWhereKeyword)
    return GenericWhereClauseSyntax(newData)
  }

  public var whereKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.whereKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `whereKeyword` replaced.
  /// - param newChild: The new `whereKeyword` to replace the node's
  ///                   current `whereKeyword`, if present.
  public func withWhereKeyword(
    _ newChild: TokenSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.whereKeyword)
    let newData = data.replacingChild(raw, at: Cursor.whereKeyword)
    return GenericWhereClauseSyntax(newData)
  }

  public var garbageBetweenWhereKeywordAndRequirementList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenWhereKeywordAndRequirementList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenWhereKeywordAndRequirementList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenWhereKeywordAndRequirementList` replaced.
  /// - param newChild: The new `garbageBetweenWhereKeywordAndRequirementList` to replace the node's
  ///                   current `garbageBetweenWhereKeywordAndRequirementList`, if present.
  public func withGarbageBetweenWhereKeywordAndRequirementList(
    _ newChild: GarbageNodesSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenWhereKeywordAndRequirementList)
    return GenericWhereClauseSyntax(newData)
  }

  public var requirementList: GenericRequirementListSyntax {
    get {
      let childData = data.child(at: Cursor.requirementList,
                                 parent: Syntax(self))
      return GenericRequirementListSyntax(childData!)
    }
    set(value) {
      self = withRequirementList(value)
    }
  }

  /// Adds the provided `Requirement` to the node's `requirementList`
  /// collection.
  /// - param element: The new `Requirement` to add to the node's
  ///                  `requirementList` collection.
  /// - returns: A copy of the receiver with the provided `Requirement`
  ///            appended to its `requirementList` collection.
  public func addRequirement(_ element: GenericRequirementSyntax) -> GenericWhereClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.requirementList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.genericRequirementList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.requirementList)
    return GenericWhereClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `requirementList` replaced.
  /// - param newChild: The new `requirementList` to replace the node's
  ///                   current `requirementList`, if present.
  public func withRequirementList(
    _ newChild: GenericRequirementListSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.genericRequirementList)
    let newData = data.replacingChild(raw, at: Cursor.requirementList)
    return GenericWhereClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is GenericRequirementListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GenericRequirementListSyntax.self))
    }
  }
}

extension GenericWhereClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeWhereKeyword": garbageBeforeWhereKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereKeyword": Syntax(whereKeyword).asProtocol(SyntaxProtocol.self),
      "garbageBetweenWhereKeywordAndRequirementList": garbageBetweenWhereKeywordAndRequirementList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "requirementList": Syntax(requirementList).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - GenericRequirementSyntax

public struct GenericRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeBody
    case body
    case garbageBetweenBodyAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericRequirement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeBody: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeBody,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeBody(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeBody` replaced.
  /// - param newChild: The new `garbageBeforeBody` to replace the node's
  ///                   current `garbageBeforeBody`, if present.
  public func withGarbageBeforeBody(
    _ newChild: GarbageNodesSyntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeBody)
    return GenericRequirementSyntax(newData)
  }

  public var body: Syntax {
    get {
      let childData = data.child(at: Cursor.body,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withBody(value)
    }
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: Syntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.body)
    return GenericRequirementSyntax(newData)
  }

  public var garbageBetweenBodyAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenBodyAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenBodyAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenBodyAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenBodyAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenBodyAndTrailingComma`, if present.
  public func withGarbageBetweenBodyAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenBodyAndTrailingComma)
    return GenericRequirementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return GenericRequirementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension GenericRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeBody": garbageBeforeBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": Syntax(body).asProtocol(SyntaxProtocol.self),
      "garbageBetweenBodyAndTrailingComma": garbageBetweenBodyAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SameTypeRequirementSyntax

public struct SameTypeRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftTypeIdentifier
    case leftTypeIdentifier
    case garbageBetweenLeftTypeIdentifierAndEqualityToken
    case equalityToken
    case garbageBetweenEqualityTokenAndRightTypeIdentifier
    case rightTypeIdentifier
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SameTypeRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .sameTypeRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SameTypeRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .sameTypeRequirement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftTypeIdentifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftTypeIdentifier` replaced.
  /// - param newChild: The new `garbageBeforeLeftTypeIdentifier` to replace the node's
  ///                   current `garbageBeforeLeftTypeIdentifier`, if present.
  public func withGarbageBeforeLeftTypeIdentifier(
    _ newChild: GarbageNodesSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }

  public var leftTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.leftTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `leftTypeIdentifier` replaced.
  /// - param newChild: The new `leftTypeIdentifier` to replace the node's
  ///                   current `leftTypeIdentifier`, if present.
  public func withLeftTypeIdentifier(
    _ newChild: TypeSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.leftTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }

  public var garbageBetweenLeftTypeIdentifierAndEqualityToken: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftTypeIdentifierAndEqualityToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftTypeIdentifierAndEqualityToken(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftTypeIdentifierAndEqualityToken` replaced.
  /// - param newChild: The new `garbageBetweenLeftTypeIdentifierAndEqualityToken` to replace the node's
  ///                   current `garbageBetweenLeftTypeIdentifierAndEqualityToken`, if present.
  public func withGarbageBetweenLeftTypeIdentifierAndEqualityToken(
    _ newChild: GarbageNodesSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftTypeIdentifierAndEqualityToken)
    return SameTypeRequirementSyntax(newData)
  }

  public var equalityToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.equalityToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEqualityToken(value)
    }
  }

  /// Returns a copy of the receiver with its `equalityToken` replaced.
  /// - param newChild: The new `equalityToken` to replace the node's
  ///                   current `equalityToken`, if present.
  public func withEqualityToken(
    _ newChild: TokenSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.spacedBinaryOperator(""))
    let newData = data.replacingChild(raw, at: Cursor.equalityToken)
    return SameTypeRequirementSyntax(newData)
  }

  public var garbageBetweenEqualityTokenAndRightTypeIdentifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenEqualityTokenAndRightTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenEqualityTokenAndRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenEqualityTokenAndRightTypeIdentifier` replaced.
  /// - param newChild: The new `garbageBetweenEqualityTokenAndRightTypeIdentifier` to replace the node's
  ///                   current `garbageBetweenEqualityTokenAndRightTypeIdentifier`, if present.
  public func withGarbageBetweenEqualityTokenAndRightTypeIdentifier(
    _ newChild: GarbageNodesSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenEqualityTokenAndRightTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }

  public var rightTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.rightTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `rightTypeIdentifier` replaced.
  /// - param newChild: The new `rightTypeIdentifier` to replace the node's
  ///                   current `rightTypeIdentifier`, if present.
  public func withRightTypeIdentifier(
    _ newChild: TypeSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.rightTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TypeSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
  }
}

extension SameTypeRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftTypeIdentifier": garbageBeforeLeftTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftTypeIdentifier": Syntax(leftTypeIdentifier).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftTypeIdentifierAndEqualityToken": garbageBetweenLeftTypeIdentifierAndEqualityToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "equalityToken": Syntax(equalityToken).asProtocol(SyntaxProtocol.self),
      "garbageBetweenEqualityTokenAndRightTypeIdentifier": garbageBetweenEqualityTokenAndRightTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightTypeIdentifier": Syntax(rightTypeIdentifier).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - LayoutRequirementSyntax

public struct LayoutRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeTypeIdentifier
    case typeIdentifier
    case garbageBetweenTypeIdentifierAndColon
    case colon
    case garbageBetweenColonAndLayoutConstraint
    case layoutConstraint
    case garbageBetweenLayoutConstraintAndLeftParen
    case leftParen
    case garbageBetweenLeftParenAndSize
    case size
    case garbageBetweenSizeAndComma
    case comma
    case garbageBetweenCommaAndAlignment
    case alignment
    case garbageBetweenAlignmentAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `LayoutRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .layoutRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `LayoutRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .layoutRequirement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeTypeIdentifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeTypeIdentifier` replaced.
  /// - param newChild: The new `garbageBeforeTypeIdentifier` to replace the node's
  ///                   current `garbageBeforeTypeIdentifier`, if present.
  public func withGarbageBeforeTypeIdentifier(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeTypeIdentifier)
    return LayoutRequirementSyntax(newData)
  }

  public var typeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.typeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `typeIdentifier` replaced.
  /// - param newChild: The new `typeIdentifier` to replace the node's
  ///                   current `typeIdentifier`, if present.
  public func withTypeIdentifier(
    _ newChild: TypeSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.typeIdentifier)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenTypeIdentifierAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeIdentifierAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeIdentifierAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeIdentifierAndColon` replaced.
  /// - param newChild: The new `garbageBetweenTypeIdentifierAndColon` to replace the node's
  ///                   current `garbageBetweenTypeIdentifierAndColon`, if present.
  public func withGarbageBetweenTypeIdentifierAndColon(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeIdentifierAndColon)
    return LayoutRequirementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenColonAndLayoutConstraint: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndLayoutConstraint,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndLayoutConstraint(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndLayoutConstraint` replaced.
  /// - param newChild: The new `garbageBetweenColonAndLayoutConstraint` to replace the node's
  ///                   current `garbageBetweenColonAndLayoutConstraint`, if present.
  public func withGarbageBetweenColonAndLayoutConstraint(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndLayoutConstraint)
    return LayoutRequirementSyntax(newData)
  }

  public var layoutConstraint: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.layoutConstraint,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLayoutConstraint(value)
    }
  }

  /// Returns a copy of the receiver with its `layoutConstraint` replaced.
  /// - param newChild: The new `layoutConstraint` to replace the node's
  ///                   current `layoutConstraint`, if present.
  public func withLayoutConstraint(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.layoutConstraint)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenLayoutConstraintAndLeftParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLayoutConstraintAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLayoutConstraintAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLayoutConstraintAndLeftParen` replaced.
  /// - param newChild: The new `garbageBetweenLayoutConstraintAndLeftParen` to replace the node's
  ///                   current `garbageBetweenLayoutConstraintAndLeftParen`, if present.
  public func withGarbageBetweenLayoutConstraintAndLeftParen(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLayoutConstraintAndLeftParen)
    return LayoutRequirementSyntax(newData)
  }

  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenLeftParenAndSize: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftParenAndSize,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftParenAndSize(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftParenAndSize` replaced.
  /// - param newChild: The new `garbageBetweenLeftParenAndSize` to replace the node's
  ///                   current `garbageBetweenLeftParenAndSize`, if present.
  public func withGarbageBetweenLeftParenAndSize(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftParenAndSize)
    return LayoutRequirementSyntax(newData)
  }

  public var size: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.size,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSize(value)
    }
  }

  /// Returns a copy of the receiver with its `size` replaced.
  /// - param newChild: The new `size` to replace the node's
  ///                   current `size`, if present.
  public func withSize(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.size)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenSizeAndComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenSizeAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenSizeAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenSizeAndComma` replaced.
  /// - param newChild: The new `garbageBetweenSizeAndComma` to replace the node's
  ///                   current `garbageBetweenSizeAndComma`, if present.
  public func withGarbageBetweenSizeAndComma(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenSizeAndComma)
    return LayoutRequirementSyntax(newData)
  }

  public var comma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenCommaAndAlignment: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenCommaAndAlignment,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenCommaAndAlignment(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenCommaAndAlignment` replaced.
  /// - param newChild: The new `garbageBetweenCommaAndAlignment` to replace the node's
  ///                   current `garbageBetweenCommaAndAlignment`, if present.
  public func withGarbageBetweenCommaAndAlignment(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenCommaAndAlignment)
    return LayoutRequirementSyntax(newData)
  }

  public var alignment: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.alignment,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAlignment(value)
    }
  }

  /// Returns a copy of the receiver with its `alignment` replaced.
  /// - param newChild: The new `alignment` to replace the node's
  ///                   current `alignment`, if present.
  public func withAlignment(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.alignment)
    return LayoutRequirementSyntax(newData)
  }

  public var garbageBetweenAlignmentAndRightParen: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAlignmentAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAlignmentAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAlignmentAndRightParen` replaced.
  /// - param newChild: The new `garbageBetweenAlignmentAndRightParen` to replace the node's
  ///                   current `garbageBetweenAlignmentAndRightParen`, if present.
  public func withGarbageBetweenAlignmentAndRightParen(
    _ newChild: GarbageNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAlignmentAndRightParen)
    return LayoutRequirementSyntax(newData)
  }

  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return LayoutRequirementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 16)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is TokenSyntax or missing
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #12 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[12].raw {
      let info = rawChildren[12].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #13 child is TokenSyntax or missing
    if let raw = rawChildren[13].raw {
      let info = rawChildren[13].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #14 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[14].raw {
      let info = rawChildren[14].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #15 child is TokenSyntax or missing
    if let raw = rawChildren[15].raw {
      let info = rawChildren[15].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension LayoutRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeTypeIdentifier": garbageBeforeTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeIdentifier": Syntax(typeIdentifier).asProtocol(SyntaxProtocol.self),
      "garbageBetweenTypeIdentifierAndColon": garbageBetweenTypeIdentifierAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndLayoutConstraint": garbageBetweenColonAndLayoutConstraint.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "layoutConstraint": Syntax(layoutConstraint).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLayoutConstraintAndLeftParen": garbageBetweenLayoutConstraintAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenLeftParenAndSize": garbageBetweenLeftParenAndSize.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "size": size.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenSizeAndComma": garbageBetweenSizeAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": comma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenCommaAndAlignment": garbageBetweenCommaAndAlignment.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "alignment": alignment.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAlignmentAndRightParen": garbageBetweenAlignmentAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericParameterSyntax

public struct GenericParameterSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeAttributes
    case attributes
    case garbageBetweenAttributesAndName
    case name
    case garbageBetweenNameAndColon
    case colon
    case garbageBetweenColonAndInheritedType
    case inheritedType
    case garbageBetweenInheritedTypeAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericParameterSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericParameter else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericParameterSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericParameter)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeAttributes: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeAttributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeAttributes(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeAttributes` replaced.
  /// - param newChild: The new `garbageBeforeAttributes` to replace the node's
  ///                   current `garbageBeforeAttributes`, if present.
  public func withGarbageBeforeAttributes(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeAttributes)
    return GenericParameterSyntax(newData)
  }

  public var attributes: AttributeListSyntax? {
    get {
      let childData = data.child(at: Cursor.attributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeListSyntax(childData!)
    }
    set(value) {
      self = withAttributes(value)
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> GenericParameterSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.attributeList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.attributes)
    return GenericParameterSyntax(newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.attributes)
    return GenericParameterSyntax(newData)
  }

  public var garbageBetweenAttributesAndName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenAttributesAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenAttributesAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenAttributesAndName` replaced.
  /// - param newChild: The new `garbageBetweenAttributesAndName` to replace the node's
  ///                   current `garbageBetweenAttributesAndName`, if present.
  public func withGarbageBetweenAttributesAndName(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenAttributesAndName)
    return GenericParameterSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return GenericParameterSyntax(newData)
  }

  public var garbageBetweenNameAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndColon` replaced.
  /// - param newChild: The new `garbageBetweenNameAndColon` to replace the node's
  ///                   current `garbageBetweenNameAndColon`, if present.
  public func withGarbageBetweenNameAndColon(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndColon)
    return GenericParameterSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return GenericParameterSyntax(newData)
  }

  public var garbageBetweenColonAndInheritedType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndInheritedType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndInheritedType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndInheritedType` replaced.
  /// - param newChild: The new `garbageBetweenColonAndInheritedType` to replace the node's
  ///                   current `garbageBetweenColonAndInheritedType`, if present.
  public func withGarbageBetweenColonAndInheritedType(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndInheritedType)
    return GenericParameterSyntax(newData)
  }

  public var inheritedType: TypeSyntax? {
    get {
      let childData = data.child(at: Cursor.inheritedType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withInheritedType(value)
    }
  }

  /// Returns a copy of the receiver with its `inheritedType` replaced.
  /// - param newChild: The new `inheritedType` to replace the node's
  ///                   current `inheritedType`, if present.
  public func withInheritedType(
    _ newChild: TypeSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.inheritedType)
    return GenericParameterSyntax(newData)
  }

  public var garbageBetweenInheritedTypeAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenInheritedTypeAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenInheritedTypeAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenInheritedTypeAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenInheritedTypeAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenInheritedTypeAndTrailingComma`, if present.
  public func withGarbageBetweenInheritedTypeAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenInheritedTypeAndTrailingComma)
    return GenericParameterSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return GenericParameterSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 10)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is AttributeListSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(AttributeListSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TypeSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TokenSyntax or missing
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension GenericParameterSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeAttributes": garbageBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenAttributesAndName": garbageBetweenAttributesAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndColon": garbageBetweenNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenColonAndInheritedType": garbageBetweenColonAndInheritedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritedType": inheritedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenInheritedTypeAndTrailingComma": garbageBetweenInheritedTypeAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PrimaryAssociatedTypeSyntax

public struct PrimaryAssociatedTypeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeName
    case name
    case garbageBetweenNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrimaryAssociatedTypeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .primaryAssociatedType else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrimaryAssociatedTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .primaryAssociatedType)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeName` replaced.
  /// - param newChild: The new `garbageBeforeName` to replace the node's
  ///                   current `garbageBeforeName`, if present.
  public func withGarbageBeforeName(
    _ newChild: GarbageNodesSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeName)
    return PrimaryAssociatedTypeSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.name)
    return PrimaryAssociatedTypeSyntax(newData)
  }

  public var garbageBetweenNameAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenNameAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenNameAndTrailingComma`, if present.
  public func withGarbageBetweenNameAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndTrailingComma)
    return PrimaryAssociatedTypeSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return PrimaryAssociatedTypeSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PrimaryAssociatedTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeName": garbageBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "garbageBetweenNameAndTrailingComma": garbageBetweenNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericParameterClauseSyntax

public struct GenericParameterClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftAngleBracket
    case leftAngleBracket
    case garbageBetweenLeftAngleBracketAndGenericParameterList
    case genericParameterList
    case garbageBetweenGenericParameterListAndRightAngleBracket
    case rightAngleBracket
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericParameterClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericParameterClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericParameterClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericParameterClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftAngleBracket: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftAngleBracket` replaced.
  /// - param newChild: The new `garbageBeforeLeftAngleBracket` to replace the node's
  ///                   current `garbageBeforeLeftAngleBracket`, if present.
  public func withGarbageBeforeLeftAngleBracket(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }

  public var leftAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftAngle)
    let newData = data.replacingChild(raw, at: Cursor.leftAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }

  public var garbageBetweenLeftAngleBracketAndGenericParameterList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftAngleBracketAndGenericParameterList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftAngleBracketAndGenericParameterList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftAngleBracketAndGenericParameterList` replaced.
  /// - param newChild: The new `garbageBetweenLeftAngleBracketAndGenericParameterList` to replace the node's
  ///                   current `garbageBetweenLeftAngleBracketAndGenericParameterList`, if present.
  public func withGarbageBetweenLeftAngleBracketAndGenericParameterList(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftAngleBracketAndGenericParameterList)
    return GenericParameterClauseSyntax(newData)
  }

  public var genericParameterList: GenericParameterListSyntax {
    get {
      let childData = data.child(at: Cursor.genericParameterList,
                                 parent: Syntax(self))
      return GenericParameterListSyntax(childData!)
    }
    set(value) {
      self = withGenericParameterList(value)
    }
  }

  /// Adds the provided `GenericParameter` to the node's `genericParameterList`
  /// collection.
  /// - param element: The new `GenericParameter` to add to the node's
  ///                  `genericParameterList` collection.
  /// - returns: A copy of the receiver with the provided `GenericParameter`
  ///            appended to its `genericParameterList` collection.
  public func addGenericParameter(_ element: GenericParameterSyntax) -> GenericParameterClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.genericParameterList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.genericParameterList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.genericParameterList)
    return GenericParameterClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `genericParameterList` replaced.
  /// - param newChild: The new `genericParameterList` to replace the node's
  ///                   current `genericParameterList`, if present.
  public func withGenericParameterList(
    _ newChild: GenericParameterListSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.genericParameterList)
    let newData = data.replacingChild(raw, at: Cursor.genericParameterList)
    return GenericParameterClauseSyntax(newData)
  }

  public var garbageBetweenGenericParameterListAndRightAngleBracket: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenGenericParameterListAndRightAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenGenericParameterListAndRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenGenericParameterListAndRightAngleBracket` replaced.
  /// - param newChild: The new `garbageBetweenGenericParameterListAndRightAngleBracket` to replace the node's
  ///                   current `garbageBetweenGenericParameterListAndRightAngleBracket`, if present.
  public func withGarbageBetweenGenericParameterListAndRightAngleBracket(
    _ newChild: GarbageNodesSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenGenericParameterListAndRightAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }

  public var rightAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightAngle)
    let newData = data.replacingChild(raw, at: Cursor.rightAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is GenericParameterListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GenericParameterListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension GenericParameterClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftAngleBracket": garbageBeforeLeftAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftAngleBracket": Syntax(leftAngleBracket).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftAngleBracketAndGenericParameterList": garbageBetweenLeftAngleBracketAndGenericParameterList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterList": Syntax(genericParameterList).asProtocol(SyntaxProtocol.self),
      "garbageBetweenGenericParameterListAndRightAngleBracket": garbageBetweenGenericParameterListAndRightAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightAngleBracket": Syntax(rightAngleBracket).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ConformanceRequirementSyntax

public struct ConformanceRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftTypeIdentifier
    case leftTypeIdentifier
    case garbageBetweenLeftTypeIdentifierAndColon
    case colon
    case garbageBetweenColonAndRightTypeIdentifier
    case rightTypeIdentifier
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ConformanceRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .conformanceRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ConformanceRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .conformanceRequirement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftTypeIdentifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftTypeIdentifier` replaced.
  /// - param newChild: The new `garbageBeforeLeftTypeIdentifier` to replace the node's
  ///                   current `garbageBeforeLeftTypeIdentifier`, if present.
  public func withGarbageBeforeLeftTypeIdentifier(
    _ newChild: GarbageNodesSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }

  public var leftTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.leftTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `leftTypeIdentifier` replaced.
  /// - param newChild: The new `leftTypeIdentifier` to replace the node's
  ///                   current `leftTypeIdentifier`, if present.
  public func withLeftTypeIdentifier(
    _ newChild: TypeSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.leftTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }

  public var garbageBetweenLeftTypeIdentifierAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftTypeIdentifierAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftTypeIdentifierAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftTypeIdentifierAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLeftTypeIdentifierAndColon` to replace the node's
  ///                   current `garbageBetweenLeftTypeIdentifierAndColon`, if present.
  public func withGarbageBetweenLeftTypeIdentifierAndColon(
    _ newChild: GarbageNodesSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftTypeIdentifierAndColon)
    return ConformanceRequirementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return ConformanceRequirementSyntax(newData)
  }

  public var garbageBetweenColonAndRightTypeIdentifier: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndRightTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndRightTypeIdentifier` replaced.
  /// - param newChild: The new `garbageBetweenColonAndRightTypeIdentifier` to replace the node's
  ///                   current `garbageBetweenColonAndRightTypeIdentifier`, if present.
  public func withGarbageBetweenColonAndRightTypeIdentifier(
    _ newChild: GarbageNodesSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndRightTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }

  public var rightTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.rightTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `rightTypeIdentifier` replaced.
  /// - param newChild: The new `rightTypeIdentifier` to replace the node's
  ///                   current `rightTypeIdentifier`, if present.
  public func withRightTypeIdentifier(
    _ newChild: TypeSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.rightTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TypeSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
  }
}

extension ConformanceRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftTypeIdentifier": garbageBeforeLeftTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftTypeIdentifier": Syntax(leftTypeIdentifier).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftTypeIdentifierAndColon": garbageBetweenLeftTypeIdentifierAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndRightTypeIdentifier": garbageBetweenColonAndRightTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightTypeIdentifier": Syntax(rightTypeIdentifier).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrimaryAssociatedTypeClauseSyntax

public struct PrimaryAssociatedTypeClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftAngleBracket
    case leftAngleBracket
    case garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList
    case primaryAssociatedTypeList
    case garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket
    case rightAngleBracket
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrimaryAssociatedTypeClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .primaryAssociatedTypeClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrimaryAssociatedTypeClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .primaryAssociatedTypeClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftAngleBracket: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftAngleBracket` replaced.
  /// - param newChild: The new `garbageBeforeLeftAngleBracket` to replace the node's
  ///                   current `garbageBeforeLeftAngleBracket`, if present.
  public func withGarbageBeforeLeftAngleBracket(
    _ newChild: GarbageNodesSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var leftAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftAngle)
    let newData = data.replacingChild(raw, at: Cursor.leftAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList` replaced.
  /// - param newChild: The new `garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList` to replace the node's
  ///                   current `garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList`, if present.
  public func withGarbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList(
    _ newChild: GarbageNodesSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var primaryAssociatedTypeList: PrimaryAssociatedTypeListSyntax {
    get {
      let childData = data.child(at: Cursor.primaryAssociatedTypeList,
                                 parent: Syntax(self))
      return PrimaryAssociatedTypeListSyntax(childData!)
    }
    set(value) {
      self = withPrimaryAssociatedTypeList(value)
    }
  }

  /// Adds the provided `PrimaryAssociatedType` to the node's `primaryAssociatedTypeList`
  /// collection.
  /// - param element: The new `PrimaryAssociatedType` to add to the node's
  ///                  `primaryAssociatedTypeList` collection.
  /// - returns: A copy of the receiver with the provided `PrimaryAssociatedType`
  ///            appended to its `primaryAssociatedTypeList` collection.
  public func addPrimaryAssociatedType(_ element: PrimaryAssociatedTypeSyntax) -> PrimaryAssociatedTypeClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.primaryAssociatedTypeList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.primaryAssociatedTypeList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.primaryAssociatedTypeList)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `primaryAssociatedTypeList` replaced.
  /// - param newChild: The new `primaryAssociatedTypeList` to replace the node's
  ///                   current `primaryAssociatedTypeList`, if present.
  public func withPrimaryAssociatedTypeList(
    _ newChild: PrimaryAssociatedTypeListSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.primaryAssociatedTypeList)
    let newData = data.replacingChild(raw, at: Cursor.primaryAssociatedTypeList)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket` replaced.
  /// - param newChild: The new `garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket` to replace the node's
  ///                   current `garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket`, if present.
  public func withGarbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket(
    _ newChild: GarbageNodesSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var rightAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightAngle)
    let newData = data.replacingChild(raw, at: Cursor.rightAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is PrimaryAssociatedTypeListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PrimaryAssociatedTypeListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension PrimaryAssociatedTypeClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftAngleBracket": garbageBeforeLeftAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftAngleBracket": Syntax(leftAngleBracket).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList": garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "primaryAssociatedTypeList": Syntax(primaryAssociatedTypeList).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket": garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightAngleBracket": Syntax(rightAngleBracket).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CompositionTypeElementSyntax

public struct CompositionTypeElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeType
    case type
    case garbageBetweenTypeAndAmpersand
    case ampersand
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CompositionTypeElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .compositionTypeElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CompositionTypeElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .compositionTypeElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeType` replaced.
  /// - param newChild: The new `garbageBeforeType` to replace the node's
  ///                   current `garbageBeforeType`, if present.
  public func withGarbageBeforeType(
    _ newChild: GarbageNodesSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeType)
    return CompositionTypeElementSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return CompositionTypeElementSyntax(newData)
  }

  public var garbageBetweenTypeAndAmpersand: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAndAmpersand,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAndAmpersand(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAndAmpersand` replaced.
  /// - param newChild: The new `garbageBetweenTypeAndAmpersand` to replace the node's
  ///                   current `garbageBetweenTypeAndAmpersand`, if present.
  public func withGarbageBetweenTypeAndAmpersand(
    _ newChild: GarbageNodesSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAndAmpersand)
    return CompositionTypeElementSyntax(newData)
  }

  public var ampersand: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.ampersand,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAmpersand(value)
    }
  }

  /// Returns a copy of the receiver with its `ampersand` replaced.
  /// - param newChild: The new `ampersand` to replace the node's
  ///                   current `ampersand`, if present.
  public func withAmpersand(
    _ newChild: TokenSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.ampersand)
    return CompositionTypeElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension CompositionTypeElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeType": garbageBeforeType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "garbageBetweenTypeAndAmpersand": garbageBetweenTypeAndAmpersand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ampersand": ampersand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TupleTypeElementSyntax

public struct TupleTypeElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeInOut
    case inOut
    case garbageBetweenInOutAndName
    case name
    case garbageBetweenNameAndSecondName
    case secondName
    case garbageBetweenSecondNameAndColon
    case colon
    case garbageBetweenColonAndType
    case type
    case garbageBetweenTypeAndEllipsis
    case ellipsis
    case garbageBetweenEllipsisAndInitializer
    case initializer
    case garbageBetweenInitializerAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TupleTypeElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tupleTypeElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TupleTypeElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleTypeElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeInOut: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeInOut,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeInOut(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeInOut` replaced.
  /// - param newChild: The new `garbageBeforeInOut` to replace the node's
  ///                   current `garbageBeforeInOut`, if present.
  public func withGarbageBeforeInOut(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeInOut)
    return TupleTypeElementSyntax(newData)
  }

  public var inOut: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.inOut,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withInOut(value)
    }
  }

  /// Returns a copy of the receiver with its `inOut` replaced.
  /// - param newChild: The new `inOut` to replace the node's
  ///                   current `inOut`, if present.
  public func withInOut(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.inOut)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenInOutAndName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenInOutAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenInOutAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenInOutAndName` replaced.
  /// - param newChild: The new `garbageBetweenInOutAndName` to replace the node's
  ///                   current `garbageBetweenInOutAndName`, if present.
  public func withGarbageBetweenInOutAndName(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenInOutAndName)
    return TupleTypeElementSyntax(newData)
  }

  public var name: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.name)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenNameAndSecondName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenNameAndSecondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenNameAndSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenNameAndSecondName` replaced.
  /// - param newChild: The new `garbageBetweenNameAndSecondName` to replace the node's
  ///                   current `garbageBetweenNameAndSecondName`, if present.
  public func withGarbageBetweenNameAndSecondName(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenNameAndSecondName)
    return TupleTypeElementSyntax(newData)
  }

  public var secondName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.secondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `secondName` replaced.
  /// - param newChild: The new `secondName` to replace the node's
  ///                   current `secondName`, if present.
  public func withSecondName(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.secondName)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenSecondNameAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenSecondNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenSecondNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenSecondNameAndColon` replaced.
  /// - param newChild: The new `garbageBetweenSecondNameAndColon` to replace the node's
  ///                   current `garbageBetweenSecondNameAndColon`, if present.
  public func withGarbageBetweenSecondNameAndColon(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenSecondNameAndColon)
    return TupleTypeElementSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenColonAndType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndType` replaced.
  /// - param newChild: The new `garbageBetweenColonAndType` to replace the node's
  ///                   current `garbageBetweenColonAndType`, if present.
  public func withGarbageBetweenColonAndType(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndType)
    return TupleTypeElementSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenTypeAndEllipsis: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenTypeAndEllipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenTypeAndEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenTypeAndEllipsis` replaced.
  /// - param newChild: The new `garbageBetweenTypeAndEllipsis` to replace the node's
  ///                   current `garbageBetweenTypeAndEllipsis`, if present.
  public func withGarbageBetweenTypeAndEllipsis(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenTypeAndEllipsis)
    return TupleTypeElementSyntax(newData)
  }

  public var ellipsis: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.ellipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `ellipsis` replaced.
  /// - param newChild: The new `ellipsis` to replace the node's
  ///                   current `ellipsis`, if present.
  public func withEllipsis(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.ellipsis)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenEllipsisAndInitializer: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenEllipsisAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenEllipsisAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenEllipsisAndInitializer` replaced.
  /// - param newChild: The new `garbageBetweenEllipsisAndInitializer` to replace the node's
  ///                   current `garbageBetweenEllipsisAndInitializer`, if present.
  public func withGarbageBetweenEllipsisAndInitializer(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenEllipsisAndInitializer)
    return TupleTypeElementSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return TupleTypeElementSyntax(newData)
  }

  public var garbageBetweenInitializerAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenInitializerAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenInitializerAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenInitializerAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenInitializerAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenInitializerAndTrailingComma`, if present.
  public func withGarbageBetweenInitializerAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenInitializerAndTrailingComma)
    return TupleTypeElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TupleTypeElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 16)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #8 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[8].raw {
      let info = rawChildren[8].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #9 child is TypeSyntax 
    assert(rawChildren[9].raw != nil)
    if let raw = rawChildren[9].raw {
      let info = rawChildren[9].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #10 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[10].raw {
      let info = rawChildren[10].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #11 child is TokenSyntax or missing
    if let raw = rawChildren[11].raw {
      let info = rawChildren[11].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #12 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[12].raw {
      let info = rawChildren[12].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #13 child is InitializerClauseSyntax or missing
    if let raw = rawChildren[13].raw {
      let info = rawChildren[13].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(InitializerClauseSyntax.self))
    }
    // Check child #14 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[14].raw {
      let info = rawChildren[14].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #15 child is TokenSyntax or missing
    if let raw = rawChildren[15].raw {
      let info = rawChildren[15].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension TupleTypeElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeInOut": garbageBeforeInOut.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inOut": inOut.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenInOutAndName": garbageBetweenInOutAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": name.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenNameAndSecondName": garbageBetweenNameAndSecondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "secondName": secondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenSecondNameAndColon": garbageBetweenSecondNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenColonAndType": garbageBetweenColonAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "garbageBetweenTypeAndEllipsis": garbageBetweenTypeAndEllipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ellipsis": ellipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenEllipsisAndInitializer": garbageBetweenEllipsisAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenInitializerAndTrailingComma": garbageBetweenInitializerAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericArgumentSyntax

public struct GenericArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeArgumentType
    case argumentType
    case garbageBetweenArgumentTypeAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericArgument)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeArgumentType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeArgumentType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeArgumentType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeArgumentType` replaced.
  /// - param newChild: The new `garbageBeforeArgumentType` to replace the node's
  ///                   current `garbageBeforeArgumentType`, if present.
  public func withGarbageBeforeArgumentType(
    _ newChild: GarbageNodesSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeArgumentType)
    return GenericArgumentSyntax(newData)
  }

  public var argumentType: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.argumentType,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withArgumentType(value)
    }
  }

  /// Returns a copy of the receiver with its `argumentType` replaced.
  /// - param newChild: The new `argumentType` to replace the node's
  ///                   current `argumentType`, if present.
  public func withArgumentType(
    _ newChild: TypeSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.argumentType)
    return GenericArgumentSyntax(newData)
  }

  public var garbageBetweenArgumentTypeAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenArgumentTypeAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenArgumentTypeAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenArgumentTypeAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenArgumentTypeAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenArgumentTypeAndTrailingComma`, if present.
  public func withGarbageBetweenArgumentTypeAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenArgumentTypeAndTrailingComma)
    return GenericArgumentSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return GenericArgumentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TypeSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension GenericArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeArgumentType": garbageBeforeArgumentType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentType": Syntax(argumentType).asProtocol(SyntaxProtocol.self),
      "garbageBetweenArgumentTypeAndTrailingComma": garbageBetweenArgumentTypeAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericArgumentClauseSyntax

public struct GenericArgumentClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLeftAngleBracket
    case leftAngleBracket
    case garbageBetweenLeftAngleBracketAndArguments
    case arguments
    case garbageBetweenArgumentsAndRightAngleBracket
    case rightAngleBracket
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericArgumentClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericArgumentClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericArgumentClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericArgumentClause)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLeftAngleBracket: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLeftAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLeftAngleBracket` replaced.
  /// - param newChild: The new `garbageBeforeLeftAngleBracket` to replace the node's
  ///                   current `garbageBeforeLeftAngleBracket`, if present.
  public func withGarbageBeforeLeftAngleBracket(
    _ newChild: GarbageNodesSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLeftAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }

  public var leftAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.leftAngle)
    let newData = data.replacingChild(raw, at: Cursor.leftAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }

  public var garbageBetweenLeftAngleBracketAndArguments: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLeftAngleBracketAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLeftAngleBracketAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLeftAngleBracketAndArguments` replaced.
  /// - param newChild: The new `garbageBetweenLeftAngleBracketAndArguments` to replace the node's
  ///                   current `garbageBetweenLeftAngleBracketAndArguments`, if present.
  public func withGarbageBetweenLeftAngleBracketAndArguments(
    _ newChild: GarbageNodesSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLeftAngleBracketAndArguments)
    return GenericArgumentClauseSyntax(newData)
  }

  public var arguments: GenericArgumentListSyntax {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      return GenericArgumentListSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Adds the provided `Argument` to the node's `arguments`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `arguments` collection.
  public func addArgument(_ element: GenericArgumentSyntax) -> GenericArgumentClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.create(kind: SyntaxKind.genericArgumentList,
        layout: [element.raw], length: element.raw.totalLength, presence: .present)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.arguments)
    return GenericArgumentClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: GenericArgumentListSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.genericArgumentList)
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return GenericArgumentClauseSyntax(newData)
  }

  public var garbageBetweenArgumentsAndRightAngleBracket: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenArgumentsAndRightAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenArgumentsAndRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenArgumentsAndRightAngleBracket` replaced.
  /// - param newChild: The new `garbageBetweenArgumentsAndRightAngleBracket` to replace the node's
  ///                   current `garbageBetweenArgumentsAndRightAngleBracket`, if present.
  public func withGarbageBetweenArgumentsAndRightAngleBracket(
    _ newChild: GarbageNodesSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenArgumentsAndRightAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }

  public var rightAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.rightAngle)
    let newData = data.replacingChild(raw, at: Cursor.rightAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is GenericArgumentListSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GenericArgumentListSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension GenericArgumentClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLeftAngleBracket": garbageBeforeLeftAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftAngleBracket": Syntax(leftAngleBracket).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLeftAngleBracketAndArguments": garbageBetweenLeftAngleBracketAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": Syntax(arguments).asProtocol(SyntaxProtocol.self),
      "garbageBetweenArgumentsAndRightAngleBracket": garbageBetweenArgumentsAndRightAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightAngleBracket": Syntax(rightAngleBracket).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - TypeAnnotationSyntax

public struct TypeAnnotationSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeColon
    case colon
    case garbageBetweenColonAndType
    case type
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TypeAnnotationSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .typeAnnotation else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TypeAnnotationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeAnnotation)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeColon` replaced.
  /// - param newChild: The new `garbageBeforeColon` to replace the node's
  ///                   current `garbageBeforeColon`, if present.
  public func withGarbageBeforeColon(
    _ newChild: GarbageNodesSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeColon)
    return TypeAnnotationSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TypeAnnotationSyntax(newData)
  }

  public var garbageBetweenColonAndType: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndType(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndType` replaced.
  /// - param newChild: The new `garbageBetweenColonAndType` to replace the node's
  ///                   current `garbageBetweenColonAndType`, if present.
  public func withGarbageBetweenColonAndType(
    _ newChild: GarbageNodesSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndType)
    return TypeAnnotationSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingType)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return TypeAnnotationSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TypeSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TypeSyntax.self))
    }
  }
}

extension TypeAnnotationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeColon": garbageBeforeColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndType": garbageBetweenColonAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - TuplePatternElementSyntax

public struct TuplePatternElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabelName
    case labelName
    case garbageBetweenLabelNameAndLabelColon
    case labelColon
    case garbageBetweenLabelColonAndPattern
    case pattern
    case garbageBetweenPatternAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TuplePatternElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tuplePatternElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TuplePatternElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tuplePatternElement)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabelName: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabelName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabelName(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabelName` replaced.
  /// - param newChild: The new `garbageBeforeLabelName` to replace the node's
  ///                   current `garbageBeforeLabelName`, if present.
  public func withGarbageBeforeLabelName(
    _ newChild: GarbageNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabelName)
    return TuplePatternElementSyntax(newData)
  }

  public var labelName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.labelName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabelName(value)
    }
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.labelName)
    return TuplePatternElementSyntax(newData)
  }

  public var garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelNameAndLabelColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelNameAndLabelColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelNameAndLabelColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelNameAndLabelColon` to replace the node's
  ///                   current `garbageBetweenLabelNameAndLabelColon`, if present.
  public func withGarbageBetweenLabelNameAndLabelColon(
    _ newChild: GarbageNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelNameAndLabelColon)
    return TuplePatternElementSyntax(newData)
  }

  public var labelColon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.labelColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabelColon(value)
    }
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.labelColon)
    return TuplePatternElementSyntax(newData)
  }

  public var garbageBetweenLabelColonAndPattern: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelColonAndPattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelColonAndPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelColonAndPattern` replaced.
  /// - param newChild: The new `garbageBetweenLabelColonAndPattern` to replace the node's
  ///                   current `garbageBetweenLabelColonAndPattern`, if present.
  public func withGarbageBetweenLabelColonAndPattern(
    _ newChild: GarbageNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelColonAndPattern)
    return TuplePatternElementSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.missingPattern)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return TuplePatternElementSyntax(newData)
  }

  public var garbageBetweenPatternAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatternAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatternAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatternAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenPatternAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenPatternAndTrailingComma`, if present.
  public func withGarbageBetweenPatternAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatternAndTrailingComma)
    return TuplePatternElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TuplePatternElementSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 8)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax or missing
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is PatternSyntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(PatternSyntax.self))
    }
    // Check child #6 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[6].raw {
      let info = rawChildren[6].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #7 child is TokenSyntax or missing
    if let raw = rawChildren[7].raw {
      let info = rawChildren[7].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension TuplePatternElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabelName": garbageBeforeLabelName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "labelName": labelName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenLabelNameAndLabelColon": garbageBetweenLabelNameAndLabelColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "labelColon": labelColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenLabelColonAndPattern": garbageBetweenLabelColonAndPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPatternAndTrailingComma": garbageBetweenPatternAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityArgumentSyntax

/// 
/// A single argument to an `@available` argument like `*`, `iOS 10.1`,
/// or `message: "This has been deprecated"`.
/// 
public struct AvailabilityArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeEntry
    case entry
    case garbageBetweenEntryAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityArgument)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeEntry: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeEntry,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeEntry(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeEntry` replaced.
  /// - param newChild: The new `garbageBeforeEntry` to replace the node's
  ///                   current `garbageBeforeEntry`, if present.
  public func withGarbageBeforeEntry(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeEntry)
    return AvailabilityArgumentSyntax(newData)
  }

  /// The actual argument
  public var entry: Syntax {
    get {
      let childData = data.child(at: Cursor.entry,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withEntry(value)
    }
  }

  /// Returns a copy of the receiver with its `entry` replaced.
  /// - param newChild: The new `entry` to replace the node's
  ///                   current `entry`, if present.
  public func withEntry(
    _ newChild: Syntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.entry)
    return AvailabilityArgumentSyntax(newData)
  }

  public var garbageBetweenEntryAndTrailingComma: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenEntryAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenEntryAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenEntryAndTrailingComma` replaced.
  /// - param newChild: The new `garbageBetweenEntryAndTrailingComma` to replace the node's
  ///                   current `garbageBetweenEntryAndTrailingComma`, if present.
  public func withGarbageBetweenEntryAndTrailingComma(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenEntryAndTrailingComma)
    return AvailabilityArgumentSyntax(newData)
  }

  /// 
  /// A trailing comma if the argument is followed by another
  /// argument
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return AvailabilityArgumentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension AvailabilityArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeEntry": garbageBeforeEntry.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "entry": Syntax(entry).asProtocol(SyntaxProtocol.self),
      "garbageBetweenEntryAndTrailingComma": garbageBetweenEntryAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityLabeledArgumentSyntax

/// 
/// A argument to an `@available` attribute that consists of a label and
/// a value, e.g. `message: "This has been deprecated"`.
/// 
public struct AvailabilityLabeledArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeLabel
    case label
    case garbageBetweenLabelAndColon
    case colon
    case garbageBetweenColonAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityLabeledArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityLabeledArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityLabeledArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityLabeledArgument)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeLabel: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeLabel` replaced.
  /// - param newChild: The new `garbageBeforeLabel` to replace the node's
  ///                   current `garbageBeforeLabel`, if present.
  public func withGarbageBeforeLabel(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeLabel)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.label)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  public var garbageBetweenLabelAndColon: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenLabelAndColon` replaced.
  /// - param newChild: The new `garbageBetweenLabelAndColon` to replace the node's
  ///                   current `garbageBetweenLabelAndColon`, if present.
  public func withGarbageBetweenLabelAndColon(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenLabelAndColon)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  /// The colon separating label and value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.colon)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  public var garbageBetweenColonAndValue: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenColonAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenColonAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenColonAndValue` replaced.
  /// - param newChild: The new `garbageBetweenColonAndValue` to replace the node's
  ///                   current `garbageBetweenColonAndValue`, if present.
  public func withGarbageBetweenColonAndValue(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenColonAndValue)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  /// The value of this labeled argument
  public var value: Syntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: Syntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return AvailabilityLabeledArgumentSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax 
    assert(rawChildren[3].raw != nil)
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is Syntax 
    assert(rawChildren[5].raw != nil)
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
  }
}

extension AvailabilityLabeledArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeLabel": garbageBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "garbageBetweenLabelAndColon": garbageBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "garbageBetweenColonAndValue": garbageBetweenColonAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - AvailabilityVersionRestrictionSyntax

/// 
/// An argument to `@available` that restricts the availability on a
/// certain platform to a version, e.g. `iOS 10` or `swift 3.4`.
/// 
public struct AvailabilityVersionRestrictionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforePlatform
    case platform
    case garbageBetweenPlatformAndVersion
    case version
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityVersionRestrictionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityVersionRestriction else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityVersionRestrictionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityVersionRestriction)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforePlatform: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforePlatform,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforePlatform(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforePlatform` replaced.
  /// - param newChild: The new `garbageBeforePlatform` to replace the node's
  ///                   current `garbageBeforePlatform`, if present.
  public func withGarbageBeforePlatform(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforePlatform)
    return AvailabilityVersionRestrictionSyntax(newData)
  }

  /// 
  /// The name of the OS on which the availability should be
  /// restricted or 'swift' if the availability should be
  /// restricted based on a Swift version.
  /// 
  public var platform: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.platform,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPlatform(value)
    }
  }

  /// Returns a copy of the receiver with its `platform` replaced.
  /// - param newChild: The new `platform` to replace the node's
  ///                   current `platform`, if present.
  public func withPlatform(
    _ newChild: TokenSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(TokenKind.identifier(""))
    let newData = data.replacingChild(raw, at: Cursor.platform)
    return AvailabilityVersionRestrictionSyntax(newData)
  }

  public var garbageBetweenPlatformAndVersion: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPlatformAndVersion,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPlatformAndVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPlatformAndVersion` replaced.
  /// - param newChild: The new `garbageBetweenPlatformAndVersion` to replace the node's
  ///                   current `garbageBetweenPlatformAndVersion`, if present.
  public func withGarbageBetweenPlatformAndVersion(
    _ newChild: GarbageNodesSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPlatformAndVersion)
    return AvailabilityVersionRestrictionSyntax(newData)
  }

  public var version: VersionTupleSyntax? {
    get {
      let childData = data.child(at: Cursor.version,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return VersionTupleSyntax(childData!)
    }
    set(value) {
      self = withVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `version` replaced.
  /// - param newChild: The new `version` to replace the node's
  ///                   current `version`, if present.
  public func withVersion(
    _ newChild: VersionTupleSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.version)
    return AvailabilityVersionRestrictionSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 4)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is TokenSyntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is VersionTupleSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(VersionTupleSyntax.self))
    }
  }
}

extension AvailabilityVersionRestrictionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforePlatform": garbageBeforePlatform.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "platform": Syntax(platform).asProtocol(SyntaxProtocol.self),
      "garbageBetweenPlatformAndVersion": garbageBetweenPlatformAndVersion.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "version": version.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - VersionTupleSyntax

/// 
/// A version number of the form major.minor.patch in which the minor
/// and patch part may be omitted.
/// 
public struct VersionTupleSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case garbageBeforeMajorMinor
    case majorMinor
    case garbageBetweenMajorMinorAndPatchPeriod
    case patchPeriod
    case garbageBetweenPatchPeriodAndPatchVersion
    case patchVersion
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `VersionTupleSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .versionTuple else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `VersionTupleSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .versionTuple)
    self._syntaxNode = Syntax(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var garbageBeforeMajorMinor: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBeforeMajorMinor,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBeforeMajorMinor(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBeforeMajorMinor` replaced.
  /// - param newChild: The new `garbageBeforeMajorMinor` to replace the node's
  ///                   current `garbageBeforeMajorMinor`, if present.
  public func withGarbageBeforeMajorMinor(
    _ newChild: GarbageNodesSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBeforeMajorMinor)
    return VersionTupleSyntax(newData)
  }

  /// 
  /// In case the version consists only of the major version, an
  /// integer literal that specifies the major version. In case
  /// the version consists of major and minor version number, a
  /// floating literal in which the decimal part is interpreted
  /// as the minor version.
  /// 
  public var majorMinor: Syntax {
    get {
      let childData = data.child(at: Cursor.majorMinor,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withMajorMinor(value)
    }
  }

  /// Returns a copy of the receiver with its `majorMinor` replaced.
  /// - param newChild: The new `majorMinor` to replace the node's
  ///                   current `majorMinor`, if present.
  public func withMajorMinor(
    _ newChild: Syntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(SyntaxKind.unknown)
    let newData = data.replacingChild(raw, at: Cursor.majorMinor)
    return VersionTupleSyntax(newData)
  }

  public var garbageBetweenMajorMinorAndPatchPeriod: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenMajorMinorAndPatchPeriod,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenMajorMinorAndPatchPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenMajorMinorAndPatchPeriod` replaced.
  /// - param newChild: The new `garbageBetweenMajorMinorAndPatchPeriod` to replace the node's
  ///                   current `garbageBetweenMajorMinorAndPatchPeriod`, if present.
  public func withGarbageBetweenMajorMinorAndPatchPeriod(
    _ newChild: GarbageNodesSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenMajorMinorAndPatchPeriod)
    return VersionTupleSyntax(newData)
  }

  /// 
  /// If the version contains a patch number, the period
  /// separating the minor from the patch number.
  /// 
  public var patchPeriod: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.patchPeriod,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPatchPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `patchPeriod` replaced.
  /// - param newChild: The new `patchPeriod` to replace the node's
  ///                   current `patchPeriod`, if present.
  public func withPatchPeriod(
    _ newChild: TokenSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.patchPeriod)
    return VersionTupleSyntax(newData)
  }

  public var garbageBetweenPatchPeriodAndPatchVersion: GarbageNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.garbageBetweenPatchPeriodAndPatchVersion,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GarbageNodesSyntax(childData!)
    }
    set(value) {
      self = withGarbageBetweenPatchPeriodAndPatchVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `garbageBetweenPatchPeriodAndPatchVersion` replaced.
  /// - param newChild: The new `garbageBetweenPatchPeriodAndPatchVersion` to replace the node's
  ///                   current `garbageBetweenPatchPeriodAndPatchVersion`, if present.
  public func withGarbageBetweenPatchPeriodAndPatchVersion(
    _ newChild: GarbageNodesSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.garbageBetweenPatchPeriodAndPatchVersion)
    return VersionTupleSyntax(newData)
  }

  /// 
  /// The patch version if specified.
  /// 
  public var patchVersion: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.patchVersion,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPatchVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `patchVersion` replaced.
  /// - param newChild: The new `patchVersion` to replace the node's
  ///                   current `patchVersion`, if present.
  public func withPatchVersion(
    _ newChild: TokenSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.patchVersion)
    return VersionTupleSyntax(newData)
  }


  public func _validateLayout() {
    let rawChildren = Array(RawSyntaxChildren(Syntax(self)))
    assert(rawChildren.count == 6)
    // Check child #0 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[0].raw {
      let info = rawChildren[0].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #1 child is Syntax 
    assert(rawChildren[1].raw != nil)
    if let raw = rawChildren[1].raw {
      let info = rawChildren[1].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(Syntax.self))
    }
    // Check child #2 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[2].raw {
      let info = rawChildren[2].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #3 child is TokenSyntax or missing
    if let raw = rawChildren[3].raw {
      let info = rawChildren[3].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
    // Check child #4 child is GarbageNodesSyntax or missing
    if let raw = rawChildren[4].raw {
      let info = rawChildren[4].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(GarbageNodesSyntax.self))
    }
    // Check child #5 child is TokenSyntax or missing
    if let raw = rawChildren[5].raw {
      let info = rawChildren[5].syntaxInfo
      let absoluteRaw = AbsoluteRawSyntax(raw: raw, info: info)
      let syntaxData = SyntaxData(absoluteRaw, parent: Syntax(self))
      let syntaxChild = Syntax(syntaxData)
      assert(syntaxChild.is(TokenSyntax.self))
    }
  }
}

extension VersionTupleSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "garbageBeforeMajorMinor": garbageBeforeMajorMinor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "majorMinor": Syntax(majorMinor).asProtocol(SyntaxProtocol.self),
      "garbageBetweenMajorMinorAndPatchPeriod": garbageBetweenMajorMinorAndPatchPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "patchPeriod": patchPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "garbageBetweenPatchPeriodAndPatchVersion": garbageBetweenPatchPeriodAndPatchVersion.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "patchVersion": patchVersion.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

