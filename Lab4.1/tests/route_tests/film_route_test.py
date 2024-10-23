import unittest
from flask import Flask
from flask.testing import FlaskClient
from my_project.auth.controller.film_controller import (
    get_all_films, get_film_by_id, create_film, update_film, delete_film
)
from unittest.mock import patch

# Создаем тестовое приложение Flask
app = Flask(__name__)


# Регистрируем маршруты для тестирования
@app.route('/films', methods=['GET'])
def test_get_all_films():
    return get_all_films()


@app.route('/films/<int:film_id>', methods=['GET'])
def test_get_film_by_id(film_id):
    return get_film_by_id(film_id)


@app.route('/films', methods=['POST'])
def test_create_film():
    return create_film()


@app.route('/films/<int:film_id>', methods=['PUT'])
def test_update_film(film_id):
    return update_film(film_id)


@app.route('/films/<int:film_id>', methods=['DELETE'])
def test_delete_film(film_id):
    return delete_film(film_id)


class FilmControllerTestCase(unittest.TestCase):

    def setUp(self):
        # Создаем тестовый клиент Flask
        self.app = app.test_client()
        self.app.testing = True

    @patch('my_project.auth.service.FilmService.get_all_films')
    def test_get_all_films(self, mock_get_all_films):
        # Пример данных для ответа
        mock_get_all_films.return_value = [{'id': 1, 'title': 'Film 1'}, {'id': 2, 'title': 'Film 2'}]

        # Выполняем запрос
        response = self.app.get('/films')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, [{'id': 1, 'title': 'Film 1'}, {'id': 2, 'title': 'Film 2'}])

    @patch('my_project.auth.service.FilmService.get_film_by_id')
    def test_get_film_by_id(self, mock_get_film_by_id):
        # Пример данных для фильма
        mock_get_film_by_id.return_value = {'id': 1, 'title': 'Film 1'}

        # Выполняем запрос
        response = self.app.get('/films/1')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'id': 1, 'title': 'Film 1'})

        # Тестируем случай, когда фильм не найден
        mock_get_film_by_id.return_value = None
        response = self.app.get('/films/999')
        self.assertEqual(response.status_code, 404)
        self.assertEqual(response.json, {'message': 'Film not found'})

    @patch('my_project.auth.service.FilmService.create_film')
    def test_create_film(self, mock_create_film):
        # Пример данных для нового фильма
        mock_create_film.return_value = {'id': 3, 'title': 'New Film'}

        # Выполняем POST запрос с данными фильма
        response = self.app.post('/films', json={'title': 'New Film'})
        self.assertEqual(response.status_code, 201)
        self.assertEqual(response.json, {'id': 3, 'title': 'New Film'})

    @patch('my_project.auth.service.FilmService.update_film')
    def test_update_film(self, mock_update_film):
        # Пример данных для обновленного фильма
        mock_update_film.return_value = {'id': 1, 'title': 'Updated Film'}

        # Выполняем PUT запрос для обновления фильма
        response = self.app.put('/films/1', json={'title': 'Updated Film'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'id': 1, 'title': 'Updated Film'})

        # Тестируем случай, когда фильм не найден
        mock_update_film.return_value = None
        response = self.app.put('/films/999', json={'title': 'Non-existent Film'})
        self.assertEqual(response.status_code, 404)
        self.assertEqual(response.json, {'message': 'Film not found'})

    @patch('my_project.auth.service.FilmService.delete_film')
    def test_delete_film(self, mock_delete_film):
        # Тестируем успешное удаление
        mock_delete_film.return_value = True
        response = self.app.delete('/films/1')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'message': 'Film deleted successfully'})

        # Тестируем случай, когда фильм не найден
        mock_delete_film.return_value = False
        response = self.app.delete('/films/999')
        self.assertEqual(response.status_code, 404)
        self.assertEqual(response.json, {'message': 'Film not found'})


if __name__ == '__main__':
    unittest.main()
