import Foundation

extension Data {
    init?(hex: String) {
        var result = [UInt8]()
        var from = hex.characters.startIndex
        while from < hex.characters.endIndex {
            guard let to = hex.characters.index(from, offsetBy: 2, limitedBy: hex.characters.endIndex) else {
                return nil
            }
            guard let num = UInt8(hex[from..<to], radix: 16) else {
                return nil
            }
            result.append(num)
            from = to
        }
        self = Data(result)
    }

    var hex: String {
        return self.reduce("") { $0 + String(format:"%02x", $1) }
    }
}
