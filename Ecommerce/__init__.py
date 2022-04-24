from flask import Flask, redirect
from admin import admin
from store import store
from auth import auth
from user import user


app = Flask(__name__)
app.register_blueprint(admin, url_prefix='/admin')
app.register_blueprint(store, url_prefix='/store')
app.register_blueprint(auth, url_prefix='/auth')
app.register_blueprint(user, url_prefix='/user')


app.secret_key = 'secret-key-JPAS'


@app.route('/')
def index():
    return redirect('/auth')


if __name__ == '__main__':
    app.run(debug=True)
