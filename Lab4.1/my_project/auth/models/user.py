from db_init import db


class User(db.Model):
    __tablename__ = 'User'

    idUser = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_name = db.Column(db.String(100), nullable=False)
    Email = db.Column(db.String(255), unique=True, nullable=False)

    # Связь с таблицей Rating
    ratings = db.relationship('Rating', back_populates='user', cascade="all, delete")

    def to_dict(self):
        return {
            'idUser': self.idUser,
            'Name': self.user_name,
            'Email': self.Email
        }
