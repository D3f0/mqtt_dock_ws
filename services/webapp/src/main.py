# coding: utf-8
# pylint: disable=locally-disabled, multiple-statements, fixme, line-too-long

from flask import Flask, render_template, url_for


app = Flask(__name__)


@app.context_processor
def utilities():
    """Generar contexto"""

    def bower_component(path):  # noqa
        """Función para agregar una biblioteca instalada con bower desde los templates"""
        return url_for('static', filename='bower_components/{}'.format(path))

    # Retornoamos el diccionario de locales, por ahora solo bower_component
    return locals()


@app.route('/')
def index():
    """Punto de entrada a la aplicación"""
    return render_template('index.html')

@app.route('/<name>')
def passthrough(name):
    """Toma el nombre que se haya puesto a la URL y lo utliza como argumento para buscar un tempalte"""
    return render_template('{}.html'.format(name))

@app.route('/auth', methods=['GET', 'POST'])
def auth():
    """Método para Mosquitto"""
    print "Auth!"
    return ''

@app.route('/superuser', methods=['GET', 'POST'])
def superuser():
    """Método para Mosquitto"""
    print "Superuser!"
    return ''

@app.route('/acl', methods=['GET', 'POST'])
def acl():
    """Método para Mosquitto"""
    return ''


if __name__ == '__main__':
    app.run(debug=True, port=8000, host="0.0.0.0")
