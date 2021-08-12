//
//  Stack.swift
//  Algorithm
//
//  Created by 王战东 on 2021/7/29.
//  Copyright © 2021 zhandongwang. All rights reserved.
//

import Foundation

class Stack<T>{
    private var list:[T];
    init() {
        list = [];
    }
    
    var isEmpty:Bool {
        get {
            list.isEmpty
        }
    }
    var size:Int {
        get {
            list.count
        }
    }
    
    func peek() -> T? {
        if size == 0 {
            return nil;
        }
        return list.last;
    }
    
    func push(newElement:T) {
        list.append(newElement)
    }
    
    func pop() {
        if size == 0 {
            return;
        }
        list.removeLast();
    }
    
}


extension Stack {
    //括号是否匹配
    func isValidParentheses(content: String) -> Bool {
        if (content.count < 2) {
            return false
        }
        let map = [")":"(","]":"[","}":"{"]
        let list = content.map { String.init($0) };
        for item in list {
            if !map.keys.contains(item) {
                push(newElement: item as! T)
            } else {
                if ((peek() as! String) != map[item]) {
                    return false
                } else {
                    pop()
                }
            }
        }
        return isEmpty;
    }
}
