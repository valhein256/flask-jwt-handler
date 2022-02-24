import logging

from flask import Flask, request


app = Flask(__name__)


@app.route('/headers')
def headers():
    headers = request.headers
    app.logger.info("headlers: {}".format(headers))
    return "TEST Request headers:\n" + str(headers)


if __name__ == "__main__":
    app.run(port=80, host='0.0.0.0', debug=True)
