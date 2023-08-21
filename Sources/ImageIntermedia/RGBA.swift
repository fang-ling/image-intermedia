//
//  RGBA.swift
//
//
//  Created by Fang Ling on 2023/8/21.
//

/// In the RGBA byte order, the colors are stored in memory such that R is at
/// the lowest address, G comes after it, B follows, and A is last.
///
/// RGBA12121212 layout: [UInt16]
///
///     low memory address    ---->      high memory address
///     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1  (bits)
///  0 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |            Red        |ZeroPad|          Green        |ZeroPad|
///  2 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |            Blue       |ZeroPad|          Alpha        |ZeroPad|
///  4 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///   ↖                              .....
///    Array Index
///
/// Remapping is needed if it comes from 8-bit or 10-bit RGBA colors.
///
/// RGBA10101010 layout: [UInt16]
///
///     low memory address    ---->      high memory address
///     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1  (bits)
///  0 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |            Red    |  ZeroPad  |          Green    |  ZeroPad  |
///  2 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |            Blue   |  ZeroPad  |          Alpha    |  ZeroPad  |
///  4 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///   ↖                              .....
///    Array Index
///
/// RGBA8888 layout: [UInt8]
///
///     low memory address    ---->      high memory address
///     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1  (bits)
///  0 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |   Red         |   Green       |   Blue        |   Alpha       |
///  4 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

public func rgba_10to12(_ rgba10101010 : [UInt16]) -> [UInt16] {
    return rgba10101010.map { $0 << 2 | $0 >> 2 }
}

public func rgba_8to12(_ rgba8888 : [UInt8]) -> [UInt16] {
    return rgba8888.map { UInt16($0) << 4 | UInt16($0) >> 4 }
}

public func rgba_12to8(_ rgba12121212 : [UInt16]) -> [UInt8] {
    return rgba12121212.map { UInt8($0 >> 4) }
}

public func rgba_12to10(_ rgba12121212 : [UInt16]) -> [UInt16] {
    return rgba12121212.map { $0 >> 2 }
}
