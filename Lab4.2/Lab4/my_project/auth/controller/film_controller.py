from flask import request, jsonify
from my_project.auth.service.FilmService import FilmService

film_service = FilmService()

# Получить все фильмы
def get_all_films():
    films = film_service.get_all_films()
    return jsonify([film.to_dict() for film in films]), 200

# Получить фильм по ID
def get_film_by_id(film_id):
    film = film_service.get_film_by_id(film_id)
    if film:
        return jsonify(film.to_dict()), 200
    return jsonify({'message': 'Film not found'}), 404

# Получить все фильмы с актерами
def get_films_with_actors():
    films_with_actors = film_service.get_films_with_actors()
    return jsonify(films_with_actors), 200

# Создать новый фильм
def create_film():
    data = request.json
    new_film = film_service.create_film(data)
    return jsonify(new_film.to_dict()), 201

# Обновить фильм по ID
def update_film(film_id):
    data = request.json
    updated_film = film_service.update_film(film_id, data)
    if updated_film:
        return jsonify(updated_film.to_dict()), 200
    return jsonify({'message': 'Film not found'}), 404

# Удалить фильм по ID
def delete_film(film_id):
    success = film_service.delete_film(film_id)
    if success:
        return jsonify({'message': 'Film deleted successfully'}), 200
    return jsonify({'message': 'Film not found'}), 404
