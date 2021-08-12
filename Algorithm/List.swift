//
//  List.swift
//  Algorithm
//
//  Created by 王战东 on 2020/7/29.
//  Copyright © 2020 zhandongwang. All rights reserved.
//

import Foundation

public class List<Element:Equatable> {
    //哨兵节点
    var dummy = Node<Element>()
    
    public var size:Int {
        var num = 0
        var tempNode = dummy.next
        while tempNode != nil {
            num += 1
            tempNode = tempNode!.next;
        }
        return num
    }
    var isEmpty:Bool {size > 0}
    
    //获取节点
    func node(with value:Element) -> Node<Element>? {
        let node = dummy.next;
        while node != nil {
            if node!.value == value {
                return node
            }
        }
        return nil
    }
    //获取指定位置的节点
    func node(at index:Int)-> Node<Element>? {
        var num = 1
        var node = dummy.next
        while node != nil {
            if num == index {
                return node
            } else {
                num += 1
                node = node!.next
            }
        }
        return nil
    }
    

    //头部插入
    func insertNode(value:Element) {
        let node = Node(value: value)
        insertToHead(node: node)
    }

    func insertToHead(node:Node<Element>) {
        node.next = dummy.next
        dummy.next = node
    }
    //某节点后插入
    func insert(after node:Node<Element>, newValue:Element) {
        let newNode = Node(value: newValue)
        insert(after: node, newNode: newNode)
    }
    func insert(after node:Node<Element>, newNode:Node<Element>) {
        newNode.next = node.next
        node.next = newNode
    }
    //某节点前插入
    func insert(before node:Node<Element>, newValue:Element) {
        let newNode = Node(value: newValue)
        insert(before: node, newNode: newNode)
    }
    
    func insert(before node:Node<Element>, newNode:Node<Element>) {
        var lastNode = dummy
        var tempNode = dummy.next
        while tempNode != nil {
            if tempNode === node {
                newNode.next = tempNode
                lastNode.next = newNode
                break
            } else {
                lastNode = tempNode!
                tempNode = tempNode!.next
            }
        }
        
    }
    //删除节点
    func delete(node:Node<Element>) {
        var lastNode = dummy
        var tempNode = dummy.next
        while tempNode != nil {
            if tempNode === node {
                lastNode.next = tempNode!.next
                break
            } else {
                lastNode = tempNode!
                tempNode = tempNode!.next
            }
            
        }
        
    }
    func delete(value:Element) {
        var lastNode = dummy
        var tempNode = dummy.next
        while tempNode != nil {
            if tempNode!.value == value {
                lastNode.next = tempNode!.next
                break
            } else {
                lastNode = tempNode!;
                tempNode = tempNode!.next
            }
        }
    }
    
    var headNode: Node<Element>? {
        get {
            dummy.next;
        }
        set {
            dummy.next = newValue;
        }
    }
    
}

extension List {
    //遍历链表
    static func logList(head:Node<Element>?) {
        var temp:Node? = head;
        while temp != nil {
            print(temp!.value ?? "", separator: " ", terminator: " ")
            temp = temp!.next;
        }
        print("\n");
        
    }
    
    //链表反转
    func reverse(){
        var prev:Node<Element>? = nil;
        var cur = headNode;
        while cur != nil {
            //先保存下一个节点，防止断链
            let nextNode = cur!.next;
            
            cur!.next = prev
            prev = cur!
            cur = nextNode;
        }
        headNode = prev;
    }
    
    //链表是否有环
    func hasCircle() -> Bool {
        var slow = headNode
        var fast = headNode?.next
        while fast != nil {
            if fast === slow {
                return true
            }
            fast = fast!.next?.next;
            slow = slow!.next
        }
        return false
    }
    //合并2个有序链表
    static func mergeSortedList<Element:Comparable>(headA:Node<Element>?, headB:Node<Element>?) -> Node<Element>? {
        if headA == nil {
            return headB
        }
        if headB == nil {
            return headA
        }
        
        var head:Node<Element>?, tail:Node<Element>?
        var nodeA:Node<Element>? = headA, nodeB:Node<Element>? = headB
        if headA!.value! < headB!.value! {
            head = headA
            nodeA = nodeA!.next;
        } else {
            head = headB
            nodeB = nodeB!.next;
        }
        tail = head
        
        while nodeA != nil, nodeB != nil {
            if nodeA!.value! < nodeB!.value! {
                tail?.next = nodeA
                nodeA = nodeA!.next;
            } else {
                tail?.next = nodeB
                nodeB = nodeB!.next;
            }
            tail = tail!.next;
        }
        
        if nodeA != nil {
            tail?.next = nodeA
        } else {
            tail?.next = nodeB
        }
        
        return head
    }
    
    //删除倒数第N个节点
    static func deleteNode2<E>(at lastNum:Int, in head:Node<E>?)->Node<E>? {
        let dummy:Node<E> = Node()
        dummy.next = head
        
        var fast:Node<E>? = dummy;
        var slow:Node<E>? = dummy;
        
        var num:Int = 0
        //快指针先走N+1步
        while num <= lastNum {
            fast = fast?.next;
            num += 1
        }
        //fast指向nil时，
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
    
    //求链表中间节点
    static func halfNode<E>(in head:Node<E>?) -> Node<E>? {
        var fast:Node<E>? = head;
        var slow:Node<E>? = head;
        while fast?.next != nil, fast?.next?.next != nil {
            fast = fast?.next?.next;
            slow = slow?.next
        }
        return slow;
    }
    //交换链表相邻节点
    static func swapNodesInPairs<E>(head:Node<E>?) -> Node<E>? {
        var pre:Node<E>? = head;
        var cur:Node<E>? = head?.next;
        while cur != nil {
            let temp = pre!.value
            pre!.value = cur!.value;
            cur!.value = temp
            pre = cur?.next;
            cur = cur?.next?.next;
        }
        return head;
    }
    
}
