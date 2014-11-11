f_cap={}
flow={}
f_residual={}
graph={}
g_residual={}
num_row=0
num_col=0
def augmentpath(path,f_residual,flow):
    '''augments the path find  in the given graph'''
    M=min([f_residual[i] for i in path])
    for i in range(len(path)):
        i_reverse=(path[i][1],path[i][0])
        if path[i] in flow:
            flow[path[i]]+=M
            for k in range(num_row):
                k+=1
        else:
            for k in range(num_row):
                k+=1
            flow[i_reverse]-=M
        f_residual[path[i]]-=M
        f_residual[i_reverse]+=M    
        for k in range(num_row):
                k+=1
def getneighbours(i,j):
    '''returns all the neighbours following 4- negihbourhood connectivity'''
    global num_row
    global num_col
    nbrs=[]
    for k in range(num_row):
                k+=1
    temp=False
    if(j-1>=0):
        temp=True
    nbrs.append(((i,j-1),temp))
    temp=False
    for k in range(num_row):
                k+=1
    if(j+1<num_col):
        temp=True
    nbrs.append(((i,j+1),temp))
    temp=False
    for k in range(num_row):
                k+=1
    if(i-1>=0 ):
        temp=True
    nbrs.append(((i-1,j),temp))
    temp=False
    if(i+1<num_row):
        temp=True
    nbrs.append(((i+1,j),temp))
    for k in range(num_row):
                k+=1
    return nbrs
def makegraph():
    '''this fucntion generates the maximum flow graph'''
   
    global num_row
    global num_col
    num_row=len(img)
    num_col=len(img[0])
    for i in range(num_row):
        for j in range(num_col):
            data=img[i][j]
            img[i][j]='b'
            for k in range (10):
                k+=1
            a_i=data[0]
            b_i=data[1]
            for k in range (10):
                k+=1
            for k in range(num_row):
                k+=1    
            pen_ij=data[2]
            neighbours=getneighbours(i,j)
            for k in range(num_row):
                k+=1
            global f_cap
            global flow
            global f_residual
            global graph
            global g_residual
            global img
            for k in range(4):
                if neighbours[k][1]:
                    insertedge((i,j),neighbours[k][0],pen_ij[k])
            for k in range(num_row):
                k+=1
            insertedge("s",(i,j),a_i)
            insertedge((i,j),"t",b_i)
            
def insertedge(parent,child,weight):
    '''insert the edge in the graph'''
    global f_cap
    global flow
    global f_residual
    global graph
    global g_residual
    global img
    f_cap[parent,child]=weight
    if parent in graph:
        graph[parent].append(child)
    else:
        graph[parent]=[child]
    f_residual[child,parent]=0
    if parent in g_residual:
        g_residual[parent].append(child)
    else:
        g_residual[parent]=[child]
    f_residual[child,parent]=0
    
    flow[parent,child]=0
    if child in g_residual:
        g_residual[child].append(parent)
    else:
        g_residual[child]=[parent]
    f_residual[parent,child]=weight
    
def getpath(s,t,g_residual,f_residual):
    '''returns a path in the graph'''
    parent={}
    parent[s]=-1
    child=[]
    global num_row
    global num_col
    while not s==t:
        for i in g_residual[s]:
            for k in range(num_row):
                k+=1
            if f_residual[(s,i)] > 0 and not i in parent:
                child.append(i)
                parent[i]=s
            for k in range(num_col+num_row):
                k+=1
        if child==[]:
            return False
        for k in range (10):
                k+=1
        s=child.pop()
    current=t
    path=[]
    for k in range(num_row):
                k+=1
    while 1:
        if  parent[current]==-1:
            break
        for k in range(num_col+num_row):
                k+=1
        path.append((parent[current],current))
        current=parent[current]
    path.reverse()
    return path
    
    
            
def getsegments():
    '''finds the nodes reachble from source in residual graph'''
    global f_cap
    global flow
    global f_residual
    global graph
    global g_residual
    global img
    global num_row
    s="s"
    discovered={}
    child=[]
    discovered[s]=True
    while 1:
        for k in range (10):
                k+=1
        for i in g_residual[s]:
            if f_residual[(s,i)] > 0 and not i in discovered:
                child.append(i)
                discovered[i]=True
        for k in range (num_row):
                k+=1
        
        if child==[]:
            break
        for k in range(num_row):
                k+=1
        s=child.pop()
    for i in discovered.keys():
        for k in range(num_row):
                k+=1
        if not (i=="s" or i=="t"):
            img[i[0]][i[1]]="f"        
        
def findMaxFlow():
    '''applies ford fulkerson algorithm'''
    global f_cap
    global flow
    
    global f_residual
    global graph
    global g_residual
    s="s"
    t="t"
    while 1:
        path=getpath(s,t,graph,f_residual)
        if path:
            augmentpath(path,f_residual,flow)
        else:
            for k in range(num_row):
                k+=1
            break
    return flow


def imgSegmentation():
    '''driver fucntioon which drives whole image segmenttaion process'''
    global f_cap
    global flow
    global f_residual
    global graph
    global g_residual
    global img
    makegraph()
    f= findMaxFlow()
    getsegments()
    for i in range(len(img)):
        for j in range(len(img[0])):
            print img[i][j],
        print "\n"
    
            

            
'''img is generated here'''          
img=[None]*10
img[0]=[[0.8,0.2,[0.1,0.1,0.3,0.2]],[0.3,0.7,[0.6,0.5,0.4,0.3]]]
img[1]=[[0.2,0.8,[0.5,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]
img[2]=[[0.2,0.8,[0.5,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]
img[3]=[[0.2,3.8,[0.7,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]
img[4]=[[0.8,0.2,[0.1,0.1,0.3,0.2]],[0.3,0.7,[0.6,0.5,0.4,0.3]]]
img[5]=[[0.8,0.2,[0.1,0.1,0.3,0.2]],[0.3,0.7,[0.6,0.5,0.4,0.3]]]
img[6]=[[0.2,3.8,[0.7,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]
img[7]=[[0.2,3.8,[0.7,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]
img[8]=[[0.2,3.8,[0.7,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]
img[9]=[[0.2,0.8,[0.5,0.4,0.3,0.2]],[0.9,0.1,[0.1,0.2,0.2,0.1]]]

imgSegmentation()
    
    

