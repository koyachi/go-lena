all: bindata.go

bindata.go.debug: clean
	go-bindata -debug data
	sed -e "s/package\ main/package\ lena/" bindata.go > bindata_tmp.go
	rm bindata.go
	mv bindata_tmp.go bindata.go

bindata.go:
	go-bindata data
	sed -e "s/package\ main/package\ lena/" $@ > bindata_tmp.go
	rm $@
	mv bindata_tmp.go $@

clean:
	rm bindata.go
