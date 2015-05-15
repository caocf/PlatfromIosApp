//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//for override 

//继承 不光是能继承 方法 还能继承 计算变量 和存储变量的 监视器

//只读变量可以修改为 读写变量 但是读写变量继承后不能修改为只读变量


class  Animal {
    var age : Int{
        
        get {
            return 1;
        }
        set {
            
        }
        
    }
    
    //和set get 不能共存 *注意赋值
    var width : Double = 0.0 {
                willSet {            var  temps = "willSet---\(newValue)"        } didSet {
            var  temps1 = "didSet---\(oldValue)"        }
    }

    
    func getAgeForMe(#name :Int){
        
    }
}

//final的作⽤//           ● 被final修饰的属性、⽅方法、下标脚本,都不能被⼦子类重写
//           ● 被final修饰的类,不能被继承

final class Dialog : Animal {
     override func getAgeForMe(#name: Int) {
        super.getAgeForMe(name: name);
    }
      
            
            //如果重写了变量的监视器 则 需要注意的是 子类 变动了 父亲的监视器也会执行
       final   override  var width : Double {
                willSet {        var  temps = "willSet---\(newValue)"        } didSet {
        var  temps1 = "didSet---\(oldValue)"        }
            }
   

          override  var age : Int{
            
            get {
            return 1;
            }
            set {
                
            }
            
            }
            
}






