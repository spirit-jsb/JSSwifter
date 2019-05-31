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

/// Gzip Error
public struct GzipError: Swift.Error {
    
    /// Gzip Error 类型
    ///
    /// - stream: stream
    /// - data: data
    /// - memory: memory
    /// - buffer: buffer
    /// - version: version
    /// - unknown: unknown
    enum Kind: Equatable {
        case stream
        case data
        case memory
        case buffer
        case version
        case unknown(code: Int)
    }
    
    /// Gzip Error 类型
    let kind: Kind
    
    /// Gzip Error 信息
    let message: String
    
    /// Gzip Error 信息描述
    var description: String {
        return self.message
    }
    
    /// 依据错误 code 和 msg 初始化并生成 GzipError 实例
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

/// Hmac Error
///
/// - invalidKey: 无效的 Key
public enum HmacError: Swift.Error {
    case invalidKey
}

/// Aes 256 Error
///
/// - invalidKeySize: 无效长度的 Key
/// - invalidVectorSize: 无效长度的 Vector
/// - unknown: 未知错误
public enum Aes256Error: Swift.Error {
    case invalidKeySize
    case invalidVectorSize
    case unknown(code: Int32)
}

/// Bundle Error
///
/// - invalidPath: 无效的文件路径
public enum BundleError: Swift.Error {
    case invalidPath
}

public extension Data {
    
    // MARK:
    
    /// 加密算法类型
    ///
    /// - md2: md2
    /// - md4: md4
    /// - md5: md5
    /// - sha1: sha1
    /// - sha224: sha224
    /// - sha256: sha256
    /// - sha384: sha384
    /// - sha512: sha512
    enum CryptoAlgorithm {
        case md2
        case md4
        case md5
        case sha1
        case sha224
        case sha256
        case sha384
        case sha512
        
        /// 各类型加密算法 length 参数
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
        
        /// 各类型加密算法 digest 参数
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
    
    /// Hmac 算法
    ///
    /// - md5: md5
    /// - sha1: sha1
    /// - sha224: sha224
    /// - sha256: sha256
    /// - sha384: sha384
    /// - sha512: sha512
    enum HmacAlgorithm {
        case md5
        case sha1
        case sha224
        case sha256
        case sha384
        case sha512
        
        /// 各类型 Hmac 算法 algorithm 参数
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
        
        /// 各类型 Hmac 算法 length 参数
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
    
    /// Aes256 算法
    ///
    /// - encrypt: 加密
    /// - decrypt: 解密
    enum Aes256Algorithm {
        case encrypt
        case decrypt
        
        /// 各 Aes256 算法 op 参数
        var op: CCOperation {
            switch self {
            case .encrypt: return CCOperation(kCCEncrypt)
            case .decrypt: return CCOperation(kCCDecrypt)
            }
        }
    }
    
    /// Gzip 算法压缩等级
    ///
    /// - no: 无压缩效果
    /// - bestSpeed: 压缩速度有限
    /// - `default`: 默认压缩效果
    /// - best: 压缩质量优先
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
    
    /// 加密算法配置函数闭包，用于导入加密算法中 data\len\md 等配置
    typealias CryptoDigest = (
        _ data: UnsafeRawPointer?,
        _ len: CC_LONG,
        _ md: UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?
    
    /// 返回指定 Data 的字节数组
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
    /// 指定 Data 是否为 Gzip 算法压缩数据
    var isGzipped: Bool {
        return self.starts(with: [0x1f, 0x8b])
    }
    
    // MARK:
    
    /// 将指定 Data 依照 algorithm 配置对应的加密算法，生成并返回加密后的 Data
    ///
    /// - Parameter algorithm: 用于配置加密算法的函数闭包
    /// - Returns: 返回生成的加密 Data
    func cryptoData(usingAlgorithm algorithm: CryptoAlgorithm) -> Data {
        return self.cryptoDigest(usingAlgorithm: algorithm)
    }
    
    /// 将指定 Data 依照 algorithm 配置对应的加密算法，生成并返回加密后的 String
    ///
    /// - Parameter algorithm: 用于配置加密算法的函数闭包
    /// - Returns: 返回生成的加密 String
    func cryptoString(usingAlgorithm algorithm: CryptoAlgorithm) -> String {
        let cryptoData = self.cryptoDigest(usingAlgorithm: algorithm)
        
        var cryptoString = ""
        for byte in cryptoData {
            cryptoString += String(format: "%02x", byte)
        }
        
        return cryptoString
    }
    
    /// 将指定 Data 依照 algorithm\key 配置对应的 Hmac 加密算法，生成并返回加密后的 Data
    ///
    /// - Parameters:
    ///   - algorithm: 用于配置 Hmac 加密算法的枚举类型
    ///   - key: Hmac 算法密钥
    /// - Returns: 返回生成的加密 Data
    func hmacData(usingAlgorithm algorithm: HmacAlgorithm, withKey key: Data) -> Data {
        return self.hmacDigest(usingAlgorithm: algorithm, withKey: key)
    }
    
    /// 将指定 Data 依照 algorithm\key 配置对应的 Hmac 加密算法，生成并返回加密后的 String
    ///
    /// - Parameters:
    ///   - algorithm: 用于配置 Hmac 加密算法的枚举类型
    ///   - key: Hmac 算法密钥
    /// - Returns: 返回生成的加密 String
    func hmacString(usingAlgorithm algorithm: HmacAlgorithm, withKey key: String) throws -> String {
        guard let dataKey = key.data(using: .utf8) else {
            throw HmacError.invalidKey
        }
        
        let hmacData = self.hmacDigest(usingAlgorithm: algorithm, withKey: dataKey)
        
        var hmacString = ""
        for byte in hmacData {
            hmacString += String(format: "%02x", byte)
        }
        
        return hmacString
    }
    
    /// 返回指定 Data crc32 效验结果
    func crc32() -> UInt32 {
        let dataBytes = self.bytes
        let len = uInt(self.count)
        
        let result = zlib.crc32(0, dataBytes, len)
        
        return UInt32(result)
    }
    
    /// 返回指定 Data crc32 效验结果
    func crc32String() -> String {
        let dataBytes = self.bytes
        let len = uInt(self.count)
        
        let result = zlib.crc32(0, dataBytes, len)
        
        return String(format: "%08x", UInt32(result))
    }
    
    /// 将指定 Data 依照 algorithm\key\iv 配置对应的 Aes256 加密算法，生成并返回加密/解密后的 Data
    ///
    /// - Parameters:
    ///   - algorithm: 用于配置 Aes256 加密算法的枚举类型
    ///   - key: Aes256 算法密钥
    ///   - iv: Aes256 算法向量
    /// - Returns: 返回生成的加密/解密 Data
    func aes256(usingAlgorithm algorithm: Aes256Algorithm, withKey key: Data, withVector iv: Data) throws -> Data {
        if key.count != 16 && key.count != 24 && key.count != 32 {
            throw Aes256Error.invalidKeySize
        }
        if iv.count != 16 {
            throw Aes256Error.invalidVectorSize
        }
        
        let bufferSize = self.count + kCCBlockSizeAES128
        var bufferBytes = [UInt8](repeating: 0, count: bufferSize)
        defer {
            bufferBytes.removeAll()
        }
        
        let op = algorithm.op
        let alg = CCAlgorithm(kCCAlgorithmAES)
        let options = CCOptions(kCCOptionPKCS7Padding)
        let keyBytes = key.bytes
        let keyLength = key.count
        let ivBytes = iv.bytes
        let dataBytes = self.bytes
        let dataInLength = self.count
        var encryptedSize: Int = 0
        
        let cryptStatus = CCCrypt(op, alg, options, keyBytes, keyLength, ivBytes, dataBytes, dataInLength, &bufferBytes, bufferSize, &encryptedSize)
        
        guard Int(cryptStatus) == kCCSuccess else {
            throw Aes256Error.unknown(code: cryptStatus)
        }
        
        return Data(bytes: bufferBytes, count: encryptedSize)
    }
    
    /// 返回指定 Data 依据给定 encoding 编码后生成的可选字符串
    ///
    /// - Parameter encoding: encoding
    /// - Returns: 返回指定 Data 依据给定 encoding 编码后生成的可选字符串
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
    /// 返回指定 Data 生成的十六进制字符串
    ///
    /// - Returns: 返回指定 Data 生成的十六进制字符串
    func hexString() -> String {
        let dataBytes = self.bytes
        
        var hexString = ""
        for byte in dataBytes {
            hexString += String(format: "%02x", byte)
        }
        
        return hexString
    }
    
    /// 将指定 Data 依据给定 options 解码为 JSON Value
    ///
    /// - Parameter options: Options used when creating Foundation objects from JSON data
    func jsonValueDecoded(options: JSONSerialization.ReadingOptions = []) throws -> Any {
        return try JSONSerialization.jsonObject(with: self, options: options)
    }
    
    /// 将指定 Data 依据给定 options 解码为 Plist Value
    ///
    /// - Parameter options: The only read options supported are described in PropertyListSerialization.MutabilityOptions.
    func plistValueDecoded(options: PropertyListSerialization.ReadOptions = []) throws -> Any {
        return try PropertyListSerialization.propertyList(from: self, options: options, format: nil)
    }
    
    /// 将指定 Data 依据给定 level 压缩，并返回压缩后的 Data
    ///
    /// - Parameter level: 压缩等级，默认值为 .default
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
    
    /// 将指定 Data 解压缩，并返回解压缩后的 Data
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
    
    /// 依据资源名称，返回从 Main Bundle 中查找到的资源数据
    ///
    /// - Parameter name: 资源名称
    static func dataForResourceName(_ name: String) throws -> Data {
        guard let path = Bundle.main.path(forResource: name, ofType: "") else {
            throw BundleError.invalidPath
        }
        let url = URL(fileURLWithPath: path)
        return try Data(contentsOf: url)
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
