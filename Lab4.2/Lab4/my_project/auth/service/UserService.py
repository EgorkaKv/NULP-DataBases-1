from my_project.auth.dao.UserDAO import UserDAO

class UserService:
    def __init__(self):
        self.user_dao = UserDAO()

    def get_all_users(self):
        return self.user_dao.get_all()

    def get_user_by_id(self, user_id):
        return self.user_dao.get_by_id(user_id)

    def create_user(self, data):
        return self.user_dao.create(data)

    def update_user(self, user_id, data):
        return self.user_dao.update(user_id, data)

    def delete_user(self, user_id):
        return self.user_dao.delete(user_id)
