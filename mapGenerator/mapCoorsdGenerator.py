size = 70
map = "["

for i in range(70):
    map+=("[")
    for j in range(70):
        map+=("("+str(j)+","+str(i)+"), ")
    map = map[:-2]
    map+=("],")
    map+=("\n")
map = map[:-2]
map+=("]")
print(map)
