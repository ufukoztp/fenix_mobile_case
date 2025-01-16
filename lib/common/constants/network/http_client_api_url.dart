enum HttpClientEndPoints {
  Movies('/3/search/movie'),
  MovieImage('https://image.tmdb.org/t/p/w220_and_h330_face/{post_path}'),

  ;

  const HttpClientEndPoints(this.URL);
  final String URL;
}
