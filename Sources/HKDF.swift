import Foundation
import Cryptor

/// Derive strong key material from the given (weak) input key material.
///
/// - Parameters:
///   - algorithm: hash function, defaults to SHA-256
///   - seed: input keying material (IKM)
///   - info: (optional) optional context and application specific information
///   - salt: (optional) seed, a non-secret random value
///   - count: desired output key size
/// - Returns: output keying material (OKM)
public func deriveKey(
    algorithm: HMAC.Algorithm = .sha256,
    seed: Data,
    info: Data? = nil,
    salt: Data? = nil,
    count: Int)
-> Data {
    // extract
    let prk = HMAC(using: algorithm, key: salt ?? Data()).update(data: seed)!.final()

    // expand
    let iterations = Int(ceil(Double(count) / Double(algorithm.digestLength())))

    var mixin = [UInt8]()
    var result = [UInt8]()

    for iteration in 1...iterations {
        mixin = HMAC(using: algorithm, key: prk)
            .update(byteArray: mixin)!
            .update(data: info ?? Data())!
            .update(byteArray: [UInt8(iteration)])!
            .final()
        result.append(contentsOf: mixin)
    }

    return Data(bytes: result[0..<count])
}
