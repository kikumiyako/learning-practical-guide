package main

import "fmt"

func main() {
	fmt.Println("Hello, Go!")
}

func EvenOrOdd(number int) string {
    if number%2 == 0 {
        return "even"
    } else {
        return "odd"
    }
}
