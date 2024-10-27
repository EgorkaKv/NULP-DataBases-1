from my_project.auth.dao.GeneralDAO import GeneralDAO
from my_project.auth.models.film import Film  # Модель Film
from db_init import db

class FilmDAO(GeneralDAO):
    def __init__(self):
        super().__init__(Film)

    def get_by_id(self, id):
        return Film.query.get(id)

    def get_all(self):
        return Film.query.all()

    def get_all_with_actors(self):
        """Получить все фильмы вместе с актерами."""
        films = Film.query.all()
        result = {}
        for film in films:
            # Получаем имена актеров через промежуточную таблицу связи
            actors = [link.actor.name for link in film.actors_link]

            # Заполняем результат названиями фильмов и списком актёров
            result[film.Title] = actors
        return result

    def create(self, data):
        new_film = Film(**data)
        db.session.add(new_film)
        db.session.commit()
        return new_film

    def update(self, id, data):
        film = Film.query.get(id)
        if film:
            for key, value in data.items():
                setattr(film, key, value)
            db.session.commit()
            return film
        return None

    def delete(self, id):
        film = Film.query.get(id)
        if film:
            db.session.delete(film)
            db.session.commit()
            return True
        return False
