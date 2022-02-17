import os
import logging


from flask import Flask, flash, request, redirect, url_for, render_template
from flask import Flask


app = Flask(__name__)


@app.route('/headers')
def headers():
    headers = request.headers
    app.logger.info("headlers: {}".format(str(headers)))
    return "Request headers:\n" + str(headers)


if __name__ == "__main__":
    app.run(port=5031, host='0.0.0.0')

else:
    gunicorn_logger = logging.getLogger('gunicorn.info')
    app.logger.handlers = gunicorn_logger.handlers[:]
    app.logger.setLevel(gunicorn_logger.level)
