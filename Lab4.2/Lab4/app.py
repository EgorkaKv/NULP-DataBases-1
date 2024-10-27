from flask import Flask
import MySQLdb
from __init__ import create_app
from my_project.auth.route.film_route import film_bp
from my_project.auth.route.user_route import user_bp
from my_project.auth.route.rating_route import rating_bp

app = create_app()

app.register_blueprint(film_bp)
app.register_blueprint(user_bp)
app.register_blueprint(rating_bp)

if __name__ == '__main__':
    app.run(debug=True)