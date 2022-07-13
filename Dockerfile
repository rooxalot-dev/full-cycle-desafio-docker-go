FROM golang:1.18

WORKDIR /usr/src/

COPY ./src .

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY ./src/go.mod ./
RUN go mod download && go mod verify

COPY . .
RUN go build

CMD go run .