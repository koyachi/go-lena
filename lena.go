package lena

import (
	"bytes"
	"code.google.com/p/go.image/tiff"
	"errors"
	"image"
)

func Image() (img image.Image, err error) {
	data, err := Asset("data/lena_std.tif")
	if len(data) == 0 {
		err = errors.New("len(data) == 0")
		return nil, err
	}
	if err != nil {
		return nil, err
	}

	return tiff.Decode(bytes.NewBuffer(data))
}
