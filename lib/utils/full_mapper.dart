abstract class FullMapper<FROM, TO> {
  TO mapFromTo(FROM object);
  FROM mapToFrom(TO object);
}