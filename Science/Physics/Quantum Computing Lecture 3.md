# 20-05-13

Created By: hyerim kim
Last Edited: May 14, 2020 12:30 AM

# Quantum mechanics

- a framework for the development of physical theories

# 4 postulates

- state space
- evolution
- measurement
- composition

# State space

- a complex vector space with inner product (Hilbert)
- physical realisations of qubits
    - spin of am electron
    - polarisation of photon ..

# Time Evolution

- 슈뢰딩거 equation

![20%2005%2013%203fc58a35520b49e5a7dc772f2ab89615/Untitled.png](20%2005%2013%203fc58a35520b49e5a7dc772f2ab89615/Untitled.png)

## Evolution in computer science

- the state at discretised time intervals, not in continuous time
- unitary operator U depends only on the underlying Hamiltonian and the times t0 and t1

![20%2005%2013%203fc58a35520b49e5a7dc772f2ab89615/Untitled%201.png](20%2005%2013%203fc58a35520b49e5a7dc772f2ab89615/Untitled%201.png)

# significance of unitary

- norm 의 크기가 1로 보존된다
- pauli matrix 와 hadamard matrix 모두 unitary 다

# Measurement

- described by a collection of measurement operators
- completeness equation
- CS에서는 single qubit measurement 를 가정한다