# go-lena

Get classic image processing example image, Lena.

![lena.result.jpg](https://raw.githubusercontent.com/koyachi/go-lena/master/example/lena.result.jpg)

## Installation

### for production
```
go get github.com/koyachi/go-lena
```

Default bindata.go contains lena image as code, so the program that imports go-lena is easy to depoly. But compile and image reading time is slow.

### for debug
```
go get github.com/koyachi/go-lena
cd $GOPATH/src/github.com/koyachi/go-lena
make bindata.go.debug
```

bindata.go for debug not contains lena image as go code, it reads tiff file from build environment's directory layout.

Pros: a fast compile and image reading time.
Cons: a failure to loading image. ($GOPATH)

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

## Links

- http://en.wikipedia.org/wiki/Lenna
- http://docs.scipy.org/doc/scipy-0.14.0/reference/generated/scipy.misc.lena.html
- https://github.com/jteeuwen/go-bindata
