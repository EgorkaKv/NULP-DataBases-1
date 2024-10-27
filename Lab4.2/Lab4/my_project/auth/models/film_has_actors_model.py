from sqlalchemy.orm import relationship

from db_init import db
from my_project.auth.models.actors_model import Actor


class FilmHasActors(db.Model):
    __tablename__ = 'film_has_actors'

    idFilm = db.Column(db.Integer, db.ForeignKey('Film.idFilm'), primary_key=True)  # Изменено на 'Film.idFilm'
    idActors = db.Column(db.Integer, db.ForeignKey('actors.idActors'), primary_key=True)
    role = db.Column(db.String(45), nullable=False)

    film = relationship("Film", primaryjoin="Film.idFilm == FilmHasActors.idFilm")  # Имя модели Film с заглавной буквы
    actor = relationship("Actor", primaryjoin="Actor.idActors == FilmHasActors.idActors")
