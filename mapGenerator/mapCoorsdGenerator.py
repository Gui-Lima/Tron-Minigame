size = 70
map = "["

for i in range(74):
    map+=("[")
    for j in range(8):
        map+=("("+str(j-8)+","+str(i)+"), ")
    map = map[:-2]
    map+=("],")
    map+=("\n")
map = map[:-2]
map+=("]")
print(map)
