//
//  DataExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/15.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class DataExtensionTest: XCTestCase {
    
    func test_crypto() {
        let message: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password
        let messageData = Data(message)
        
        var resultData: Data
        var resultString: String
        
        // md2
        resultData = messageData.cryptoData(usingAlgorithm: .md2)
        resultString = messageData.cryptoString(usingAlgorithm: .md2)
        XCTAssertEqual(resultData.bytes, [0xf0, 0x38, 0x81, 0xa8, 0x8c, 0x6e, 0x39, 0x13, 0x5f, 0x0e, 0xcc, 0x60, 0xef, 0xd6, 0x09, 0xb9])
        XCTAssertEqual(resultString, "f03881a88c6e39135f0ecc60efd609b9")
        
        // md4
        resultData = messageData.cryptoData(usingAlgorithm: .md4)
        resultString = messageData.cryptoString(usingAlgorithm: .md4)
        XCTAssertEqual(resultData.bytes, [0x8a, 0x9d, 0x09, 0x3f, 0x14, 0xf8, 0x70, 0x1d, 0xf1, 0x77, 0x32, 0xb2, 0xbb, 0x18, 0x2c, 0x74])
        XCTAssertEqual(resultString, "8a9d093f14f8701df17732b2bb182c74")
        
        // md5
        resultData = messageData.cryptoData(usingAlgorithm: .md5)
        resultString = messageData.cryptoString(usingAlgorithm: .md5)
        XCTAssertEqual(resultData.bytes, [0x5f, 0x4d, 0xcc, 0x3b, 0x5a, 0xa7, 0x65, 0xd6, 0x1d, 0x83, 0x27, 0xde, 0xb8, 0x82, 0xcf, 0x99])
        XCTAssertEqual(resultString, "5f4dcc3b5aa765d61d8327deb882cf99")
        
        // sha1
        resultData = messageData.cryptoData(usingAlgorithm: .sha1)
        resultString = messageData.cryptoString(usingAlgorithm: .sha1)
        XCTAssertEqual(resultData.bytes, [0x5b, 0xaa, 0x61, 0xe4, 0xc9, 0xb9, 0x3f, 0x3f, 0x06, 0x82, 0x25, 0x0b, 0x6c, 0xf8, 0x33, 0x1b, 0x7e, 0xe6, 0x8f, 0xd8])
        XCTAssertEqual(resultString, "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8")
        
        // sha224
        resultData = messageData.cryptoData(usingAlgorithm: .sha224)
        resultString = messageData.cryptoString(usingAlgorithm: .sha224)
        XCTAssertEqual(resultData.bytes, [0xd6, 0x3d, 0xc9, 0x19, 0xe2, 0x01, 0xd7, 0xbc, 0x4c, 0x82, 0x56, 0x30, 0xd2, 0xcf, 0x25, 0xfd, 0xc9, 0x3d, 0x4b, 0x2f, 0x0d, 0x46, 0x70, 0x6d, 0x29, 0x03, 0x8d, 0x01])
        XCTAssertEqual(resultString, "d63dc919e201d7bc4c825630d2cf25fdc93d4b2f0d46706d29038d01")
        
        // sha256
        resultData = messageData.cryptoData(usingAlgorithm: .sha256)
        resultString = messageData.cryptoString(usingAlgorithm: .sha256)
        XCTAssertEqual(resultData.bytes, [0x5e ,0x88 ,0x48 ,0x98 ,0xda ,0x28 ,0x04 ,0x71 ,0x51 ,0xd0 ,0xe5 ,0x6f ,0x8d ,0xc6 ,0x29 ,0x27 ,0x73 ,0x60 ,0x3d ,0x0d ,0x6a ,0xab ,0xbd ,0xd6 ,0x2a ,0x11 ,0xef ,0x72 ,0x1d ,0x15 ,0x42 ,0xd8])
        XCTAssertEqual(resultString, "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8")
        
        // sha384
        resultData = messageData.cryptoData(usingAlgorithm: .sha384)
        resultString = messageData.cryptoString(usingAlgorithm: .sha384)
        XCTAssertEqual(resultData.bytes, [0xa8 ,0xb6 ,0x4b ,0xab ,0xd0 ,0xac ,0xa9 ,0x1a ,0x59 ,0xbd ,0xbb ,0x77 ,0x61 ,0xb4 ,0x21 ,0xd4 ,0xf2 ,0xbb ,0x38 ,0x28 ,0x0d ,0x3a ,0x75 ,0xba ,0x0f ,0x21 ,0xf2 ,0xbe ,0xbc ,0x45 ,0x58 ,0x3d ,0x44 ,0x6c ,0x59 ,0x86 ,0x60 ,0xc9 ,0x4c ,0xe6 ,0x80 ,0xc4 ,0x7d ,0x19 ,0xc3 ,0x07 ,0x83 ,0xa7])
        XCTAssertEqual(resultString, "a8b64babd0aca91a59bdbb7761b421d4f2bb38280d3a75ba0f21f2bebc45583d446c598660c94ce680c47d19c30783a7")
        
        // sha512
        resultData = messageData.cryptoData(usingAlgorithm: .sha512)
        resultString = messageData.cryptoString(usingAlgorithm: .sha512)
        XCTAssertEqual(resultData.bytes, [0xb1 ,0x09 ,0xf3 ,0xbb ,0xbc ,0x24 ,0x4e ,0xb8 ,0x24 ,0x41 ,0x91 ,0x7e ,0xd0 ,0x6d ,0x61 ,0x8b ,0x90 ,0x08 ,0xdd ,0x09 ,0xb3 ,0xbe ,0xfd ,0x1b ,0x5e ,0x07 ,0x39 ,0x4c ,0x70 ,0x6a ,0x8b ,0xb9 ,0x80 ,0xb1 ,0xd7 ,0x78 ,0x5e ,0x59 ,0x76 ,0xec ,0x04 ,0x9b ,0x46 ,0xdf ,0x5f ,0x13 ,0x26 ,0xaf ,0x5a ,0x2e ,0xa6 ,0xd1 ,0x03 ,0xfd ,0x07 ,0xc9 ,0x53 ,0x85 ,0xff ,0xab ,0x0c ,0xac ,0xbc ,0x86])
        XCTAssertEqual(resultString, "b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86")
    }
    
    func test_hmac() throws {
        let message: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password
        let messageData = Data(message)
        
        let key: [UInt8] = [107, 101, 121] // key
        let keyString = "key"
        let keyData = Data(key)
        
        var resultData: Data
        var resultString: String
        
        // md5
        resultData = messageData.hmacData(usingAlgorithm: .md5, withKey: keyData)
        resultString = try messageData.hmacString(usingAlgorithm: .md5, withKey: keyString)
        XCTAssertEqual(resultData.bytes, [0xa9 ,0x56 ,0x69 ,0xc5 ,0x50 ,0xc0 ,0xc9 ,0xcc ,0x91 ,0xef ,0x29 ,0xa9 ,0x18 ,0x73 ,0xca ,0x4f])
        XCTAssertEqual(resultString, "a95669c550c0c9cc91ef29a91873ca4f")
        
        // sha1
        resultData = messageData.hmacData(usingAlgorithm: .sha1, withKey: keyData)
        resultString = try messageData.hmacString(usingAlgorithm: .sha1, withKey: keyString)
        XCTAssertEqual(resultData.bytes, [0x42 ,0x90 ,0xba ,0xc2 ,0x4d ,0x78 ,0xe7 ,0x56 ,0x16 ,0x3d ,0x8d ,0xe9 ,0xdb ,0x5d ,0x6d ,0xc1 ,0x5c ,0x1d ,0xa8 ,0x45])
        XCTAssertEqual(resultString, "4290bac24d78e756163d8de9db5d6dc15c1da845")
        
        // sha224
        resultData = messageData.hmacData(usingAlgorithm: .sha224, withKey: keyData)
        resultString = try messageData.hmacString(usingAlgorithm: .sha224, withKey: keyString)
        XCTAssertEqual(resultData.bytes, [0xab ,0x26 ,0xf3 ,0x31 ,0xd4 ,0x8f ,0x1e ,0x08 ,0x92 ,0x2c ,0x22 ,0x9b ,0xf7 ,0x42 ,0xbc ,0x43 ,0xb8 ,0xad ,0x72 ,0x30 ,0xd7 ,0xe5 ,0x81 ,0xce ,0x08 ,0xe5 ,0xa7 ,0x00])
        XCTAssertEqual(resultString, "ab26f331d48f1e08922c229bf742bc43b8ad7230d7e581ce08e5a700")
        
        // sha256
        resultData = messageData.hmacData(usingAlgorithm: .sha256, withKey: keyData)
        resultString = try messageData.hmacString(usingAlgorithm: .sha256, withKey: keyString)
        XCTAssertEqual(resultData.bytes, [0x4d ,0x42 ,0xfb ,0x9f ,0xfc ,0x8d ,0x7d ,0x0a ,0x24 ,0x54 ,0x29 ,0x43 ,0x8b ,0x4b ,0xc7 ,0x3d ,0xb1 ,0x00 ,0x7a ,0x16 ,0x70 ,0x26 ,0xa0 ,0xa0 ,0xc6 ,0xa7 ,0x4f ,0xa5 ,0x8e ,0x8e ,0x86 ,0xca])
        XCTAssertEqual(resultString, "4d42fb9ffc8d7d0a245429438b4bc73db1007a167026a0a0c6a74fa58e8e86ca")
        
        // sha384
        resultData = messageData.hmacData(usingAlgorithm: .sha384, withKey: keyData)
        resultString = try messageData.hmacString(usingAlgorithm: .sha384, withKey: keyString)
        XCTAssertEqual(resultData.bytes, [0x20 ,0x80 ,0x37 ,0x8a ,0xab ,0x16 ,0xd0 ,0xfb ,0xb9 ,0x6f ,0xac ,0x09 ,0xc4 ,0xa6 ,0x76 ,0x33 ,0x9b ,0x35 ,0x31 ,0x8e ,0x6d ,0x17 ,0xc7 ,0x9d ,0x6b ,0x5e ,0x46 ,0xe6 ,0x41 ,0xf6 ,0x07 ,0x17 ,0x94 ,0xcf ,0xc9 ,0x3d ,0x02 ,0x4a ,0x2f ,0x42 ,0x79 ,0xb4 ,0x41 ,0xb7 ,0x85 ,0xc2 ,0x86 ,0xbd])
        XCTAssertEqual(resultString, "2080378aab16d0fbb96fac09c4a676339b35318e6d17c79d6b5e46e641f6071794cfc93d024a2f4279b441b785c286bd")
        
        // sha512
        resultData = messageData.hmacData(usingAlgorithm: .sha512, withKey: keyData)
        resultString = try messageData.hmacString(usingAlgorithm: .sha512, withKey: keyString)
        XCTAssertEqual(resultData.bytes, [0x23 ,0x9b ,0x92 ,0x09 ,0xe9 ,0xe1 ,0x9d ,0x2d ,0xd3 ,0x5e ,0x33 ,0xaf ,0x90 ,0xb6 ,0x3e ,0x3e ,0x6c ,0x15 ,0x64 ,0x36 ,0x23 ,0x83 ,0x93 ,0xc7 ,0xd2 ,0xa5 ,0x8a ,0xdb ,0x75 ,0x4f ,0xa7 ,0xd7 ,0x27 ,0xeb ,0xa0 ,0x51 ,0x7c ,0xff ,0x4b ,0x62 ,0x07 ,0x4c ,0xd2 ,0x75 ,0x23 ,0xa4 ,0x2c ,0x56 ,0xc0 ,0x67 ,0xb8 ,0x04 ,0x7b ,0x3b ,0xd9 ,0xb0 ,0x99 ,0x40 ,0xe9 ,0x4f ,0xce ,0xa7 ,0xf9 ,0x60])
        XCTAssertEqual(resultString, "239b9209e9e19d2dd35e33af90b63e3e6c156436238393c7d2a58adb754fa7d727eba0517cff4b62074cd27523a42c56c067b8047b3bd9b09940e94fcea7f960")
        
    }
    
    func test_crc_32() {
        let message: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password
        let messageData = Data(message)
        
        var result: UInt32
        var resultString: String
        
        result = messageData.crc32()
        resultString = messageData.crc32String()
        XCTAssertEqual(result, 0x35c246d5)
        XCTAssertEqual(resultString, "35c246d5")
    }
    
    func test_aes_encrypt_perf() {
        let key: Array<UInt8> = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
        let iv: Array<UInt8> = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f]
        let message = Array<UInt8>(repeating: 7, count: 1024 * 1024)
        
        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)
        
        measure {
            _ = try! messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
        }
    }
    
    func test_aes_decrypt_perf() {
        let key: Array<UInt8> = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
        let iv: Array<UInt8> = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f]
        let message = Array<UInt8>(repeating: 7, count: 1024 * 1024)
        
        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)
        
        measure {
            _ = try! messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
        }
    }
    
    func test_aes_invalid_key_size() {
        let key: [UInt8] = [0x2b, 0x7e, 0x15]
        let iv: [UInt8] = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f]
        let message: [UInt8] = [UInt8](repeating: 1, count: 10)
        
        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)
        
        var result: Data? = nil
        
        do {
            result = try messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
        }
        catch let error as Aes256Error {
            XCTAssertEqual(error.localizedDescription, Aes256Error.invalidKeySize.localizedDescription)
        }
        catch _ {
            XCTFail("Caught Error")
        }
        XCTAssertNil(result)
    }
    
    func test_aes_invalid_vector_size() {
        let key: [UInt8] = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
        let iv: [UInt8] = [0x00, 0x01, 0x02]
        let message: [UInt8] = [UInt8](repeating: 1, count: 10)
        
        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)
        
        var result: Data? = nil
        
        do {
            result = try messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
        }
        catch let error as Aes256Error {
            XCTAssertEqual(error.localizedDescription, Aes256Error.invalidVectorSize.localizedDescription)
        }
        catch _ {
            XCTFail("Caught Error")
        }
        XCTAssertNil(result)
    }
    
    func test_aes_16_key() {
        let key: [UInt8] = [110, 73, 99, 67, 107, 119, 89, 109, 88, 67, 85, 120, 101, 69, 56, 82] // nIcCkwYmXCUxeE8R
        let iv: [UInt8] = [48, 100, 80, 114, 109, 116, 89, 68, 84, 100, 118, 51, 56, 80, 117, 56] // 0dPrmtYDTdv38Pu8
        let message: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password

        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)

        do {
            let encrypt = try messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
            XCTAssertEqual(encrypt.base64EncodedString(), "rANsz2aqcPoQGI76LJF3KQ==")
            let decrypt = try encrypt.aes256(usingAlgorithm: .decrypt, withKey: keyData, withVector: ivData)
            XCTAssertEqual(decrypt.utf8String(), "password")
        }
        catch {
            XCTFail("Caught AES Test Error")
        }
    }
    
    func test_aes_24_key() {
        let key: [UInt8] = [75, 70, 78, 83, 78, 104, 74, 85, 73, 56, 77, 103, 104, 89, 105, 85, 116, 115, 52, 67, 71, 115, 100, 49] // KFNSNhJUI8MghYiUts4CGsd1
        let iv: [UInt8] = [48, 100, 80, 114, 109, 116, 89, 68, 84, 100, 118, 51, 56, 80, 117, 56] // 0dPrmtYDTdv38Pu8
        let message: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password
        
        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)
        
        do {
            let encrypt = try messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
            XCTAssertEqual(encrypt.base64EncodedString(), "y6RFrihifgG9Vei4pchqEw==")
            let decrypt = try encrypt.aes256(usingAlgorithm: .decrypt, withKey: keyData, withVector: ivData)
            XCTAssertEqual(decrypt.utf8String(), "password")
        }
        catch {
            XCTFail("Caught AES Test Error")
        }
    }
    
    func test_aes_32_key() {
        let key: [UInt8] = [66, 73, 113, 82, 109, 32, 82, 106, 68, 106, 81, 89, 89, 86, 102, 69, 76, 108, 86, 69, 109, 119, 99, 52, 77, 70, 100, 77, 51, 81, 82, 78] // BIqRm RjDjQYYVfELlVEmwc4MFdM3QRN
        let iv: [UInt8] = [48, 100, 80, 114, 109, 116, 89, 68, 84, 100, 118, 51, 56, 80, 117, 56] // 0dPrmtYDTdv38Pu8
        let message: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password
        
        let keyData = Data(key)
        let ivData = Data(iv)
        let messageData = Data(message)
        
        do {
            let encrypt = try messageData.aes256(usingAlgorithm: .encrypt, withKey: keyData, withVector: ivData)
            XCTAssertEqual(encrypt.base64EncodedString(), "T35SeSmeKjMd3ID0Y2HDjg==")
            let decrypt = try encrypt.aes256(usingAlgorithm: .decrypt, withKey: keyData, withVector: ivData)
            XCTAssertEqual(decrypt.utf8String(), "password")
        }
        catch {
            XCTFail("Caught AES Test Error")
        }
    }
    
    func test_utf8_string() {
        let test: [UInt8] = [112, 97, 115, 115, 119, 111, 114, 100] // password
        let testData = Data(test)
        XCTAssertEqual(testData.utf8String(), "password")
    }
    
    func test_hex_string() {
        let test: [UInt8] = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05]
        let testData = Data(test)
        XCTAssertEqual(testData.hexString(), "000102030405")
    }
    
    func test_json_value_decoded() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.json", withExtension: nil) else {
            return
        }
        let data = try Data(contentsOf: url)
        let decoded = try data.jsonValueDecoded()
        XCTAssertTrue(decoded is [String])
        XCTAssertEqual((decoded as! [String]).count, 3)
    }
    
    func test_json_value_decoded_error() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.txt.gz", withExtension: nil) else {
            return
        }
        
        var decoded: Any? = nil
        
        do {
            let data = try Data(contentsOf: url)
            decoded = try data.jsonValueDecoded()
        }
        catch let error {
            XCTAssertNotNil(error)
        }
        
        XCTAssertNil(decoded)
    }
    
    func test_gzip() throws {
        for _ in 0..<10 {
            let string = String.lorem(length: Int.random(in: 1..<100_000))
            let data = string.data(using: .utf8)!
            
            let deflate = try data.gzipDeflate()
            let inflate = try deflate.gzipInflate()

            let inflateString = inflate.utf8String()
            
            XCTAssertNotEqual(deflate, data)
            XCTAssertEqual(inflateString, string)
            
            XCTAssertTrue(deflate.isGzipped)
            XCTAssertFalse(data.isGzipped)
            XCTAssertFalse(inflate.isGzipped)
        }
    }
    
    func test_empty_data() throws {
        let emptyData = Data()
        XCTAssertEqual(try emptyData.gzipDeflate(), emptyData)
        XCTAssertEqual(try emptyData.gzipInflate(), emptyData)
        XCTAssertFalse(emptyData.isGzipped)
    }
    
    func test_gzip_error() {
        let data = "testString".data(using: .utf8)!
        var uncompressed: Data?
        do {
            uncompressed = try data.gzipInflate()
        }
        catch let error as GzipError where error.kind == .data {
            XCTAssertEqual(error.message, "incorrect header check")
            XCTAssertEqual(error.message, error.description)
        }
        catch _ {
            XCTFail("Caught Error")
        }
        XCTAssertNil(uncompressed)
    }
    
    func test_gzip_compression_level() throws {
        let data = String.lorem(length: 100_100).data(using: .utf8)!
        XCTAssertGreaterThan(try data.gzipDeflate(level: .bestSpeed).count,
                             try data.gzipDeflate(level: .best).count)
    }
    
    func test_file_inflate() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.txt.gz", withExtension: nil) else {
            return
        }
        let data = try Data(contentsOf: url)
        let inflate = try data.gzipInflate()
        XCTAssertTrue(data.isGzipped)
        XCTAssertEqual(String(data: inflate, encoding: .utf8), "test")
    }
}

private extension String {
    
    static func lorem(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "
        return (0..<length).reduce(into: "", { (string, _) in
            string.append(letters.randomElement()!)
        })
    }
}
