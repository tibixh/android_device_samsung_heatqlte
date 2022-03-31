import shutil
import os

dumpdir = '/home/tibix/android/system_dumps/heatqlte/dump'
propdir = '../../../vendor/samsung/heatqlte/proprietary'

files = open('proprietary-files.txt').read().split('\n')

for file in files:
    if not(file.startswith('#') or file == ""):
        filedir = file[0:-(len(file.split('/')[-1]) + 1)]
        if not os.path.exists(f"{propdir}/{filedir}"):
            print(f"Creating direcotry {propdir}/{filedir}")
            os.makedirs(f'{propdir}/{filedir}')    
        if os.path.exists(f"{dumpdir}/{file}"):
            print(f"Copying {file}")
            shutil.copyfile(f"{dumpdir}/{file}",f"{propdir}/{file}")
        else:
            print(f"No such file: {file}")
print("extract-files.py done \nhere comes makefiles")
os.system('python3 setup-makefiles.py')
