from flask import Blueprint, render_template, session, request, redirect, flash
import mysql.connector as sql

worker = Blueprint('worker', __name__, url_prefix='/worker', template_folder='templates_admin',
                   static_folder='templates_admin/assets')

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


@worker.route('/')
def index():
    if 'user' in session and len(session['user']) > 0:
        print(len(session['user']))
        if session['user'][1] != 'worker':
            return redirect('/adAuth/logout')
        else:
            loginid, usertype = session['user']
            _worker = """SELECT * 
                       FROM Employee
                       WHERE eid = {}""".format(loginid)
            worker = execute(_worker)

            _inventory = """SELECT DISTINCT * FROM Inventory JOIN Manager JOIN Supervision JOIN Employee JOIN Supervisor JOIN 
            CatHead ON Employee.eid = Supervisor.supervisee_eid AND Supervisor.superviser_eid = CatHead.cheid AND 
            CatHead.cheid = Supervision.eid AND Supervision.meid = Manager.meid AND Inventory.invenid = Manager.invenid 
            WHERE Employee.eid = {}""".format(loginid)
            inventory = execute(_inventory)

            _ininventory = """SELECT DISTINCT InInventory.pdid, Products.name, Products.brand, InInventory.quantity 
                        FROM Products JOIN InInventory JOIN Inventory JOIN Manager JOIN Supervision JOIN Employee JOIN 
                        CatHead JOIN Supervisor ON InInventory.pdid = Products.pdid AND Inventory.invenid = InInventory.invenid AND 
                        Manager.invenid = Inventory.invenid AND Manager.meid = Supervision.meid AND 
                        Supervision.eid = CatHead.cheid AND CatHead.cheid = Supervisor.superviser_eid AND 
                        Supervisor.supervisee_eid = Employee.eid AND Products.catid = CatHead.catid
                        WHERE Employee.eid = {}""".format(loginid)
            ininventory = execute(_ininventory)

            _products = """SELECT DISTINCT * FROM Products JOIN CatHead JOIN Supervisor JOIN Employee ON 
            Products.catid = CatHead.catid AND CatHead.cheid = Supervisor.superviser_eid AND 
            Supervisor.supervisee_eid = Employee.eid AND Employee.eid = {}""".format(loginid)
            products = execute(_products)

            return render_template('worker.html', InInventory=ininventory,
                                   Inventory=inventory[0], Worker=worker[0], Products=products)

    else:
        return redirect('/admin')


@worker.route('/update', methods=['POST'])
def update():
    if 'user' in session and len(session['user']) > 0:
        if session['user'][1] != 'worker':
            return redirect('/adAuth/logout')
        else:
            loginid, usertype = session['user']
            fname = request.form['firstname']
            lname = request.form['lastname']
            phone = request.form['phone']
            email = request.form['email']
            dob = request.form['birthdate']
            gender = request.form['gender']
            hno = request.form['hno']
            street = request.form['street']
            district = request.form['district']
            city = request.form['city']
            state = request.form['state']
            pincode = request.form['pincode']

            query = "UPDATE Employee SET fname = '{}', lname = '{}', phone = '{}', email = '{}', gender = '{}'," \
                    " dob = '{}', hno = {}, street='{}', district='{}', city='{}', state='{}', pincode={}" \
                    " WHERE eid = {}".format(fname, lname, phone, email, gender, dob, hno,
                                             street, district, city, state, pincode, loginid)
            res = execute(query)
            if res == -1:
                flash('Could not update the details')
            else:
                flash(' Details Updated Successfully')

            return redirect(request.referrer)
    else:
        return redirect('/adAuth')


@worker.route('/updatePrice', methods=['POST'])
def updatePrice():
    if 'user' in session and len(session['user']) > 0:
        if session['user'][1] != 'worker':
            return redirect('/adAuth/logout')
        else:
            pdid = request.form['pdid']
            price = request.form['price']
            query = "UPDATE Products SET costPrice = {} WHERE pdid = {}".format(price, pdid)
            res = execute(query)
            if res == -1:
                flash('Could not update the price')
            else:
                flash(' Price Updated Successfully')

            return redirect(request.referrer)
    else:
        return redirect('/adAuth')


