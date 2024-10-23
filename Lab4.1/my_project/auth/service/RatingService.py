from my_project.auth.dao.RatingDAO import RatingDAO

class RatingService:
    def __init__(self):
        self.rating_dao = RatingDAO()

    def get_all_ratings(self):
        return self.rating_dao.get_all()

    def get_rating_by_id(self, rating_id):
        return self.rating_dao.get_by_id(rating_id)

    def create_rating(self, data):
        return self.rating_dao.create(data)

    def update_rating(self, rating_id, data):
        return self.rating_dao.update(rating_id, data)

    def delete_rating(self, rating_id):
        return self.rating_dao.delete(rating_id)
