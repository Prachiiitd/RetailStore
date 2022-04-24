from flask import Blueprint
import mysql.connector as sql

admin = Blueprint('admin', __name__, url_prefix='/admin', template_folder='templates', static_folder='static')

db = sql.connect(
    host="localhost",
    user="root",
    passwd="Root#1234",
    database="store"
)


def execute(query):
    try:
        cursor = db.cursor()
        cursor.execute(query)
        res = cursor.fetchall()
        db.commit()
        return res

    except sql.Error as err:
        print(err)
        return -1


@admin.route('/', methods=['GET'])
def index():
    return 'admin index'

