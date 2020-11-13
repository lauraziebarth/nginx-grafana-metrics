import time
import random
import requests

from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics


app = Flask(__name__)
PrometheusMetrics(app)


endpoints = (
    'report-all-states',
    'report-state-sc',
    'report-date',
    'report-country-br',
    'report-all-countries',
    'one',
    'two',
    'three',
    'four',
    'five',
    'error'
)


@app.route('/report-all-states', methods=['GET'])
def lista_casos_por_estados_brasileiros():
    response = requests.get('https://covid19-brazil-api.now.sh/api/report/v1')
    return response.json()

@app.route('/report-state-sc', methods=['GET'])
def lista_casos_por_estado_sc():
    response = requests.get('https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/sc')
    return response.json()

@app.route('/report-date', methods=['GET'])
def lista_casos_brasil_data_especifica():
    response = requests.get('https://covid19-brazil-api.now.sh/api/report/v1/brazil/20200811')
    return response.json()

@app.route('/report-country-br', methods=['GET'])
def lista_casos_por_pais_brasil():
    response = requests.get('https://covid19-brazil-api.now.sh/api/report/v1/brazil')
    return response.json()

@app.route('/report-all-countries', methods=['GET'])
def lista_casos_por_paises():
    response = requests.get('https://covid19-brazil-api.now.sh/api/report/v1/countries')
    return response.json()

@app.route('/one')
def first_route():
    time.sleep(random.random() * 0.2)
    return 'ok'


@app.route('/two')
def the_second():
    time.sleep(random.random() * 0.4)
    return 'ok'


@app.route('/three')
def test_3rd():
    time.sleep(random.random() * 0.6)
    return 'ok'


@app.route('/four')
def fourth_one():
    time.sleep(random.random() * 0.8)
    return 'ok'


@app.route('/error')
def oops():
    return ':(', 500


if __name__ == '__main__':
    app.run('0.0.0.0', 5000, threaded=True)
