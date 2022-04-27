from flask import Blueprint, render_template, session, request, redirect, flash
import mysql.connector as sql

auth = Blueprint('auth', __name__, url_prefix='/auth', template_folder='templates_store',
                 static_folder='templates_store/assets')

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


@auth.route('/', methods=['GET', 'POST'])
def index():
    if 'user' in session and session['user'] and session['user'][1] == 'customer':
        return redirect('/store')
    return render_template('login.html')


@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == "POST":
        loginid = request.form.get('LoginID')
        password = request.form.get('Password')

        query = "SELECT * FROM login WHERE loginID = '{}' AND usertype = 'customer' AND pasword = '{}'".format(loginid,
                                                                                                         password)
        res = execute(query)
        cust = [loginid, 'customer']

        if res == -1 or len(res) == 0:
            flash("Invalid credentials")
            return redirect('/auth')

        session['user'] = cust

        return redirect('/store')

    return redirect('/auth')


@auth.route("/logout")
def logout():
    if 'user' in session and session['user']:
        session.pop('user')
    return redirect('/')


@auth.route('/about')
def about():
    return render_template('about-us.html')


@auth.route('/contact')
def contact():
    return render_template('contact-us.html')


@auth.route('/faq')
def faq():
    return render_template('faq.html')


#
# elif usertype == 'Manager':
#              query = "SELECT * FROM Manager WHERE mid = '{}'".format(loginid)
#              man = execute(query)
#              print(man)
#
#          elif usertype == 'Employee':
#              emp_type = None
#              query = "SELECT * FROM Employee WHERE eid = '{}'".format(loginid)
#              emp = execute(query)
#
#              if execute("SELECT COUNT(*) FROM CatHead WHERE cheid = {}".format(loginid))[0][0] != 0:
#                  emp_type = 'CatHead'
#                  print(emp_type)
#
#              elif execute("SELECT COUNT(*) FROM Worker WHERE weid = {}".format(loginid))[0][0] != 0:
#                  emp_type = 'Worker'
#                  print(emp_type)
#
#              elif execute("SELECT  COUNT(*) FROM DeliveryPerson WHERE deid = {}".format(loginid))[0][0] != 0:
#                  emp_type = 'DeliveryPerson'
#                  print(emp_type)
#
#              print(emp)
#              session['user'] = emp_type
