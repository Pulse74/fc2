FROM golang:latest AS builder

WORKDIR /app
COPY ./app/*.go .
COPY ./app/go.* .
RUN go build -o fullcycle
ENTRYPOINT ["/app/fullcycle"]

FROM scratch
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["/app/fullcycle"]