from PIL import Image
import imagehash

def similar_images(path1, path2):
	hash0 = imagehash.average_hash(Image.open(path1)) 
	hash1 = imagehash.average_hash(Image.open(path2)) 
	cutoff = 5

	if hash0 - hash1 < cutoff:
	  return True
	else:
	  return False

