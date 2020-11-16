#!/bin/bash

echo 'Iniciando os testes para requisições de terceiros'

echo 'Teste para /report-all-states'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/report-all-states > /dev/null
    curl -s http://127.0.0.1/report-all-statess > /dev/null
    echo "Requisição efetuada /report-all-states"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /report-all-states'
        _fail
    fi
done

echo 'Teste para report-state-sc'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/report-state-sc > /dev/null
    echo "Requisição efetuada /report-state-sc"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /report-state-sc'
        _fail
    fi
done

echo 'Teste para /report-date'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/report-date > /dev/null
    curl -s http://127.0.0.1/report-datee > /dev/null
    echo "Requisição efetuada /report-date"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /report-date'
        _fail
    fi
done

echo 'Teste para /report-country-br'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/report-country-br > /dev/null
    echo "Requisição efetuada /report-country-br"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /report-country-br'
        _fail
    fi
done

echo 'Teste para /report-all-countries'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/report-all-countries > /dev/null
    curl -s http://127.0.0.1/report-all-countriess > /dev/null
    echo "Requisição efetuada /report-all-countries"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /report-all-countries'
        _fail
    fi
done

echo 'Iniciando os testes para requisições internas'

echo 'Teste para /one'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/one > /dev/null
    echo "Requisição efetuada /one"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /one'
        _fail
    fi
done

echo 'Iniciando os testes para requisições internas'

echo 'Teste para /two'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/two > /dev/null
    echo "Requisição efetuada /two"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /two'
        _fail
    fi
done

echo 'Teste para /three'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/three > /dev/null
    echo "Requisição efetuada /three"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /three'
        _fail
    fi
done

echo 'Teste para /four'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/four > /dev/null
    echo "Requisição efetuada /four"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /four'
        _fail
    fi
done

echo 'Teste para /five'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/five > /dev/null
    echo "Requisição efetuada /five"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /five'
        _fail
    fi
done

echo 'Teste para /error'
for _ in $(seq 1 50); do
    curl -s http://127.0.0.1/error > /dev/null
    echo "Requisição efetuada /error"
    if [ "$?" != "0" ]; then
        echo 'Falha na requisição /error'
        _fail
    fi
done
