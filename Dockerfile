FROM golang:1.20.2-alpine3.17 as builder

WORKDIR /go/src
COPY fullCycleRocks.go .
RUN go build fullCycleRocks.go

FROM hello-world
COPY --from=builder /go/src/fullCycleRocks .
ENTRYPOINT ["./fullCycleRocks"]