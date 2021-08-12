//
//  Queue.swift
//  Algorithm
//
//  Created by 王战东 on 2020/9/3.
//  Copyright © 2020 zhandongwang. All rights reserved.
//

import Foundation

class ArrayQueue<T> {
    var items:[T]
    var capacity = 0
    var head = 0
    var tail = 0
    
    init(defaultElement:T, capacity:Int) {
        items = Array(repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }
    
    var isEmpty:Bool {
        head == tail
    }
    
    var size:Int {
        tail - head
    }
    
    var peek:T? {
        isEmpty ? nil : items[head]
    }
    
    func enqueue(newElement:T) -> Bool {
        //判满
        if tail == capacity {
            //队列已满
            if head == 0 {
                return false
            } else {
                //移动元素
                for i in head ..< tail {
                    items[i-head] = items[i]
                }
                tail -= head
                head = 0
            }
        }
        items[tail] = newElement
        tail += 1

        return true
    }

    func dequeue() -> T? {
        //判空
        if isEmpty {
            return nil
        }
        let item = items[head];
        head += 1
        return item
    }

}

class ListQueue<T:Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty:Bool {head == nil}
    
    var size:Int {
        if isEmpty {
            return 0
        }
        var count = 1
        while head?.next != nil {
            head = head!.next
            count += 1
        }
        return count
        
    }
    
    var peek:T? { head?.value }
    
    func enqueue(newElement:T) -> Bool {
        if isEmpty {
            let node = Node.init(value: newElement)
            head = node
            tail = node
        } else {
            tail!.next = Node.init(value: newElement)
            tail = tail?.next
        }
        return true
    }
    func dequeue() -> T? {
        //判空
        if isEmpty {
            return nil
        } else {
            let node = head;
            head = head!.next
            return node?.value
        }
    }
}
