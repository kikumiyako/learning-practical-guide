package main

import "fmt"

var version string // ビルド時にidflagsフラグ経由でバージョンを埋め込む変数

func main() {
  fmt.Printf("Example %s\n", version)
}
