//
//  UIDevice+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/28.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

// https://www.theiphonewiki.com/wiki/Models
private let machineDictionary = ["Watch1,1": "Apple Watch 1st 38mm",
                                 "Watch1,2": "Apple Watch 1st 42mm",
                                 "Watch2,6": "Apple Watch Series 1 38mm",
                                 "Watch2,7": "Apple Watch Series 1 42mm",
                                 "Watch2,3": "Apple Watch Series 2 38mm",
                                 "Watch2,4": "Apple Watch Series 2 42mm",
                                 "Watch3,1": "Apple Watch Series 3 38mm",
                                 "Watch3,2": "Apple Watch Series 3 42mm",
                                 "Watch3,3": "Apple Watch Series 3 38mm",
                                 "Watch3,4": "Apple Watch Series 3 42mm",
                                 "Watch4,1": "Apple Watch Series 4 40mm",
                                 "Watch4,2": "Apple Watch Series 4 44mm",
                                 "Watch4,3": "Apple Watch Series 4 40mm",
                                 "Watch4,4": "Apple Watch Series 4 44mm",
                              
                                 "iPad1,1": "iPad",
                                 "iPad2,1": "iPad 2",
                                 "iPad2,2": "iPad 2",
                                 "iPad2,3": "iPad 2",
                                 "iPad2,4": "iPad 2",
                                 "iPad3,1": "iPad 3rd",
                                 "iPad3,2": "iPad 3rd",
                                 "iPad3,3": "iPad 3rd",
                                 "iPad3,4": "iPad 4th",
                                 "iPad3,5": "iPad 4th",
                                 "iPad3,6": "iPad 4th",
                                 "iPad6,11": "iPad 5th",
                                 "iPad6,12": "iPad 5th",
                                 "iPad7,5": "iPad 6th",
                                 "iPad7,6": "iPad 6th",
                              
                                 "iPad2,5": "iPad mini",
                                 "iPad2,6": "iPad mini",
                                 "iPad2,7": "iPad mini",
                                 "iPad4,4": "iPad mini 2",
                                 "iPad4,5": "iPad mini 2",
                                 "iPad4,6": "iPad mini 2",
                                 "iPad4,7": "iPad mini 3",
                                 "iPad4,8": "iPad mini 3",
                                 "iPad4,9": "iPad mini 3",
                                 "iPad5,1": "iPad mini 4",
                                 "iPad5,2": "iPad mini 4",
                                 "iPad11,1": "iPad mini (5th)",
                                 "iPad11,2": "iPad mini (5th)",
                              
                                 "iPad4,1": "iPad Air",
                                 "iPad4,2": "iPad Air",
                                 "iPad4,3": "iPad Air",
                                 "iPad5,3": "iPad Air 2",
                                 "iPad5,4": "iPad Air 2",
                                 "iPad11,3": "iPad Air (3rd)",
                                 "iPad11,4": "iPad Air (3rd)",
                              
                                 "iPad6,7": "iPad Pro (12.9 inch)",
                                 "iPad6,8": "iPad Pro (12.9 inch)",
                                 "iPad6,3": "iPad Pro (9.7 inch)",
                                 "iPad6,4": "iPad Pro (9.7 inch)",
                                 "iPad7,1": "iPad Pro (12.9 inch)(2nd)",
                                 "iPad7,2": "iPad Pro (12.9 inch)(2nd)",
                                 "iPad7,3": "iPad Pro (10.5 inch)",
                                 "iPad7,4": "iPad Pro (10.5 inch)",
                                 "iPad8,1": "iPad Pro (11.0 inch)",
                                 "iPad8,2": "iPad Pro (11.0 inch)",
                                 "iPad8,3": "iPad Pro (11.0 inch)",
                                 "iPad8,4": "iPad Pro (11.0 inch)",
                                 "iPad8,5": "iPad Pro (12.9 inch)(3rd)",
                                 "iPad8,6": "iPad Pro (12.9 inch)(3rd)",
                                 "iPad8,7": "iPad Pro (12.9 inch)(3rd)",
                                 "iPad8,8": "iPad Pro (12.9 inch)(3rd)",
                              
                                 "iPhone1,1": "iPhone",
                                 "iPhone1,2": "iPhone 3G",
                                 "iPhone2,1": "iPhone 3GS",
                                 "iPhone3,1": "iPhone 4",
                                 "iPhone3,2": "iPhone 4",
                                 "iPhone3,3": "iPhone 4",
                                 "iPhone4,1": "iPhone 4S",
                                 "iPhone5,1": "iPhone 5",
                                 "iPhone5,2": "iPhone 5",
                                 "iPhone5,3": "iPhone 5c",
                                 "iPhone5,4": "iPhone 5c",
                                 "iPhone6,1": "iPhone 5s",
                                 "iPhone6,2": "iPhone 5s",
                                 "iPhone7,2": "iPhone 6",
                                 "iPhone7,1": "iPhone 6 Plus",
                                 "iPhone8,1": "iPhone 6s",
                                 "iPhone8,2": "iPhone 6s Plus",
                                 "iPhone8,4": "iPhone SE",
                                 "iPhone9,1": "iPhone 7",
                                 "iPhone9,3": "iPhone 7",
                                 "iPhone9,2": "iPhone 7 Plus",
                                 "iPhone9,4": "iPhone 7 Plus",
                                 "iPhone10,1": "iPhone 8",
                                 "iPhone10,4": "iPhone 8",
                                 "iPhone10,2": "iPhone 8 Plus",
                                 "iPhone10,5": "iPhone 8 Plus",
                                 "iPhone10,3": "iPhone X",
                                 "iPhone10,6": "iPhone X",
                                 "iPhone11,8": "iPhone XR",
                                 "iPhone11,2": "iPhone XS",
                                 "iPhone11,6": "iPhone XS Max",
                              
                                 "iPod1,1": "iPod touch",
                                 "iPod2,1": "iPod touch 2nd",
                                 "iPod3,1": "iPod touch 3rd",
                                 "iPod4,1": "iPod touch 4th",
                                 "iPod5,1": "iPod touch 5th",
                                 "iPod7,1": "iPod touch 6th",
                              
                                 "i386": "Simulator x86",
                                 "x86_64": "Simulator x64"]

public extension UIDevice {
    
    // MARK:
    var isSimulator: Bool {
        return self.model.contains("Simulator")
    }
    
    var isPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
    }
    
    var isJailbroken: Bool {
        if self.isSimulator {
            return false
        }
        let paths = ["/Applications/Cydia.app",
                     "/private/var/lib/apt/",
                     "/private/var/lib/cydia",
                     "/private/var/stash"]
        for path in paths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        
        if let bash = fopen("/bin/bash", "r") {
            fclose(bash)
            return true
        }
        
        let path = "/private/\(UUID().uuidString)"
        do {
            try "test".write(toFile: path, atomically: true, encoding: .utf8)
            try FileManager.default.removeItem(atPath: path)
            return true
        }
        catch {
            
        }
        
        return false
    }
    
    var machineModel: String? {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: size)
        defer {
            machine.removeAll()
        }
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }
    
    var machineModelName: String? {
        guard let model = self.machineModel else {
            return nil
        }
        return machineDictionary[model]
    }
    
    var systemUptime: Date? {
        let time = ProcessInfo().systemUptime
        return Date(timeIntervalSinceNow: -time)
    }
}
