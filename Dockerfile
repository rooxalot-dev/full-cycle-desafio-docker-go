FROM golang:1.18

WORKDIR /usr/src/

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY ./src/ ./
RUN go mod download && go mod verify

RUN go build

CMD go run .