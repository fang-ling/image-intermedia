//
//  RGBA.swift
//
//
//  Created by Fang Ling on 2023/8/21.
//

/// In the RGBA byte order, the colors are stored in memory such that R is at
/// the lowest address, G comes after it, B follows, and A is last.
///
/// RGBA12x4 layout: [UInt16]
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
/// RGBA10x4 layout: [UInt16]
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
/// RGBA8x4 layout: [UInt16]
///
///     low memory address    ---->      high memory address
///     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1  (bits)
///  0 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |     Red       |    ZeroPad    |     Green     |    ZeroPad    |
///  2 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///    |     Blue      |    ZeroPad    |     Alpha     |    ZeroPad    |
///  4 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
///   ↖                              .....
///    Array Index

//----------------------------------------------------------------------------//
//                             8-bit source                                   //
//----------------------------------------------------------------------------//

@inlinable
public func rgba_8to10(_ rgba8x4 : [UInt16]) -> [UInt16] {
    return rgba8x4.map { $0 << 2 | $0 >> 6 }
}

@inlinable
public func rgba_8to12(_ rgba8x4 : [UInt16]) -> [UInt16] {
    return rgba8x4.map { $0 << 4 | $0 >> 4 }
}

@inlinable
public func rgba_8to16(_ rgba8x4 : [UInt16]) -> [UInt16] {
    return rgba8x4.map { $0 << 8 | $0 >> 0 }
}

//----------------------------------------------------------------------------//
//                             10-bit source                                  //
//----------------------------------------------------------------------------//

/* Down-sample */
@inlinable
public func rgba_10to8(_ rgba10x4 : [UInt16]) -> [UInt16] {
    return rgba10x4.map { $0 >> 2 }
}

@inlinable
public func rgba_10to12(_ rgba10x4 : [UInt16]) -> [UInt16] {
    return rgba10x4.map { $0 << 2 | $0 >> 8 }
}

@inlinable
public func rgba_10to16(_ rgba10x4 : [UInt16]) -> [UInt16] {
    return rgba10x4.map { $0 << 6 | $0 >> 4 }
}

//----------------------------------------------------------------------------//
//                             12-bit source                                  //
//----------------------------------------------------------------------------//

/* Down-sample */
@inlinable
public func rgba_12to8(_ rgba12x4 : [UInt16]) -> [UInt16] {
    return rgba12x4.map { $0 >> 4 }
}

/* Down-sample */
@inlinable
public func rgba_12to10(_ rgba12x4 : [UInt16]) -> [UInt16] {
    return rgba12x4.map { $0 >> 2 }
}

@inlinable
public func rgba_12to16(_ rgba12x4 : [UInt16]) -> [UInt16] {
    return rgba12x4.map { $0 << 4 | $0 >> 8 }
}

//----------------------------------------------------------------------------//
//                             16-bit source                                  //
//----------------------------------------------------------------------------//

/* Down-sample */
@inlinable
public func rgba_16to8(_ rgba16x4 : [UInt16]) -> [UInt16] {
    return rgba16x4.map { $0 >> 8 }
}

/* Down-sample */
@inlinable
public func rgba_16to10(_ rgba16x4 : [UInt16]) -> [UInt16] {
    return rgba16x4.map { $0 >> 6 }
}

/* Down-sample */
@inlinable
public func rgba_16to12(_ rgba16x4 : [UInt16]) -> [UInt16] {
    return rgba16x4.map { $0 >> 4 }
}
