from my_project.auth.dao.FilmDAO import FilmDAO


class FilmService:
    def __init__(self):
        self.film_dao = FilmDAO()

    def get_all_films(self):
        return self.film_dao.get_all()

    def get_film_by_id(self, film_id):
        return self.film_dao.get_by_id(film_id)

    def get_films_with_actors(self):
        """Получить все фильмы с актерами."""
        return self.film_dao.get_all_with_actors()

    def create_film(self, data):
        return self.film_dao.create(data)

    def update_film(self, film_id, data):
        return self.film_dao.update(film_id, data)

    def delete_film(self, film_id):
        return self.film_dao.delete(film_id)
