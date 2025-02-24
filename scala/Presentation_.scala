//
// Defining a simple normal class
class Person_Normal(val name: String, var age: Int , var salary :Int) {
  // Method to increment age
  def incrementAge(): Unit = {
    age += 1
  }
  //
  def changeSalary(): Unit = {
    salary += 1
  }
}
object NormalClassExample {
  def main(args: Array[String]): Unit = {
    // Create an instance of Person class
    val person1 = new Person_Normal("John", 30, 5000)

    println(s"Name: ${person1.name}, Age: ${person1.age}")
    // Increment age and display updated details
    person1.incrementAge()
    println(s"Name: ${person1.name}, Age: ${person1.age}")
    person1.changeSalary()
    println(s"Name: ${person1.name}, salary: ${person1.salary}")
  }
}


// Defining a simple case class
case class Person_Case(name: String, age: Int)

object CaseClassExample {
  def main(args: Array[String]): Unit = {
    // Creating an instance of the case class
    val person1 = Person_Case("Alice", 30)
    val person2 = Person_Case("Bob", 25)

    // Printing the case class instance (auto-generated toString)
    println(person1)
    println(person2)
    //
    //Scala automatically provides methods like toString, equals, hashCode, and a copy method.
    // EQUAL
    // Output `false` because they are two different objects in memory.(normal class)
    println(person1 == person2)
    //Output `true` because the content of the class is the same.(case class)
    println(person1 == person2)

    //COPY
    // allows you to create a new instance with the same data, but you can modify
    // a field using the copy method
    val person3 = person1.copy(age = 31)

    //hashCode
    // Manually overriding the hashCode method
    //override
    println(person1.hashCode()) // hashCode based on name and age
    //
    println(person1.hashCode()) // you don't have to override it.

    //toString
    // manually defined to show the object's content (like its fields).
    println(s"Name: ${person1.name}, Age: ${person1.age}") // "Person(name=Alice, age=30)"
    //automatically provided and will print the class name and values of all fields.
    println(person1.toString)   // "Person(Alice,30)"
  }
}
object Main_CleanerCode extends App {
  //Pattern matching helps replace lengthy if-else statements.
  val day = "Monday"
  day match {
    case "Monday" => println("Start of the week!")
    case "Friday" => println("Weekend is near!")
    case _ => println("Just another day!")
  }
}

object Main_EsyDta extends App {
  //Pattern matching extracts values from case classes easily.
  case class Person_EsyDta(name: String, age: Int)

  val person_EsyDta = Person_EsyDta("Alice", 25)

  person_EsyDta match {
    case Person_EsyDta(name, age) => println(s"Name: $name, Age: $age")
    case _ => println("Unknown Person")
  }
}

object Main_HC extends App {
  //simplifies handling multiple conditions at once.
  val fruit = "Orange"

  fruit match {
    case "Apple" => println("It's an apple!")
    case "Banana" => println("It's a banana!")
    case _ => println("Unknown fruit")
  }
}


object Main_tup extends App {
  //works with tuples and other complex data structures (multiple types like tuple, list)
  val tuple = (10, "Scala")

  tuple match {
    case (x, "Scala") => println(s"Found Scala with number: $x")
    case (x, _) => println(s"Found something else with number: $x")
  }
}



object Main_wildcrd extends App {
  val number = 8
//The wildcard _ ensures all unmatched cases are handled.
  number match {
    case 1 => println("One")
    case 2 => println("Two")
    case 8 => println("three")
    case _ => println("Some other number")
  }
}

object Main_type extends App {
  val obj: Any = 1
  //can check the type of an object
  obj match {
    case s: String => println(s"String value: $s")
    case i: Int => println(s"Integer value: $i")
    case _ => println("Unknown type")
  }
}

object Main_condi extends App {
  val number = 20
  //can add conditions within pattern matching
  number match {
    case x if x < 10 => println("Less than 10")
    case x if x >= 10 => println("Greater than or equal to 10")
    case _ => println("Unknown number")
  }
}


object Main_NL extends App {
  val nestedList = List((1, "One"), (2, "Two"))
  //allows you to match and extract values from nested structures.
  nestedList match {
    case List((x, "One"), (y, "Two")) => println(s"Matched: $x, $y")
    case _ => println("No match")
  }
}


// Defining a simple case class
case class Person43543(name: String, age: Int)

object CaseClassPerson {
  def main(args: Array[String]): Unit = {
    // Creating an instance of the case class
    val person1 = Person43543("Alice", 30)
    val person2 = Person43543("Bob", 25)

    // Printing the case class instance (auto-generated toString)
    println(person1)
    println(person2)

    // Comparing two case class instances
    println(person1 == person2)  // false

    // Copying and modifying a field using the copy method
    val person3 = person1.copy(age = 31)
    println(person3)

    person1 match {
      case Person43543("Alice", 30) => println("Found Alice!")
      case _ => println("Unknown person")
    }
  }
}















