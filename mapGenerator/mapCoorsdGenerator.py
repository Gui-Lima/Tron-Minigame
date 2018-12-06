size = 50
map = "["

for i in range(size):
    map+=("[")
    for j in range(size):
        map+=("("+str(j)+","+str(i)+"), ")
    map = map[:-2]
    map+=("],")
    map+=("\n")
map = map[:-2]
map+=("]")
print(map)
