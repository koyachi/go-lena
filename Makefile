all: bindata.go

bindata.go:
	go-bindata -debug data
	sed -e "s/package\ main/package\ lena/" $@ > bindata_tmp.go
	rm $@
	mv bindata_tmp.go $@

clean:
	rm bindata.go
