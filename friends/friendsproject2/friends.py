from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
app = Flask(__name__)
mysql = MySQLConnector(app,'friends')
@app.route('/')
def index():
    query = "SELECT * FROM friends"
    friends = mysql.query_db (query)
    return render_template('index.html', all_friends = friends)

@app.route('/friends', methods=['POST'])
def create():
    query = "INSERT INTO friends (name, age, created_at, updated_at) VALUES (:name, :age,NOW(), NOW())"
    data = {
             'name': request.form['name'],
             'age':  request.form['age']
           }
    mysql.query_db(query, data)
    return redirect('/')

@app.route('/friends/<friend_id>')
def show(friend_id):
    query = "SELECT * FROM friends WHERE id = :specific_id"
    data = {'specific_id': friend_id}
    friends = mysql.query_db(query, data)
    return render_template('index.html', one_friend=friends[0])

app.run(debug=True)   
    


