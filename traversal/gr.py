# 0 DENOTES A BLANK TILE
#goal=[0,7,6,1,4,2,8,5,3]
goal=[1,8,7,2,0,6,3,4,5]
# NODE
class Node:
	def __init__(self,state,parent,op,depth,cost):
		self.state=state
		self.parent=parent
		self.op=op
		self.depth=depth
		self.cost=cost

def new_node(state,parent,op,depth,cost):
	return Node(state,parent,op,depth,cost)

def expand(node,nodes):
	# A LIST OF EXPANDED NODES IS RETURNED
	expansion=[]
	expansion.append(new_node(upwards(node.state),node,"up",node.depth+1,0))
	expansion.append(new_node(downwards(node.state),node,"down",node.depth+1,0))
	expansion.append(new_node(leftwards(node.state),node,"left",node.depth+1,0))
	expansion.append(new_node(rightwards(node.state),node,"right",node.depth+1,0))
	expansion=[node for node in expansion if node.state!=None]
	return expansion
	
def upwards(state):
	new_state=state[:]
	index=new_state.index(0)
	if index not in [0,3,6]:
			# SWAP
             temp=new_state[index-1]
             new_state[index-1]=new_state[index]
             new_state[index]=temp
             return new_state
	else:
		return None

def downwards(state):
	new_state=state[:]
	index=new_state.index(0)
	
	if index not in [2,5,8]:
			 # SWAP
             temp=new_state[index+1]
             new_state[index+1]=new_state[index]
             new_state[index]=temp
             return new_state
	else:
		return None

def leftwards(state):
	new_state=state[:]
	index=new_state.index(0)
	
	if index not in [0,1,2]:
			 # SWAP
             temp=new_state[index-3]
             new_state[index-3]=new_state[index]
             new_state[index]=temp
             return new_state
	else:
		return None

def rightwards(state):
	new_state=state[:]
	index=new_state.index(0)
	
	if index not in [6,7,8]:
			 # SWAP
             temp=new_state[index+3]
             new_state[index+3]=new_state[index]
             new_state[index]=temp
             return new_state
	else:
		return None

def greedy(state,goal):
     	nodes=[]
	nodes.append(new_node(state,None,None,0,0))
	while True:
		if len(nodes)==0: return None
		nodes.sort(compare)
		node=nodes.pop(0)
		print "Trying state",node.state," and move: ",node.op
		if node.state==goal:
			moves=[]
			temp=node
			while True:
				moves.insert(0,temp.op)
				if temp.depth <=1: break
				temp=temp.parent
			return moves
		nodes.extend(expand(node,nodes))
		
def compare(a,b):
     a=(h(a.state,goal))
     print a 
     print "\n"
     return a

def h(state,goal):
	score=0
	for i in range(len(state)):
		if state[i]!=goal[i]:
			score=score + 1
	return score

def display_board(state):
	print "_______\n\n %d %d %d \n %d %d %d \n %d %d %d" % (state[0],state[3],state[6],state[1],state[4],state[7],state[2],state[5],state[8])

# MAIN METHOD
def main():
	#start=[1,7,6,0,4,2,8,5,3]
	start=[8,0,7,1,2,6,3,4,5]
	result=greedy(start,goal)
	if result==None:
		print "NO SOLUTION FOR THIS CASE."
	elif result==[None]:
		print "STARTING NODE IS THE GOAL"
	else:
             print result
             print len(result), " MOVES"
             display_board(goal)

if __name__ == "__main__":
	main()
