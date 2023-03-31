FROM golang:1.20-alpine as builder
ARG VERSION=${VERSION}
WORKDIR /app
COPY . /app
RUN go build -o api-${VERSION} /app/cmd/api

FROM alpine:3.17
ARG VERSION=${VERSION}
WORKDIR /app
COPY --from=builder /app/api-${VERSION} ./api
EXPOSE 8081
CMD ["/app/api"]
