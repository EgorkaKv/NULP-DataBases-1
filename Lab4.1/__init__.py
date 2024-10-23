from flask import Flask
from db_init import db


def create_app():
    app = Flask(__name__)
    # Конфигурация базы данных
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:123456789@localhost/imdb'

    db.init_app(app)  # Создание экземпляра SQLAlchemy

    return app
