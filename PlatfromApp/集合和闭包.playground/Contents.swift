//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func GetList(arr:[Int] , pre:(Int)->Bool) ->[Int]{
    
    //定义一个空的可变整形集合
    var tempArr = [Int]()
    
    for temp in arr {
        
        if pre(temp){
            tempArr.append(temp)
        }
    }
    
    return tempArr;
}
//第一种简写 ：省略 参数类型和括号
var Arr = GetList([1,2,3,4],{s in return s>2})

//第二种简写 : 省略 参数类型和括号，return关键字
Arr = GetList([1,2,3,4], {s in s>2})

//第三种简写 ： 参数名称缩写

Arr = GetList([1,2,3,4],{$0>2}) //其中$0表示第一个参数



println(Arr)



func getBoo (name :Int) ->Bool {
    return true;
    
}

var mFun = getBoo(2);



//函数参数是必报的一种特殊表现形式


func printResult(fn: (Int, Int) -> Int, num1: Int, num2: Int){

    var temp : Int = fn(2,3)
    temp - num1;
}

printResult({
    (s,y) in return s-y
    }, 1, 2)

//: Playground - noun: a place where people can pla