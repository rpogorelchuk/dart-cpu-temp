ARG IMAGE=arm64v8/debian:stable-20201209-slim
FROM $IMAGE as builder
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -qq install unzip wget
RUN mkdir /dart
WORKDIR /dart
RUN wget -q "https://storage.googleapis.com/dart-archive/channels/stable/release/2.10.4/sdk/dartsdk-linux-arm64-release.zip"
RUN unzip dartsdk-linux-arm64-release.zip

FROM $IMAGE

RUN mkdir -p /usr/lib/dart
COPY --from=builder /dart/dart-sdk/ /usr/lib/dart/
ENV DART_SDK /usr/lib/dart
ENV PATH $DART_SDK/bin:$PATH
COPY . /app
WORKDIR /app
RUN pub get
EXPOSE 50051
ENTRYPOINT ["dart", "/app/lib/temp.dart"]
