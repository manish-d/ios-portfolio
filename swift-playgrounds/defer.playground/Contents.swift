func testDefer() {
    let a = 3
    defer {
        defer {
            print("Half")
        }
        print("One")
    }
    
    print("Between one and two")
    
    defer {
        print("Two")
    }
    
    if a > 2 {
        defer {
            print("a computed")
        }
        print("a statement")
    }
    
    print("testDefer")
}

testDefer()
