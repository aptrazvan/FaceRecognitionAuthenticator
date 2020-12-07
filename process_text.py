import cv2
import pytesseract
from PIL import Image, ImageEnhance, ImageFilter


def extract_info(path):
	im = Image.open(path)
	im = im.filter(ImageFilter.MedianFilter())
	enhancer = ImageEnhance.Contrast(im)
	im = enhancer.enhance(2)
	im.save('temp2.png')

	card_info = pytesseract.image_to_string(im)
	card_info = card_info.split('\n')

	print(card_info)

	optical_fields = []
	is_valid = False

	for text in card_info:
		# print(len(text))
		if len(text) > 35:
			optical_fields.append(text)

	if len(optical_fields) < 2:
		print("Too few")
		return is_valid

	while len(optical_fields) > 2:
		optical_fields.pop(0)


	for i in range(len(optical_fields)):
		print(optical_fields[i])

	# if optical_fields[0][0:2] != "ID":
	# 	print("Not recognized ID")
	# 	return is_valid

	position = 5
	first_name = ""
	last_name = []

	fields = optical_fields[0].split("<", -1)

	for i in range(len(fields)):
		if fields[i].isupper():
			if i == 0:
				first_name = fields[0][5:]
			else:
				last_name.append(fields[i])

	series = optical_fields[1][0:2]
	number = optical_fields[1][2:9]
	number = number.replace("<", "")
	birth_date = optical_fields[1][13:19]
	cnp = optical_fields[1][28:35]
	cnp = cnp[0] + birth_date + cnp[1:]

	print(first_name, cnp)

	if (len(cnp) == 13 and cnp.isnumeric() and
	len(first_name) > 0 and len(last_name) > 0 and
	first_name.isupper() and ''.join(last_name).isupper()):
		is_valid = True

	return is_valid, series, number, cnp, first_name, last_name

