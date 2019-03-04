//
//  String+SwiftyNames.swift
//  SwiftyDates
//
//  Created by Ralph Küpper on 7/25/18.
//  Copyright © 2018 Skelpo Inc. All rights reserved.
//

import Foundation

public struct NameParts {
    public var firstname = ""
    public var lastname = ""
    public var middlenames:[String] = []
    public var suffixes:[String] = []
    public var prefixes:[String] = []
}

extension String {
    public func getNameParts() -> NameParts {
        
        var commonPrefixes = ["Dr", "Prof"]
        var commonSuffixes = ["VI", "VII", "VIII", "I", "II", "III", "IV", "JR", "SR", "SNR", "MdB", "StB", "RA", "JNR", "Senior", "Junior", "Jr", "Sr"]
        
        if self.uppercased() == self {
            commonPrefixes = commonPrefixes.map { $0.uppercased() }
            commonSuffixes = commonSuffixes.map { $0.uppercased() }
        }
        if self.lowercased() == self {
            commonPrefixes = commonPrefixes.map { $0.lowercased() }
            commonSuffixes = commonSuffixes.map { $0.lowercased() }
        }
        var name = self.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: ".", with: "")
        var nameparts = NameParts()
        var lastnameSet = false
        var firstnameSet = false
        for suffix in commonSuffixes {
            if name.contains(", \(suffix)") {
                nameparts.suffixes.append(suffix)
                name = name.replacingOccurrences(of: ", \(suffix)", with: "")
            }
            if name.contains(",\(suffix)") {
                nameparts.suffixes.append(suffix)
                name = name.replacingOccurrences(of: ", \(suffix)", with: "")
            }
        }
        if name.contains(", ") {
            
            let comps = name.components(separatedBy: ", ")
            a: for element in comps {
                let otherNames = element.components(separatedBy: " ")
                b: for element2 in otherNames {
                    if commonPrefixes.contains(element2) {
                        nameparts.prefixes.append(element2)
                        continue b
                    }
                    if lastnameSet == false {
                        nameparts.lastname = element2
                        lastnameSet = true
                        continue a
                    }
                }
                if lastnameSet == true {
                    let otherNames = element.components(separatedBy: " ")
                    b: for (index, element) in otherNames.enumerated() {
                        if commonSuffixes.contains(element) {
                            nameparts.suffixes.append(element)
                            continue b
                        }
                        if index == 0 || firstnameSet == false {
                            nameparts.firstname = element
                            firstnameSet = true
                            continue b
                        }
                        if firstnameSet {
                            nameparts.middlenames.append(element)
                        }
                    }
                }
            }
            return nameparts
        }
        var separator = " "
        if name.contains("%20") {
            separator = "%20"
        }
        
        let comps = name.components(separatedBy: separator)
        for element in comps {
            if commonPrefixes.contains(element) {
                nameparts.prefixes.append(element)
                continue
            }
            if firstnameSet == false {
                nameparts.firstname = element
                firstnameSet = true
                continue
            }
            else {
                if commonSuffixes.contains(element) {
                    nameparts.suffixes.append(element)
                    continue
                }
                nameparts.lastname = element
                nameparts.middlenames.append(element)
                
            }
            
        }
        var newMiddlenames:[String] = []
        for m in nameparts.middlenames {
            if !(m == nameparts.lastname) {
                newMiddlenames.append(m)
            }
        }
        nameparts.middlenames = newMiddlenames
        return nameparts
    }
}
