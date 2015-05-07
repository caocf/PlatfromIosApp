//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//构造函数和析构函数 init


class Dialog {
    var name: String
    }
    
//    //如果有参数的类 则构造方法不加参数的话是不对的
    
//    如果已经有参数的构造方法 了的话 初始化的时候就不能直接 调用无参数的构造方法 （不生成）
//    init(){
//            这样就会提示没有地方初始化构造方法
//    }
    //溪沟方法
    deinit{
    
    }
    convenience init(){
        self.init(name:"dfdf",age :20);
    }
    
 

//    指定构造⽅方法必须调⽤用其直接⽗父类的的指定构造⽅方法(除⾮非没有⽗父类) 件
//    ● 只有便利构造⽅方法才能直接调⽤用当前类的其他构造⽅方法
//    ● 只有指定构造⽅方法才能直接调⽤用⽗父类的构造⽅方法
}
class littleDialog :Dialog{
//    init(){
//    因为父亲有了带成员变量的init 所以 这个父亲没有  默认要调用父亲的所以直接报错
//    }
    
    override init(name: String, age: Int) {
    super.init(name: "", age: 20);
    }
}


class MyButton: UIButton {
        
}


var dialog  = Dialog(name: "dfdf", age: 20);

var name :String? = nil //因为swift 是强类型语言  String 只能存 字符 不能存
var age = "dfdd";
   //Int? 这个是可选类型 可以存int 也可以存 nil 是对int的封装
//可选类型 因为是对int的封装  不能直接 给基础数据类型赋值

// 拆包 ！ 也是对于可选类型的变量的 因为可选类型 封装了 数值 和nil



var tname : String = name! //用！来解包 如果可选存的是nil 运行时会报错

if (name != nil){
    
}else{
    
}


//隐式解包 如果一个变量一定存在 则使用如(在定义变量的时候就加上了）

var namet :String! = "good";

var namet1  :String  = namet;


