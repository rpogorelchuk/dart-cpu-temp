FROM arm64v8/debian:stable-20201209-slim
RUN apt-get update && apt-get install -qq autoconf automake libtool curl make g++ unzip git xz-utils
RUN git clone https://github.com/protocolbuffers/protobuf.git
WORKDIR /protobuf
RUN git submodule update --init --recursive
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make check
RUN make install
RUN ldconfig
RUN git clone https://github.com/flutter/flutter.git
ENV PATH=$PATH:/flutter/bin
RUN flutter pub global activate protoc_plugin
COPY protos /
RUN mkdir /protos/protobuf
RUN protoc --dart_out=./protos/protobuf service.proto --proto_path=/protos/

FROM thebitrock/dart-arm64v8:latest
WORKDIR /app
COPY . /app
COPY --from=protoc /protos/protobuf /app
RUN pub get
EXPOSE 50051
ENTRYPOINT ["/usr/lib/dart/bin/dart", "/app/lib/temp.dart"]
