import Foundation
import Cryptor

public func deriveKey(algorithm: HMAC.Algorithm, seed: Data, info: Data, salt: Data, count: Int) -> Data {
    // extract
    let prk = HMAC(using: algorithm, key: salt).update(data: seed)!.final()

    // expand
    let iterations = Int(ceil(Double(count) / Double(algorithm.digestLength())))

    var mixin = [UInt8]()
    var result = [UInt8]()

    for i in 1...iterations {
        mixin = HMAC(using: algorithm, key: prk)
            .update(byteArray: mixin)!
            .update(data: info)!
            .update(byteArray: [UInt8(i)])!
            .final()
        result.append(contentsOf: mixin)
    }

    return Data(bytes: result[0..<count])
}
