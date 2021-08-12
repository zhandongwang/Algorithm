//
//  Sort.swift
//  Algorithm
//
//  Created by 王战东 on 2020/12/1.
//  Copyright © 2020 zhandongwang. All rights reserved.
//

import Foundation

//冒泡排序
//是否稳定：是
//时间复杂度:O(n*n)
//空间复杂度:O(1)
func bubbleSort<T>(_ elements:[T]) -> [T] where T:Comparable {
    var array = elements;
    guard array.count > 1 else {
        return array;
    }
    for i in 0..<array.count {
        //交换标志
        var flag = false
        for j in 0..<array.count - 1 - i {
            if array[j] > array[j+1] {
                array.swapAt(j+1, j)
                flag = true
            }
        }
        if !flag {
            break;
        }
    }
    return array
    
}

//插入排序：取未排序区间中的元素，在已排序区间中找到合适的插入位置将其插入，并保证已排序区间数据一直有序
//是否稳定：是
//时间复杂度:O(n*n)
//空间复杂度:O(1)
func insertionSort<T>(_ elements:[T]) -> [T] where T:Comparable {
    var array = elements;
    guard array.count > 1  else {
        return array;
    }
    
    for i in 1..<array.count {
        let value = array[i]
        var j = i - 1
        for p in (0...j).reversed() {
            j = p;
            if array[p] > value {
                array[p+1] = array[p]
            } else {
                break
            }
        }
        array[j+1] = value
    }
    return array
}

//选择排序：每次找剩余未排序元素中的最小值，和前面已排序的末尾元素交换位置
//是否稳定：否
//时间复杂度:O(n*n)
//空间复杂度:O(1)
func selectionSort<T>(_ elements:[T]) -> [T] where T:Comparable {
    var array = elements
    guard array.count > 1 else {
        return array
    }
    for i in 0..<array.count {
        var minIndex = i
        var minValue = array[i]
        for j in i..<array.count {
            if array[j] < minValue {
                minIndex = j
                minValue = array[j]
            }
        }
        
        array.swapAt(i,minIndex)
    }
    
    return array
}

//归并排序
//是否稳定：是
//时间复杂度:O(nlogn)
//空间复杂度:O(n)
func mergeSort<T>(_ a: inout T) where T:RandomAccessCollection, T:MutableCollection, T.Element:Comparable {
    mergeSort(&a, from: a.startIndex, to: a.index(before: a.endIndex))
}

func mergeSort<T>(_ a: inout T, from low:T.Index, to high:T.Index) where T:RandomAccessCollection,T:MutableCollection,T.Element:Comparable {
    if low >= high {
        return
    }
    let dist = a.distance(from: low, to: high)
    let mid = a.index(low, offsetBy: dist/2)
    mergeSort(&a, from: low, to: mid)
    mergeSort(&a, from: a.index(mid, offsetBy: 1), to: high)
    merge(&a, from: low, through: mid, to: high)
}

func merge<T>(_ a:inout T, from low:T.Index, through mid:T.Index, to high:T.Index) where T:RandomAccessCollection,
T:MutableCollection, T.Element:Comparable {
    var i = low
    var j = a.index(mid, offsetBy: 1)
    var tmp = Array<T.Element>()
    tmp.reserveCapacity(a.distance(from: low, to: high)+1)
    while i <= mid && j <= high {
        if a[i] <= a[j] {
            tmp.append(a[i])
            a.formIndex(after: &i)
        } else {
            tmp.append(a[j])
            a.formIndex(after: &j)
        }
    }
    var start = i
    var end = mid
    if j <= high {
        start = j
        end = high
    }
    tmp.append(contentsOf: a[start...end])
    var current = low
    for element in tmp {
        a[current] = element
        a.formIndex(after: &current)
    }
    
}
