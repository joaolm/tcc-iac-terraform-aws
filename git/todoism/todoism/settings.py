# -*- coding: utf-8 -*-
"""
    :author: Grey Li (李辉)
    :url: http://greyli.com
    :copyright: © 2018 Grey Li <withlihui@gmail.com>
    :license: MIT, see LICENSE for more details.
"""
import os

basedir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))


class BaseConfig:
    TODOISM_LOCALES = ['en_US', 'zh_Hans_CN']
    TODOISM_ITEM_PER_PAGE = 20

    BABEL_DEFAULT_LOCALE = TODOISM_LOCALES[0]

    SECRET_KEY = os.getenv('SECRET_KEY', 'a secret string')

    # --- INÍCIO DAS MODIFICAÇÕES ---

    # Lê as credenciais do banco de dados a partir das variáveis de ambiente.
    # Os valores padrão (ex: 'localhost') são usados como fallback se as variáveis não forem definidas.
    DB_USER = os.getenv('DB_USER', 'postgres')
    DB_PASSWORD = os.getenv('DB_PASSWORD', 'password')
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_PORT = os.getenv('DB_PORT', '5432')
    DB_NAME = os.getenv('DB_NAME', 'todoism')

    # Prioriza a variável DATABASE_URL se ela existir.
    # Caso contrário, constrói a string de conexão para o PostgreSQL com as variáveis acima.
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL') or \
        f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

    # --- FIM DAS MODIFICAÇÕES ---

    SQLALCHEMY_TRACK_MODIFICATIONS = False


class DevelopmentConfig(BaseConfig):
    pass


class ProductionConfig(BaseConfig):
    pass


class TestingConfig(BaseConfig):
    TESTING = True
    # Para testes, mantemos um banco em memória para velocidade
    SQLALCHEMY_DATABASE_URI = 'sqlite:///'
    WTF_CSRF_ENABLED = False


config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'testing': TestingConfig
}