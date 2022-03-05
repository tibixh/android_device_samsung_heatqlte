# Recovery fstab syntax checker
fstab_version = int(input("fstab version: "))

data = open('recovery/recovery.fstab').read()

for line in data.split('\n'):
		line = line.strip()
		if not line or line.startswith("#"): continue
		pieces = line.split()
		if fstab_version == 1:
			if not (3 <= len(pieces) <= 4):
				print("*"*20)
				print("Line: ",line)
				print("Pieces found:",len(pieces),"instead of 3,4,5")
				for piece in pieces:
					print(piece)
		elif fstab_version == 2:
			if len(pieces) != 5:
				print("*"*20)
				print("Line: ",line)
				print("Pieces found:",len(pieces), "instead of 5")
				for piece in pieces:
					print(piece)