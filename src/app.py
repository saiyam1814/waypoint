from flask import Flask, render_template, request
import os
app = Flask(__name__)
@app.route('/')
def index():
    return render_template('index.html')
@app.route('/howdy', methods=['POST'])
def howdy():
    name = request.form['name']
    return """
    <h1>Howdy!!!!<h1>
    <h1>{}<h1>
    """.format(name)
if __name__ == '__main__':
    app.run(debug = True, host = '0.0.0.0', port = '8080')
