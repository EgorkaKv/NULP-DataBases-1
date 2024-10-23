from flask import request, jsonify
from my_project.auth.service.UserService import UserService

user_service = UserService()

# Получить всех пользователей
def get_all_users():
    users = user_service.get_all_users()
    return jsonify([user.to_dict() for user in users]), 200

# Получить пользователя по ID
def get_user_by_id(user_id):
    user = user_service.get_user_by_id(user_id)
    if user:
        return jsonify(user.to_dict()), 200
    return jsonify({'message': 'User not found'}), 404

# Создать нового пользователя
def create_user():
    data = request.json
    new_user = user_service.create_user(data)
    return jsonify(new_user.to_dict()), 201

# Обновить пользователя по ID
def update_user(user_id):
    data = request.json
    updated_user = user_service.update_user(user_id, data)
    if updated_user:
        return jsonify(updated_user.to_dict()), 200
    return jsonify({'message': 'User not found'}), 404

# Удалить пользователя по ID
def delete_user(user_id):
    success = user_service.delete_user(user_id)
    if success:
        return jsonify({'message': 'User deleted successfully'}), 200
    return jsonify({'message': 'User not found'}), 404
