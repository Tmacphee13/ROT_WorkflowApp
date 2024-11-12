from flask import Flask

def create_app():
    app = Flask(__name__)

    # Load configuration settings if any, e.g., from config.py
    # app.config.from_object('config')

    # Import and register blueprints or routes here if needed
    # from . import routes
    # app.register_blueprint(routes.bp)

    return app