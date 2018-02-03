import json
import re
import csv

# Input the data
# output_file = open('card-data/aro.json').read()
output_file = open('./card-data/aro.json').read()
d = json.loads(str(output_file))
type(d)

# test case
testStr = d[1]['description']

# p = re.compile('broad-spectrum antibiotic')
# p.search(testStr)
re.search('broad-spectrum antibiotic', testStr)
re.search('xyz', testStr)

testStr.find('broad-spectrum antibiotic')




# Loop through JSON file

# nameList = list()
# for i in d:
#     flag = i['description'].find('broad-spectrum antibiotic') > -1
#     if flag == True:
#         nameList.append(i['name'])

print('\n total number of molecules: ', len(d))

nameList = list()
for i in d:
    res = re.search('[bB]road.[sS]pectrum.[aA]ntibiotic', i['description'])
    flag = (res != None)
    if flag == True:
        nameList.append(i['name'])
print('\n broad-spectrum antibiotics: \n', nameList)

nameListbroadSpectrum = list()
j = 0
for i in d:
    res = re.search('[bB]road.[sS]pectrum', i['description'])
    flag = (res != None)
    if flag == True:
        nameListbroadSpectrum.append(i['name'])
        j+=1
print('\n broad-spectrum: \n', j, nameListbroadSpectrum)


# Write results to CSV

# RESULT = ['apple','cherry','orange','pineapple','strawberry']
# with open("output.csv",'w') as resultFile:
#     wr = csv.writer(resultFile, dialect='excel')
#     wr.writerow(RESULT)

RESULT = nameListbroadSpectrum
with open("output_broad_spectrum.csv",'w') as resultFile:
    wr = csv.writer(resultFile, dialect='excel')
    wr.writerow(RESULT)
