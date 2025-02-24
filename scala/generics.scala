class Box[T](private var item: T) {
  def setItem(newItem: T): Unit = item = newItem
  def getItem: T = item
}

object FruitBoxApp {
  def main(args: Array[String]): Unit = {
    val appleBox = new Box(5)
    println(appleBox.getItem)

    appleBox.setItem(10)
    println( appleBox.getItem)

    //appleBox.setItem("banana")
    //println( appleBox.getItem)

    val OrangeBox = new Box("Big Orange")
    println(OrangeBox.getItem)

    OrangeBox.setItem("Sweet Orange")
    println(OrangeBox.getItem)

  }
}

// Generic method
def getLength[T>:String](collection: List[T]): Int = {
  collection.length
}

object CollectionApp {
  def main(args: Array[String]): Unit = {
    //println(getLength(List(1, 2,,"Jaya")))       // Works with Int list
    println(getLength(List("jaya", "dhara", "manu","saba"))) // Works with String list
  }
}




















