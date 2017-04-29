/************************************************

		Copyright (c) 
		
 Written by: Binh D. Nguyen
 Comments: Find maximum of 2 and 3 numbers
*************************************************/

predicates

  nondeterm fwFb1(integer,integer)
  nondeterm fwFb2(integer,integer)
  nondeterm fhelp(integer,integer,integer,integer)
  
clauses
  
  % ======= Fibonacci number (forward direct) =======
  % version #1 (formula)
  fwFb1(0,1).
  fwFb1(1,1).
  fwFb1(N,X):-
	N>1,
	N1=N-1,
	fwFb1(N1,X1),
	N2=N-2,
	fwFb1(N2,X2),
	X=X1+X2.
  
  % version #2 (recursion)
  fwFb2(0,1).
  fwFb2(1,1).
  fwFb2(N,X):-fhelp(N,1,1,X).
  
  fhelp(0,N,_,N).
  fhelp(N,Prev1,Prev2,Result):-
  	N>0,
  	New_Prev=Prev1+Prev2,
  	N1=N-1,
  	fhelp(N1,Prev2,New_Prev,Result).

goal
  fwFb(5,X1),
  fwFb2(5,X2).