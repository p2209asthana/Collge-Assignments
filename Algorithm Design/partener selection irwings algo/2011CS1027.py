import csv
m,a,p,idx=[[]],[],{},{}
with open('First Conundrum.csv','rb') as csvfile:
    sp=csv.reader(csvfile,delimiter=',')
    for row in sp:
        m.append(row)
for i in range(1,len(m)):
    for j in range(0,len(m[i])):
        m[i][j]=m[i][j].upper()
for i in range(5,len(m)):
    a.append(m[i][1])
for i in range(5,45):
    while('' in m[i]):
        m[i].remove('')
for i in range(5,45):
    for j in a:
        if((j in m[i])==False):
            m[i].append(j)
#----------------------------------------------------------------------------------------#
for i in range(5,45):
    idx[m[i][1]]=i
def prop(n):
    i,j=n,3
    if((m[i][j] in p)==False):
        p[m[i][j]]=m[i][1]
        return
    else:
        a=p[m[i][j]]
        b=m[i][1]
        id1=m[idx[m[i][j]]].index(m[i][1])
        id2=m[idx[m[i][j]]].index(a)
        if(id1<id2):
            p[m[i][j]]=m[i][1]
            m[idx[m[i][j]]].remove(a)
            m[idx[a]].remove(m[i][j])
            prop(idx[a])
            return
        else:
            m[idx[m[i][j]]].remove(m[i][1])
            m[idx[m[i][1]]].remove(m[i][j])
            prop(idx[m[i][1]])
            return
for i in range(5,45):
    prop(i)
for i in range(5,45):
    x=m[i].index(p[m[i][1]])
    while(len(m[i])>x+1):
        m[i].remove(m[i][x+1])
count=0
for key, value in p.iteritems() :
    if(p[value]==key):
        count=count+1
if(count==40):
    for key, value in p.iteritems() :
        print key, value

