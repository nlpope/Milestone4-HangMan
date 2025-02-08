//
//  Dictionary+Ext.swift
//  Milestone4-HangMan
//
//  Created by Noah Pope on 2/8/25.
//

import Foundation

extension Dictionary where Value: Equatable
{
    func getKey(forValue val: Value) -> Key?
    {
        // key = $0, value = $1
        return first(where: { $1 == val })?.key
    }
}
