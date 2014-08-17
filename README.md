# go-lena

Get classic image processing example image, Lena.

## Example

```go
package main

import (
	"github.com/koyachi/go-lena"
	"fmt"
	"image/jpeg"
	"log"
	"os"
	"path/filepath"
)

func main() {
	fmt.Printf("processing...\n")
	img, err := lena.Image()
	if err != nil {
		log.Fatal(err)
	}

	path, err := filepath.Abs("result.jpg")
	if err != nil {
		log.Fatal(err)
	}
	file, err := os.Create(path)
	if err != nil {
		log.Fatal(err)
	}
	err = jpeg.Encode(file, img, nil)
	if err != nil {
		log.Fatal(err)
	}
}
```

## TODO

- go-lena-production? (generate bindata.go without -debug flag, "go-bindata data")

## Links

- http://en.wikipedia.org/wiki/Lenna
- http://docs.scipy.org/doc/scipy-0.14.0/reference/generated/scipy.misc.lena.html
- https://github.com/jteeuwen/go-bindata
