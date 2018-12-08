size = 74
map = "["

for i in range(74):
	map+=("[")
	for j in range(74):
		if i==0 or j==0 or i==size-1 or j==size-1:
			map+=("Wall, ")
		elif i<=25 and (j==size-3 or j==size-2):
			map+=("Teleport1, ")
		elif i>25 and i<50 and (j==size-3 or j==size-2):
			map+=("Teleport2, ")
		elif i>=50 and (j==size-3 or j==size-2):
			map+=("Teleport3, ")
		else:
			map+=("Nada, ")
	map = map[:-2]
	map+=("],")
	map+=("\n")
map = map[:-2]
map+=("]")
print(map)
