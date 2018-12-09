size = 70 
map = "["

for i in range(70):
	map+=("[")
	for j in range(70):
		if i==0 or j==0 or i==size-1 or j==size-1:
			map+=("Wall, ")
		else:
			map+=("Nada, ")
	map = map[:-2]
	map+=("],")
	map+=("\n")
map = map[:-2]
map+=("]")
print(map)
