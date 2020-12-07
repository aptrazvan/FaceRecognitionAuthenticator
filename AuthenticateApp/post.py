from flask import Flask, request, send_file, jsonify, Response

app = Flask(__name__)

# provide a method to create access tokens
@app.route('/', methods=['GET', 'POST'])

def login():
	resp = Response("Foo bar baz")
	resp.headers['Access-Control-Allow-Origin'] = '*'

	#if not request.is_json:
	 #   return jsonify({"msg": "Missing JSON in request"}), 400

	# image = request.json.get('image', None)

	# print(image)

	print(request.data)

	return resp


# launch the FlaskPy dev server
app.run(host="localhost", debug=True)
