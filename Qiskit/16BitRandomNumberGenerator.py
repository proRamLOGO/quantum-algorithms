from qiskit import *
from qiskit.tools.visualization import plot_histogram

qr = QuantumRegister(16)
cr = ClassicalRegister(16)
circuit = QuantumCircuit(qr,cr)

%matplotlib inline

for i in range(16) :
    circuit.h(qr[i])

circuit.measure(qr,cr)
circuit.draw(output='mpl')

simulator = Aer.get_backend('qasm_simulator')
result = execute(circuit,backend=simulator).result()
plot_histogram(result.get_counts(circuit))

res = result.get_counts(circuit)
randomBinary = max(res,key=res.get)
randomInt = int(randomBinary,2)

print(randomInt)
