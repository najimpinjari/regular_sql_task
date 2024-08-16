var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var Person = /** @class */ (function () {
    //constructor 
    function Person(name, age) {
        this.name = name;
        this.age = age;
    }
    //method 
    Person.prototype.greeet = function () {
        console.log("hello my name is ".concat(this.name, " and i am from sakri and my age ").concat(this.age));
    };
    return Person;
}());
var person1 = new Person("najim", 24);
person1.greeet(); //hello my name is najim and i am from sakri and my age 24
// class Person {
//     // Fields
//     name: string;
//     age: number;
//     // Constructor
//     constructor(name: string, age: number) {
//         this.name = name;
//         this.age = age;
//     }
// }
var MathUtil = /** @class */ (function () {
    function MathUtil() {
    }
    //statac method 
    MathUtil.clculatecercumface = function (diameter) {
        return this.PI * diameter;
    };
    //static property 
    MathUtil.PI = 3.14;
    return MathUtil;
}());
console.log(MathUtil.PI);
console.log(MathUtil.clculatecercumface(10));
var animal = /** @class */ (function () {
    function animal() {
    }
    animal.prototype.move = function () {
        console.log("Moving ");
    };
    return animal;
}());
var Dog = /** @class */ (function (_super) {
    __extends(Dog, _super);
    function Dog() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Dog.prototype.makesound = function () {
        console.log("Bark");
    };
    return Dog;
}(animal));
var dog = new Dog();
dog.makesound();
dog.move();
