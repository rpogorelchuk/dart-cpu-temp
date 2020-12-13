FROM thebitrock/dart-arm64v8:2.10.4
COPY . /app
WORKDIR /app
RUN pub get
EXPOSE 50051
CMD dart /app/lib/temp.dart
