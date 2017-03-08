HKDF in Swift
=============

HKDF is an HMAC based key derivation function that transforms any weak key 
material into cryptographically strong key material. It can be used, for 
example, to convert a session key derived in a secure remote password 
authentication into key material suitable for use in encryption, integrity
checking or authentication.

[![Build Status](https://travis-ci.org/Bouke/HKDF.svg?branch=master)](https://travis-ci.org/Bouke/HKDF)

## Usage:

```swift
// Input Key Material (ikm): weak input key material.
let ikm = Data(bytes: try! Random.generate(byteCount: 16))

// Output Key Material (okm): strong key material.
let okm = deriveKey(algorithm: .sha256, seed: ikm, count: 32)
```

## References:

* [RFC 5869 - HMAC-based Extract-and-Expand Key Derivation Function (HKDF)][0]

## Credits

This library was written by [Bouke Haarsma][1].

[0]: https://tools.ietf.org/html/rfc5869
[1]: https://twitter.com/BoukeHaarsma
