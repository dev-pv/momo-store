FROM golang:1.20-alpine as builder
WORKDIR /app
COPY . /app
RUN go build /app/cmd/api

FROM alpine:3.17
WORKDIR /app
COPY --from=builder /app/api .
EXPOSE 8081
CMD ["/app/api"]
