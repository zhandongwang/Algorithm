//
//  ViewController.swift
//  Algorithm
//
//  Created by 王战东 on 2018/12/8.
//  Copyright © 2018年 zhandongwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.;
//        testArrayQueue()
        
        
//        print("find index \(findKeyIndexInArray(data: &list, key: "oneww"))" );
//        testList()
        testStack()
    }
    
    func testStack() {
        let stack = Stack<String>()
        let result = stack.isValidParentheses(content: "{[()]}");
        if result {
            print("true")
        } else {
            print("false")
        }
        
    }
    
    func testList() {
        let listA:List<Int> = List()
        listA.insertNode(value: 5)
        listA.insertNode(value: 4)
        listA.insertNode(value: 3);
        listA.insertNode(value: 2);
        listA.insertNode(value: 1);
        List.logList(head: listA.headNode);

        var result = List<Int>.swapNodesInPairs(head: listA.headNode)
        List.logList(head: result);
        
        
//        let listB:List<Int> = List()
        
//        listB.insertNode(value: 31);
//        listB.insertNode(value: 24);
//        listB.insertNode(value: 15);
//        listB.insertNode(value: 9);
//        List.logList(head: listB.headNode);
        
//        let head = List<Int>.mergeSortedList(headA: listA.headNode, headB: listB.headNode)
//        let head = List<Int>.mergeSortedList(headA: nil, headB: nil)
//        List.logList(head: head);
        
    }
    
    
    func findKeyIndexInArray(data:inout Array<String>, key:String) -> Int {
        let len = data.count
        if len == 0 {
            return -1;
        }
        if data[len-1] == key {
            return len-1;
        }
        let temp = data[len-1]
        data[len-1] = key;
        
        var i = 0
        while data[i] != key {
            i+=1;
        }
        data[len-1] = temp;
        
        if i == len-1 {
            return -1
        } else {
            return i
        }
    }
    
    
    //在数组中查找key，返回key所在的位置
    func findKeyIndex(data:inout Array<String>, key:String) -> Int {
        let length = data.count;
        if length == 0 {
            return -1
        }
        //先比较最后一个元素
        if data[length-1] == key {
            return length-1
        }
        //
        let tmp = data[length-1]
        //设置哨兵
        data[length-1] = key;
        
        var i = 0
        while data[i] != key {
            i+=1
        }
        
        data[length-1] = tmp;
        if i == length-1 {
            return -1
        } else {
            return i;
        }
        
    }

//    func testArrayQueue() {
//        let queue = ArrayQueue.init(defaultItem: "",capacity: 5)
//        queue.enqueue(newItem: "1")
//        queue.enqueue(newItem: "2")
//        queue.enqueue(newItem: "3")
//        queue.enqueue(newItem: "4")
//        queue.enqueue(newItem: "5")
//
//        queue.dequeue();
//
//        queue.enqueue(newItem: "6")
//        queue.logItems();
//
//    }
//
    
    
    
    //两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var temp = [Int:Int]()
       for(index, value) in nums.enumerated(){
           let diff = target - value;
           if let idx = temp[diff] {
            if(index != idx) {
               return [index, idx];
            }
           } else {
               temp[value] = index;
           }
       }
       return [-1,-1]
    }
    
    //整数翻转
    func reverse(_ x: Int) -> Int {
       var tempX:Int = x
       var rev:Int = 0;
        
       while tempX != 0 {
           let pop:Int = tempX % 10;
           rev = rev * 10 + pop;
           tempX = tempX / 10;
        
           if rev > Int32.max || (rev == (Int32.max / 10) && pop > 7) {
              return 0;
           }
            if rev < Int32.min || (rev == (Int32.min / 10) && pop < -8) {
               return 0;
           }
       }
       return rev;
    }
    
}

