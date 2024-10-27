from flask import request, jsonify
from my_project.auth.service.RatingService import RatingService

rating_service = RatingService()

# Получить все рейтинги
def get_all_ratings():
    ratings = rating_service.get_all_ratings()
    return jsonify([rating.to_dict() for rating in ratings]), 200

# Получить рейтинг по ID
def get_rating_by_id(rating_id):
    rating = rating_service.get_rating_by_id(rating_id)
    if rating:
        return jsonify(rating.to_dict()), 200
    return jsonify({'message': 'Rating not found'}), 404

# Создать новый рейтинг
def create_rating():
    data = request.json
    new_rating = rating_service.create_rating(data)
    return jsonify(new_rating.to_dict()), 201

# Обновить рейтинг по ID
def update_rating(rating_id):
    data = request.json
    updated_rating = rating_service.update_rating(rating_id, data)
    if updated_rating:
        return jsonify(updated_rating.to_dict()), 200
    return jsonify({'message': 'Rating not found'}), 404

# Удалить рейтинг по ID
def delete_rating(rating_id):
    success = rating_service.delete_rating(rating_id)
    if success:
        return jsonify({'message': 'Rating deleted successfully'}), 200
    return jsonify({'message': 'Rating not found'}), 404
