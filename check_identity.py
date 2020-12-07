import face_recognition
import numpy as np


def check_photo_identity(identity_path, capture_path):
	picture_of_me = face_recognition.load_image_file(identity_path)
	my_face_encoding = face_recognition.face_encodings(picture_of_me)[0]

	unknown_picture = face_recognition.load_image_file(capture_path)
	unknown_face_encoding = face_recognition.face_encodings(unknown_picture)[0]

	results = face_recognition.compare_faces([my_face_encoding], unknown_face_encoding)

	return results[0]


