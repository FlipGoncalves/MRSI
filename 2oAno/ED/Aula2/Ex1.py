words = []
dif_words = 0
total_words = 0

with open("input.txt") as f:
    while True:
        line = f.readline().replace("\n", "").split(" ")
        if line == [""]:
            break
        line = [x.capitalize() for x in line]
        
        for word in line:
            total_words += 1
            if word not in words:
                dif_words += 1
                words.append(word)
                
    f.close()
print(f"Different Words: {dif_words}")
print(f"Total Words: {total_words}")