HKDF for Swift
==============

HMAC-based Extract-and-Expand Key Derivation Function (HKDF). Uses CommonCrypto's HMAC functions.

# Usage:

    let hkdf = deriveKey(algorithm: .SHA256, seed: Data(), info: Data(), salt: Data(), count: 32)
