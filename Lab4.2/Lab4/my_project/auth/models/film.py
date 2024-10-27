from db_init import db
from my_project.auth.models.film_has_actors_model import FilmHasActors
from my_project.auth.models.actors_model import Actor


class Film(db.Model):
    __tablename__ = 'Film'

    idFilm = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Title = db.Column(db.String(255), nullable=False)
    Description = db.Column(db.Text, nullable=True)
    Release_date = db.Column(db.Date, nullable=False)
    Duration = db.Column(db.Integer, nullable=False)

    # Связь с таблицей Rating
    ratings = db.relationship('Rating', back_populates='film', cascade="all, delete")

    # Связь с актерами
    actors_link = db.relationship('FilmHasActors', primaryjoin="and_(Film.idFilm == FilmHasActors.idFilm)")

    def to_dict(self):
        return {
            'idFilm': self.idFilm,
            'Title': self.Title,
            'Description': self.Description,
            'Release_date': self.Release_date.isoformat(),
            'Duration': self.Duration
        }
