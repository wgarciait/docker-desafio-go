FROM golang:1.18.4-alpine3.15 as build

RUN apk add --no-cache --update git

WORKDIR /go/app

COPY go.mod ./
COPY hello.go ./

RUN go build -o /server

CMD [ "/server"]

FROM alpine:3.16

COPY --from=build /server /server

ENTRYPOINT [ "/server" ]