from my_project.auth.dao.GeneralDAO import GeneralDAO
from db_init import db
from my_project.auth.models.user import User

class UserDAO(GeneralDAO):
    def __init__(self):
        super().__init__(User)

    def get_by_id(self, id):
        return User.query.get(id)

    def get_all(self):
        return User.query.all()

    def create(self, data):
        new_user = User(**data)
        db.session.add(new_user)
        db.session.commit()
        return new_user

    def update(self, id, data):
        user = User.query.get(id)
        if user:
            for key, value in data.items():
                setattr(user, key, value)
            db.session.commit()
            return user
        return None

    def delete(self, id):
        user = User.query.get(id)
        if user:
            db.session.delete(user)
            db.session.commit()
            return True
        return False
