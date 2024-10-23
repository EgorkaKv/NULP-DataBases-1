from db_init import db


class Rating(db.Model):
    __tablename__ = 'Rating'

    idRating = db.Column(db.Integer, primary_key=True, autoincrement=True)
    value = db.Column(db.Float, nullable=False)
    

    # Внешний ключ на Film
    idFilm = db.Column(db.Integer, db.ForeignKey('Film.idFilm'), nullable=False)
    film = db.relationship('Film', back_populates='ratings')

    # Внешний ключ на User
    idUser = db.Column(db.Integer, db.ForeignKey('User.idUser'), nullable=False)
    user = db.relationship('User', back_populates='ratings')

    def to_dict(self):
        return {
            'idRating': self.idRating,
            'film_id': self.idFilm,
            'user_id': self.idUser,
            'value': self.value
        }
