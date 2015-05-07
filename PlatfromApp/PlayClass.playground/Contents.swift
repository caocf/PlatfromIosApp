//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var mButton = UIButton();
mButton.backgroundColor = UIColor.redColor();
mButton.frame =  CGRectMake(10, 10, 200, 200);
// ---------- 基础类的操作－－－－－－－－－－－－－－－－－－－－－

class MyClass{
//    类型方法 静态方法 oc 中用＋号开头
    class func method (name: Int ){
    
    }
    
    //实例方法 可以和类型方法完全一致
    func method (){
        
    }

    let right = 1;
    var left = 2.0;
    var catd = 3.0;
    //在第一次调用的时候初始化 必须是变量 延迟加载变量
    lazy var cat = 30;
    
    //计算属性(int 和double 在编译的阶段就不让操作)
    var name :Double {
        return  catd * left;
    }
    
    var name1 : Double {
        get{
            return catd * left;
        }

        set{
            catd = newValue ;
            //别再这个里面跳用self name1 否则事死讯换
            self.catd;
        }
    }
    
    
    class var PI : Double {
        return  3.14;
    }
    
    
    //和set get 不能共存
    var width : Double = 0.0 {
                willSet {        var  temps = "willSet---\(newValue)"        } didSet {
        var  temps1 = "didSet---\(oldValue)"        }
    }
    
}


var mObject = MyClass();
mObject.left = 30;
mObject.name
mObject.name1; //执行的是get
mObject.name1 = 20.0 //执行的是get
MyClass.PI ; //知道这个pi什么意思了吧


mObject.width = 20;


