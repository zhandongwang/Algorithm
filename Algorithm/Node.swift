//
//  Node.swift
//  Algorithm
//
//  Created by 王战东 on 2021/8/12.
//  Copyright © 2021 zhandongwang. All rights reserved.
//

import Foundation

class Node<T:Equatable> {
    var value:T?
    var next:Node?
    
    public init(){}
    
    public init(value:T){
        self.value = value
    }
}
