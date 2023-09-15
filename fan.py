import time
while True:
    temp = int(open("/proc/acpi/ibm/thermal").read().split()[1])
    print(temp)
    time.sleep(1)
    f = open("/proc/acpi/ibm/fan", "w")
    if temp > 65:
        f.write("level auto")
        print("🔥 auto")
    elif temp > 60:
        f.write("level 2")
        print("😎 2")
    else:
        f.write("level 0")
        print("🧊 0")
    f.close()
