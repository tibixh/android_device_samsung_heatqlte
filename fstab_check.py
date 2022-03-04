# Recovery fstab error checker

fstab = open('recovery/recovery.fstab')
data = fstab.read()

for line in data.split('\n'):
	line = line.strip()
	if not line or line.startswith("#"): continue
	pieces = line.split()
	if not (3 <= len(pieces) <= 4):
		print("*"*20)
		print("Line: ",line)
		print("Pieces found: ",len(pieces))

		for piece in pieces:
			print(piece)