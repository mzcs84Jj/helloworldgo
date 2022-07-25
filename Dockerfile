FROM golang:1.17 AS builder

WORKDIR /go/bin

COPY app/helloworld.go /go/bin

RUN go build helloworld.go

FROM scratch
COPY --from=builder /go/bin/helloworld /go/bin/helloworld
ENTRYPOINT ["/go/bin/helloworld"]