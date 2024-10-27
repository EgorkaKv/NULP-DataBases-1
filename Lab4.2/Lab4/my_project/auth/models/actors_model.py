from db_init import db



class Actor(db.Model):
    __tablename__ = 'actors'

    idActors = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(45), nullable=False)
    birthdate = db.Column(db.Date, nullable=True)
    gender = db.Column(db.String(10), nullable=False)
    biography = db.Column(db.Text, nullable=True)
    country = db.Column(db.String(45), nullable=False)

    # Связь между актерами и фильмами через таблицу связи
    films_link = db.relationship('FilmHasActors', primaryjoin="and_(Actor.idActors == FilmHasActors.idActors)")

    def to_dict(self):
        return {
            'idActors': self.idActors,
            'name': self.name,
            'birthdate': self.birthdate.isoformat() if self.birthdate else None,
            'gender': self.gender,
            'biography': self.biography,
            'country': self.country
        }