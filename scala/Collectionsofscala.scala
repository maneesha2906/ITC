//Lists - order, by default - immutable, allow duplicates)
object ScalaListOperations {
  def main(args: Array[String]): Unit = {
    // Immutable List
    val fruits = List("Apple", "Banana", "Cherry")
    println(fruits.head)  // First element: Apple
    println(fruits.tail)  // Remaining elements: List(Banana, Cherry)

    // Adding elements (creates a new list)
    val newFruits = "Orange" :: fruits
    println(newFruits)  // List(Orange, Apple, Banana, Cherry)

    // ListBuffer (Efficient for appends)
    import scala.collection.mutable.ListBuffer
    val buffer = ListBuffer(1, 2, 3)
    buffer += 4  // Append operation
    println(buffer)  // Output: ListBuffer(1, 2, 3, 4)
    buffer.append(5) // Another way to append
    println(buffer)  // Output: ListBuffer(1, 2, 3, 4, 5)
  }
}

// Vectors (Fast Immutable Alternative)
object ScalaVectorOperations {
  def main(args: Array[String]): Unit = {
    // Vector (Fast immutable collection)
    val numbers = Vector(1, 2, 3, 4, 5)

    // Fast indexed access
    println(numbers(2))  // Output: 3

    // Creating a new vector with an appended element
    val newNumbers = numbers :+ 6
    println(newNumbers)  // Output: Vector(1, 2, 3, 4, 5, 6)
  }
}

// Arrays (Fixed-size, Fast Access)
import scala.collection.mutable.ArrayBuffer
object ScalaArrayOperations {
  def main(args: Array[String]): Unit = {
    // Array (Mutable)
    val arr = Array(10, 20, 30)
    println(arr(1)) // Output: 20
    arr(1) = 50 // Mutating the array
    println(arr.mkString(", ")) // Output: 10, 50, 30

    // ArrayBuffer (Better than ListBuffer for indexed access)
    val arrBuf = ArrayBuffer(10, 20, 30)
    arrBuf += 40
    println(arrBuf) // Output: ArrayBuffer(10, 20, 30, 40)
  }
}

//Tuple (Immutable, 1-based index, Can store different data types, allow duplicates)
object ScalaTupleOperations {
  def main(args: Array[String]): Unit = {
    val person = ("Alice", 25, 5.5)
    println(person._1)  // Output: Alice
    println(person._2)  // Output: 25
    println(person._3)  // Output: 5.5
  }
}

// Maps (Key-Value Pairs)
object ScalaMapOperations {
  def main(args: Array[String]): Unit = {
    // Immutable Map
    val capitals = Map("France" -> "Paris", "Japan" -> "Tokyo")
    println(capitals("France"))  // Output: Paris

    // Mutable Map
    import scala.collection.mutable.Map
    val mMap = Map("India" -> "Delhi")
    mMap("India") = "New Delhi"  // Updating value
    mMap += ("USA" -> "Washington DC")  // Adding new key-value pair
    println(mMap)  // Output: Map(India -> New Delhi, USA -> Washington DC)
  }
}

//Set Operations (unorder, No duplicates)
object ScalaSetOperations {
  def main(args: Array[String]): Unit = {
    // Immutable Set
    val nums = Set(1, 2, 3, 3, 4) // no duplicates
    println(nums)  // Output: Set(1, 2, 3, 4)

    // Mutable Set
    import scala.collection.mutable.Set
    val mSet = Set(5, 6, 7)
    mSet += 8  // Adding element
    println(mSet)  // Output: Set(5, 6, 7, 8)
    //The order of elements in a Scala Set is not guaranteed, as sets are unordered collections of unique elements. When you print a set, the elements may appear in any order, depending on how they are stored internally.
  }
}

//Using view for Lazy Evaluation
// Performance: Avoids materializing large collections in memory
object ScalaViewOperations {
  def main(args: Array[String]): Unit = {
    // Using view to avoid unnecessary computation
    val numbers = (1 to 100).view.map(_ * 2)
    val result = numbers.take(10).toList  // Only computes first 10 elements
    println(result)  // Output: List(2, 4, 6, ..., 20)
  }
}

// Use LazyList for Infinite Sequences
object ScalaLazyListOperations {
  def main(args: Array[String]): Unit = {
    val stream = LazyList.from(1)
    println(stream.take(5).toList) // Output: List(1, 2, 3, 4, 5)
  }
}

//Using foldLeft for Aggregation
//Performance: More memory-efficient than recursion
//syntax: collection.foldLeft(initialValue)(operation)
object ScalaFoldOperations {
  def main(args: Array[String]): Unit = {
    val sum = (1 to 10).foldLeft(0)(_ + _)
    println(sum)  // Output: Sum of first 10 numbers
  }
}

//Using Efficient Filtering and Mapping
//Optimization Tip: Use filter before map to reduce unnecessary operations.
object ScalaFilterMapOperations {
  def main(args: Array[String]): Unit = {
    val evenNumbers = (1 to 100).filter(_ % 2 == 0).map(_ * 2)
    println(evenNumbers.take(5))
  }
}