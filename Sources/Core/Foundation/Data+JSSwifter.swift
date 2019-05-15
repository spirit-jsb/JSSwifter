//
//  Data+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation
import CommonCrypto
import zlib

public struct GzipError: Swift.Error {
    
    enum Kind: Equatable {
        case stream
        case data
        case memory
        case buffer
        case version
        case unknown(code: Int)
    }
    
    let kind: Kind
    let message: String
    
    var description: String {
        return self.message
    }
    
    init(code: Int32, msg: UnsafePointer<CChar>?) {
        self.message = {
            guard let msg = msg, let message = String.init(validatingUTF8: msg) else {
                return "Unknown Gzip Error"
            }
            return message
        }()
        self.kind = {
            switch code {
            case Z_STREAM_ERROR:
                return .stream
            case Z_DATA_ERROR:
                return .data
            case Z_MEM_ERROR:
                return .memory
            case Z_BUF_ERROR:
                return .buffer
            case Z_VERSION_ERROR:
                return .version
            default:
                return .unknown(code: Int(code))
            }
        }()
    }
}

public extension Data {
    
    // MARK:
    enum CryptoAlgorithm {
        case md2
        case md4
        case md5
        case sha1
        case sha224
        case sha256
        case sha384
        case sha512
        
        var length: Int {
            switch self {
            case .md2: return Int(CC_MD2_DIGEST_LENGTH)
            case .md4: return Int(CC_MD4_DIGEST_LENGTH)
            case .md5: return Int(CC_MD5_DIGEST_LENGTH)
            case .sha1: return Int(CC_SHA1_DIGEST_LENGTH)
            case .sha224: return Int(CC_SHA224_DIGEST_LENGTH)
            case .sha256: return Int(CC_SHA256_DIGEST_LENGTH)
            case .sha384: return Int(CC_SHA384_DIGEST_LENGTH)
            case .sha512: return Int(CC_SHA512_DIGEST_LENGTH)
            }
        }
        
        var digest: CryptoDigest {
            switch self {
            case .md2: return CC_MD2
            case .md4: return CC_MD4
            case .md5: return CC_MD5
            case .sha1: return CC_SHA1
            case .sha224: return CC_SHA224
            case .sha256: return CC_SHA256
            case .sha384: return CC_SHA384
            case .sha512: return CC_SHA512
            }
        }
    }
    
    enum HmacAlgorithm {
        case md5
        case sha1
        case sha224
        case sha256
        case sha384
        case sha512
        
        var algorithm: CCHmacAlgorithm {
            switch self {
            case .md5: return UInt32(kCCHmacAlgMD5)
            case .sha1: return UInt32(kCCHmacAlgSHA1)
            case .sha224: return UInt32(kCCHmacAlgSHA224)
            case .sha256: return UInt32(kCCHmacAlgSHA256)
            case .sha384: return UInt32(kCCHmacAlgSHA384)
            case .sha512: return UInt32(kCCHmacAlgSHA512)
            }
        }
        
        var length: Int {
            switch self {
            case .md5: return Int(CC_MD5_DIGEST_LENGTH)
            case .sha1: return Int(CC_SHA1_DIGEST_LENGTH)
            case .sha224: return Int(CC_SHA224_DIGEST_LENGTH)
            case .sha256: return Int(CC_SHA256_DIGEST_LENGTH)
            case .sha384: return Int(CC_SHA384_DIGEST_LENGTH)
            case .sha512: return Int(CC_SHA512_DIGEST_LENGTH)
            }
        }
    }
    
    enum Aes256Algorithm {
        case encrypt
        case decrypt
        
        var op: CCOperation {
            switch self {
            case .encrypt: return CCOperation(kCCEncrypt)
            case .decrypt: return CCOperation(kCCDecrypt)
            }
        }
    }
    
    enum CompressionLevel {
        case no
        case bestSpeed
        case `default`
        case best
        
        var rawValue: Int32 {
            switch self {
            case .no: return Z_NO_COMPRESSION
            case .bestSpeed: return Z_BEST_SPEED
            case .default: return Z_DEFAULT_COMPRESSION
            case .best: return Z_BEST_COMPRESSION
            }
        }
    }
    
    typealias CryptoDigest = (
        _ data: UnsafeRawPointer?,
        _ len: CC_LONG,
        _ md: UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?
    
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
    var isGzipped: Bool {
        return self.starts(with: [0x1f, 0x8b])
    }
    
    // MARK:
    func cryptoData(usingAlgorithm algorithm: CryptoAlgorithm) -> Data {
        return self.cryptoDigest(usingAlgorithm: algorithm)
    }
    
    func cryptoString(usingAlgorithm algorithm: CryptoAlgorithm) -> String {
        let cryptoData = self.cryptoDigest(usingAlgorithm: algorithm)
        
        var cryptoString = ""
        for byte in cryptoData {
            cryptoString += String(format: "%02x", byte)
        }
        
        return cryptoString
    }
    
    func hmacData(usingAlgorithm algorithm: HmacAlgorithm, withKey key: Data) -> Data {
        return self.hmacDigest(usingAlgorithm: algorithm, withKey: key)
    }
    
    func hmacString(usingAlgorithm algorithm: HmacAlgorithm, withKey key: String) -> String {
        guard let dataKey = key.data(using: .utf8) else {
            return ""
        }
        
        let hmacData = self.hmacDigest(usingAlgorithm: algorithm, withKey: dataKey)
        
        var hmacString = ""
        for byte in hmacData {
            hmacString += String(format: "%02x", byte)
        }
        
        return hmacString
    }
    
    func crc32() -> UInt32 {
        let dataBytes = self.bytes
        let len = uInt(self.count)
        
        let result = zlib.crc32(0, dataBytes, len)
        
        return UInt32(result)
    }
    
    func crc32String() -> String {
        let dataBytes = self.bytes
        let len = uInt(self.count)
        
        let result = zlib.crc32(0, dataBytes, len)
        
        return String(format: "%08x", UInt32(result))
    }
    
    func aes256(usingAlgorithm algorithm: Aes256Algorithm, withKey key: Data, withVector iv: Data) -> Data? {
        if key.count != 16 && key.count != 24 && key.count != 32 {
            return nil
        }
        if iv.count != 0 && iv.count != 16 {
            return nil
        }
        
        let bufferSize = self.count + kCCBlockSizeAES128
        var bufferBytes = [UInt8](repeating: 0, count: bufferSize)
        defer {
            bufferBytes.removeAll()
        }
        
        let op = algorithm.op
        let alg = CCAlgorithm(kCCAlgorithmAES128)
        let options = CCOptions(kCCOptionPKCS7Padding)
        let keyBytes = key.bytes
        let keyLength = key.count
        let ivBytes = iv.bytes
        let dataBytes = self.bytes
        let dataInLength = self.count
        var encryptedSize: Int = 0
        
        let cryptStatus = CCCrypt(op, alg, options, keyBytes, keyLength, ivBytes, dataBytes, dataInLength, &bufferBytes, bufferSize, &encryptedSize)
        
        return cryptStatus == kCCSuccess ? Data(bytes: bufferBytes, count: encryptedSize) : nil
    }
    
    func utf8String() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
    func hexString() -> String {
        let dataBytes = self.bytes
        
        var hexString = ""
        for byte in dataBytes {
            hexString += String(format: "%02x", byte)
        }
        
        return hexString
    }
    
    func jsonValueDecoded() throws -> Any {
        do {
            let value = try JSONSerialization.jsonObject(with: self, options: [])
            return value
        } catch {
            throw error
        }
    }
    
    func gzipDeflate(level: CompressionLevel = .default) throws -> Data {
        guard !self.isEmpty else {
            return self
        }
        
        var strm = z_stream()
        var status: Int32
        
        let stream_size = Int32(MemoryLayout<z_stream>.size)
        
        status = deflateInit2_(&strm, level.rawValue, Z_DEFLATED, MAX_WBITS + 16, MAX_MEM_LEVEL, Z_DEFAULT_STRATEGY, ZLIB_VERSION, stream_size)
        
        guard status == Z_OK else {
            throw GzipError(code: status, msg: strm.msg)
        }
        
        var compressed = Data(capacity: 16384)
        
        repeat {
            if Int(strm.total_out) >= compressed.count {
                compressed.count += 16384
            }
            
            let inputCount = self.count
            let outputCount = compressed.count
            
            self.withUnsafeBytes({ (inputPointer: UnsafeRawBufferPointer) in
                strm.next_in = UnsafeMutablePointer<Bytef>(mutating: inputPointer.bindMemory(to: Bytef.self).baseAddress!).advanced(by: Int(strm.total_in))
                strm.avail_in = uInt(inputCount) - uInt(strm.total_in)
                
                compressed.withUnsafeMutableBytes({ (outputPointer: UnsafeMutableRawBufferPointer) in
                    strm.next_out = outputPointer.bindMemory(to: Bytef.self).baseAddress!.advanced(by: Int(strm.total_out))
                    strm.avail_out = uInt(outputCount) - uInt(strm.total_out)
                    
                    status = deflate(&strm, Z_FINISH)
                    
                    strm.next_out = nil
                })
                
                strm.next_in = nil
            })
        } while strm.avail_out == 0
        
        guard deflateEnd(&strm) == Z_OK, status == Z_STREAM_END else {
            throw GzipError(code: status, msg: strm.msg)
        }
        
        compressed.count = Int(strm.total_out)
        
        return compressed
    }
    
    func gzipInflate() throws -> Data {
        guard !self.isEmpty else {
            return self
        }
        
        var strm = z_stream()
        var status: Int32
        
        let stream_size = Int32(MemoryLayout<z_stream>.size)
        
        status = inflateInit2_(&strm, MAX_WBITS + 32, ZLIB_VERSION, stream_size)
        
        guard status == Z_OK else {
            throw GzipError(code: status, msg: strm.msg)
        }
        
        var uncompressed = Data(capacity: self.count * 2)
        
        repeat {
            if Int(strm.total_out) >= uncompressed.count {
                uncompressed.count += self.count / 2
            }
            
            let inputCount = self.count
            let outputCount = uncompressed.count
            
            self.withUnsafeBytes({ (inputPointer: UnsafeRawBufferPointer) in
                strm.next_in = UnsafeMutablePointer<Bytef>(mutating: inputPointer.bindMemory(to: Bytef.self).baseAddress!).advanced(by: Int(strm.total_in))
                strm.avail_in = uInt(inputCount) - uInt(strm.total_in)
                
                uncompressed.withUnsafeMutableBytes({ (outputPointer: UnsafeMutableRawBufferPointer) in
                    strm.next_out = outputPointer.bindMemory(to: Bytef.self).baseAddress!.advanced(by: Int(strm.total_out))
                    strm.avail_out = uInt(outputCount) - uInt(strm.total_out)
                    
                    status = inflate(&strm, Z_SYNC_FLUSH)
                    
                    strm.next_out = nil
                })
                
                strm.next_in = nil
            })
        } while status == Z_OK
        
        guard inflateEnd(&strm) == Z_OK, status == Z_STREAM_END else {
            throw GzipError(code: status, msg: strm.msg)
        }
        
        uncompressed.count = Int(strm.total_out)
        
        return uncompressed
    }
    
    static func dataForResourceName(_ name: String) -> Data? {
        guard let path = Bundle.main.path(forResource: name, ofType: "") else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        let data = try? Data(contentsOf: url)
        return data
    }
    
    // MARK:
    private func cryptoDigest(usingAlgorithm algorithm: CryptoAlgorithm) -> Data {
        let dataBytes = self.bytes
        let len = CC_LONG(self.count)
        var hash = [UInt8](repeating: 0, count: algorithm.length)
        
        let _ = algorithm.digest(dataBytes, len, &hash)
        
        return Data(hash)
    }
    
    private func hmacDigest(usingAlgorithm algorithm: HmacAlgorithm, withKey key: Data) -> Data {
        let keyBytes = key.bytes
        let keyLength = key.count
        let dataBytes = self.bytes
        let dataLength = self.count
        var hash = [UInt8](repeating: 0, count: algorithm.length)
        
        CCHmac(algorithm.algorithm, keyBytes, keyLength, dataBytes, dataLength, &hash)
        
        return Data(hash)
    }
}
