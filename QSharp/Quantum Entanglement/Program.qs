namespace Quantum.Entanglement {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    
    operation Entanglement () : (Result, Result) {
            mutable qubitOneState = Zero;
            mutable qubitTwoState = Zero;
        using((qubitOne, qubitTwo) =(Qubit(), Qubit())) {

            H(qubitOne);
            CNOT(qubitOne,qubitTwo); //maintain the odd parity one is 0 then other is 1

            set qubitOneState= M(qubitOne);
            set qubitTwoState = M(qubitTwo);

            Reset(qubitOne);
            Reset(qubitTwo);
		}
        return(qubitOneState, qubitTwoState);
    }
}
