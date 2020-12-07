from flask import Flask, request, send_file, jsonify, Response
from process_text import extract_info
from check_identity import check_photo_identity
from detect_closed_eyes import eyes_closed
from image_similarity import similar_images
from read_database import get_data
import base64

app = Flask(__name__)

# provide a method to create access tokens
@app.route('/first_photo', methods=['GET', 'POST'])

def first_photo():
	resp = Response("")
	resp.headers['Access-Control-Allow-Origin'] = '*'

	data = request.data

	imgdata = base64.b64decode(data[32:-2])
	path = "./KnownPeople/Capture.png"

	with open(path, 'wb') as f:
		f.write(imgdata)

	result = extract_info(path)

	if result:
		[is_valid, series, number, cnp, first_name, last_name] = result
		print(cnp)
		resp = Response(cnp)
		resp.headers['Access-Control-Allow-Origin'] = '*'
	else:
		print("Try again")


	return resp

@app.route('/second_photo', methods=['GET', 'POST'])

def second_photo():
	print("State two!")
	resp = Response("")
	resp.headers['Access-Control-Allow-Origin'] = '*'

	data = request.data

	imgdata = base64.b64decode(data[32:-2])
	path = "./UnknownImages/Opened_Capture.png"

	with open(path, 'wb') as f:
		f.write(imgdata)

	result = check_photo_identity("./KnownPeople/Capture.png", path)

	if result:
		result = eyes_closed(path)

		if result == False:
			resp = Response("Success")
			resp.headers['Access-Control-Allow-Origin'] = '*'
		else:
			resp = Response("EyesClosed")
			resp.headers['Access-Control-Allow-Origin'] = '*'
	else:
		print("Try again")


	return resp

@app.route('/third_photo', methods=['GET', 'POST'])

def third_photo():
	print("State three!")
	resp = Response("")
	resp.headers['Access-Control-Allow-Origin'] = '*'

	data = request.data

	imgdata = base64.b64decode(data[32:-2])
	path = "./UnknownImages/Closed_Capture.png"

	with open(path, 'wb') as f:
		f.write(imgdata)

	result = check_photo_identity("./KnownPeople/Capture.png", path)

	if result:
		result = eyes_closed(path)

		if result:
			result = similar_images("./UnknownImages/Opened_Capture.png", path)

			if result == False:
				resp = Response("Success")
				resp.headers['Access-Control-Allow-Origin'] = '*'
			else:
				resp = Response("SimilarImage")
				resp.headers['Access-Control-Allow-Origin'] = '*'
		else:
			resp = Response("EyesOpened")
			resp.headers['Access-Control-Allow-Origin'] = '*'
	else:
		print("Try again")


	return resp

@app.route('/read_database', methods=['GET', 'POST'])

def send_data():
	first_name, last_name, iban, total, cards = get_data("0521841849892")

	resp = Response(str(first_name) + " " + str(last_name) + " " +str(iban) + " " + str(total) + " " + str(cards))
	resp.headers['Access-Control-Allow-Origin'] = '*'



	return resp


# launch the FlaskPy dev server
app.run(host="localhost", debug=True)
