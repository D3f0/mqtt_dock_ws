from flask import Flask, render_template, url_for


app = Flask(__name__)


@app.context_processor
def utilities():
    def bower_component(path):
        return url_for('static', filename='bower_components/{}'.format(path))

    return locals()

@app.route('/')
def index():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(debug=True, port=8000, host="0.0.0.0")
