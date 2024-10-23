from my_project.auth.dao.GeneralDAO import GeneralDAO
from db_init import db
from my_project.auth.models.rating import Rating  # Модель Rating


class RatingDAO(GeneralDAO):
    def __init__(self):
        super().__init__(Rating)

    def get_by_id(self, id):
        return Rating.query.get(id)

    def get_all(self):
        return Rating.query.all()

    def create(self, data):
        new_rating = Rating(**data)
        db.session.add(new_rating)
        db.session.commit()
        return new_rating

    def update(self, id, data):
        rating = Rating.query.get(id)
        if rating:
            for key, value in data.items():
                setattr(rating, key, value)
            db.session.commit()
            return rating
        return None

    def delete(self, id):
        rating = Rating.query.get(id)
        if rating:
            db.session.delete(rating)
            db.session.commit()
            return True
        return False
