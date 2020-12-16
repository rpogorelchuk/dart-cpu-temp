FROM thebitrock/dart-arm64v8:latest
WORKDIR /app
COPY . /app
RUN pub get
EXPOSE 50051
ENTRYPOINT ["/usr/lib/dart/bin/dart", "/app/lib/temp.dart"]
