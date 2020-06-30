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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

