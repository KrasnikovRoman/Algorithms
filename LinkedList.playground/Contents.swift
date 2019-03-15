class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: Node<T>? // head is nil when list is empty
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if var head = head {
            while head.next != nil {
                head = head.next!
            }
            head.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func insert(value: T, at position: Int) {
        let newNode = Node(value: value)
        
        if position == 0 {
            newNode.next = head
            head = newNode
        } else {
            var previous = head
            var current = head
            
            for _ in 0..<position {
                previous = current
                current = current?.next
            }
            
            previous?.next = newNode
            newNode.next = current
        }
    }
    
    // TODO
    public func remove(value: T) {
        
    }
    
    // TODO
    public func remove(at position: Int) {
        
    }
    
    public func printList() {
        var currentNode: Node? = head
        while currentNode != nil {
            print("Item = \(currentNode!.value)")
            currentNode = currentNode?.next
        }
    }
}

let list = LinkedList<Int>()
list.append(value: 1)
list.append(value: 3)
list.append(value: 213)
list.append(value: 231)

list.insert(value: 101, at: 2)
list.insert(value: 202, at: 5)
list.printList()
list.isEmpty
