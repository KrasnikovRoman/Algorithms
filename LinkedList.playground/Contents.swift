class Node<T> {
    
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
}

class LinkedList<T> {
    private var head: Node<T>? // head is nil when list is empty
    
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



class Solution {
    
    // MARK: - Delete duplicate elements from unsorted linked list with using extra buffer
    // Memory - O(N), Speed - O(N)
    static func removeDuplicateWithBuffer(list: LinkedList<Int>) -> LinkedList<Int> {
        var bufferMap: Set<Int> = Set<Int>()
        var previous: Node<Int>?
        
        var currentNode: Node<Int>? = list.first
        
        while currentNode != nil {
            if bufferMap.insert(currentNode!.value).inserted == true {
                previous = currentNode
            } else {
                previous?.next = currentNode!.next
            }
            currentNode = currentNode!.next
            print(bufferMap)
        }
        
        return list
    }
    
    // MARK: - Delete duplicate elements from unsorted linked list without using extra buffer
    // Memory - O(1), Speed - O(N^2)
    static func removeDuplicateWithoutBuffer(list: LinkedList<Int>) -> LinkedList<Int> {
        var currentNode: Node<Int>? = list.first
        while currentNode != nil {
            var runnerNode: Node<Int>? = currentNode
            
            while runnerNode!.next != nil {
                if runnerNode!.next!.value == currentNode!.value {
                    runnerNode!.next = runnerNode!.next!.next
                } else {
                    runnerNode = runnerNode!.next
                }
            }
            
            currentNode = currentNode!.next
        }
        
        
        return list
    }
    
    
    // MARK: - Find k-th node from Linked List's tail
    // Memory - O(1), Speed - O(N)
    static func findNodeFromTail(list: LinkedList<Int>, k: Int) -> Node<Int>? {
        if k <= 0 {
            print("Number K must be greater or equal 1")
            return nil
        }
        
        var left: Node<Int>? = list.first
        var right: Node<Int>? = list.first
        
        for _ in 1...k {
            if right != nil {
                right = right!.next
            } else {
                print("Number K greater than Linked List size")
                return nil
            }
        }
        
        while right != nil {
            left = left!.next
            right = right!.next
        }
        
        return left
    }
    
    // MARK: - Удалить узел из середины списка(то есть узла, не являющимся ни начальным, ни конечным - не обязательно находящимся точно в середине). Доступ предоставляется только к удаляемому узлу
    static func removeNode(node: Node<Int>?) -> Bool {
        if node == nil || node?.next == nil {
            return false
        }
        
        let nextNode: Node<Int>? = node!.next
        
        node!.value = nextNode!.value
        node!.next = nextNode!.next
        return true
    }
    
    // MARK: - Проверить перескаются ли два односвязных списка. Вернуть узел пересечения
    // Memory - O(1), Speed - O(A+B), A,B - длины связных списков
    static func findIntersectrion(first: Node<Any>?, second: Node<Any>?) -> Node<Any>? {
        class Result {
            let tail: Node<Any>?
            let size: Int
            
            init(tail: Node<Any>?, size: Int) {
                self.tail = tail
                self.size = size
            }
        }
        
        func absDifference(num1: Int, num2: Int) -> Int {
            if num1 - num2 >= 0 {
                return num1 - num2
            } else {
                return num2 - num1
            }
        }
        
        func getTailAndSize(head: Node<Any>?) -> Result? {
            if head == nil {
                return nil
            }
            
            var size = 1
            var current = head
            while current?.next != nil {
                size += 1
                current = current?.next
            }
            return Result(tail: current, size: size)
        }
        
        
        if first == nil || second == nil {
            return nil
        }
        
        // Получим конечные узлы каждого списка и их длины
        let result1 = getTailAndSize(head: first)
        let result2 = getTailAndSize(head: second)
        
        // У пересекающихся узлов всегда концы пересекаются
        if result1!.tail !== result2!.tail {
            return nil
        }
        
        var shorter = (result1!.size <= result2!.size) ? first : second
        var longer = (result1!.size > result2!.size) ? second : first
        
        // Указатель на более длинный список нужно сместить на разницу длин списков
        
        let delta = absDifference(num1: result1!.size, num2: result2!.size)
        
        for _ in 1...delta {
            if longer != nil {
                longer = longer!.next
            }
        }
        
        while shorter !== longer {
            shorter = shorter?.next
            longer = longer?.next
        }
        
        return longer
    }
    
    
}

var list = LinkedList<Int>()
list.append(value: 1)
list.append(value: 3)
list.append(value: 213)
list.append(value: 231)
list.append(value: 3)
list.append(value: 231)
list.append(value: 12111)

list.printList()





