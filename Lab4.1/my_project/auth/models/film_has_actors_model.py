from db_init import db
from my_project.auth.models.actors_model import Actor


class FilmHasActors(db.Model):
    __tablename__ = 'film_has_actors'

    idFilm = db.Column(db.Integer, db.ForeignKey('film.idFilm'), primary_key=True)
    idActors = db.Column(db.Integer, db.ForeignKey('actors.idActors'), primary_key=True)
    role = db.Column(db.String(45), nullable=False)

    # Связь с фильмами
    film = db.relationship('Film', back_populates='actors_link')

    # Связь с актерами
    actor = db.relationship('Actor', back_populates='films_link')
