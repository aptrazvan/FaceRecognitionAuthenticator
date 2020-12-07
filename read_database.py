import mysql.connector


def get_data(cnp):
	db = mysql.connector.connect(
	  host="localhost",
	  user="root",
	  password="root",
	  database="bcr"
	)

	cursor = db.cursor()

	cursor.execute("SELECT id, prenume, nume FROM main WHERE cnp = (%s)", (cnp,))

	result = cursor.fetchall()
	accountID = [x[0] for x in result]
	first_name = [x[1] for x in result]
	last_name = [x[2] for x in result]

	accountID = accountID[0]
	first_name = first_name[0]
	last_name = last_name[0]

	cursor.execute("SELECT iban, balance FROM conturi WHERE client_id = (%s)", (accountID,))
	result = cursor.fetchall()
	iban = [x[0] for x in result]
	total = [x[1] for x in result]

	iban = iban[0]
	total = total[0]

	cursor.execute("SELECT card_no FROM carduri WHERE client_id = (%s)", (accountID,))
	result = cursor.fetchall()
	cards = [x[0] for x in result]
	cards = cards[0]


	cards = "1111111111111111"


	return first_name, last_name, iban, total, cards

