FROM thebitrock/dart-arm64v8:2.10.4
COPY . /app
CMD dart /app/lib/temp.dart
