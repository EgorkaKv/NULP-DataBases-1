from abc import ABC, abstractmethod


class GeneralDAO(ABC):
    def __init__(self, model):
        self.model = model

    @abstractmethod
    def get_by_id(self, id):
        raise NotImplementedError

    @abstractmethod
    def get_all(self):
        raise NotImplementedError

    @abstractmethod
    def create(self, data):
        raise NotImplementedError

    @abstractmethod
    def update(self, id, data):
        raise NotImplementedError

    @abstractmethod
    def delete(self, id):
        raise NotImplementedError
