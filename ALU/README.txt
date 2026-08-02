This is an alu made for a cpu it has 2 inputs in_a and in_b and the opcode controls the different instructions it does 
Opcode
000          Does Halt it halts the alu so it does the simple operation where it passes in_a
001          ALL it does the simple operation where it passes in_a
010          It adds the 2 inputs 
011          It does the and operation to the 2 inputs
100          It does the Xor operation to the 2 inputs
101          It Loads the word by passing b
110          It stores the word by passing a
111          It jumps so here it simply passes a