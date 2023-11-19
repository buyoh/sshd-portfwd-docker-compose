FROM alpine:3.18

RUN apk --no-cache add \
  tzdata ca-certificates openssh openssl

EXPOSE 22

RUN adduser remote -s /bin/true -H -h /notexistance -D -G nobody

ENTRYPOINT ["/entrypoint.sh"] 
