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
        // Do any additional setup after loading the view, typically from a nib.
        let s = Solution()
        let result = s.twoSum([2,7,11,15], 9);
        print(result);
        var str = 1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (index, value) in nums.enumerated() {
            let tempValue = target - value
            if dict.keys.contains(tempValue) && dict[tempValue] != index {
                return [dict[tempValue]!,index]
            }
            dict[value] = index
        }
        return [-1, -1]
    }
}
