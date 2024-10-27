from flask import Blueprint
from my_project.auth.controller.film_controller import get_all_films, get_film_by_id, create_film, update_film, \
    delete_film, get_films_with_actors

film_bp = Blueprint('film', __name__)

film_bp.route('/films', methods=['GET'])(get_all_films)
film_bp.route('/films/<int:film_id>', methods=['GET'])(get_film_by_id)
film_bp.route('/films', methods=['POST'])(create_film)
film_bp.route('/films/<int:film_id>', methods=['PUT'])(update_film)
film_bp.route('/films/<int:film_id>', methods=['DELETE'])(delete_film)
film_bp.route('/films/actors', methods=['GET'])(get_films_with_actors)
