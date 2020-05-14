

Created By: hyerim kim
Last Edited: May 14, 2020 12:30 AM
# Quantum mechanics

- a framework for the development of physical theories
- provide a connection between the physical world and the mathematical formalism

# 4 postulates

- state space : quantum state
- evolution : quantum state change with time
- measurement : effect on a qs of interaction with classical system
- composition : compose multiple quantum systems

# State space

- **arena where quantum mechanics take place; Hilbert space**
    - a complex vector space with inner product (Hilbert)
- simple assumption
    - **qubit: a two-dimensional state space**
- physical realisations of qubits, quantum states with space C^2
    - spin of am electron
    - polarisation of photon ..

# Time Evolution

- 시간에 따라 양자역학의 상태는 어떻게 변할까?
- 슈뢰딩거 equation: continuous time 의 postulate 이다.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/177f1361-f41b-48cc-b095-eb59dad519b2/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/177f1361-f41b-48cc-b095-eb59dad519b2/Untitled.png)

- Eigenvalue: E - energy , Eigenvector: |E> - stationary states or energy eigenstates

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ffcd9edc-703e-4242-9b77-95c8593c9762/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ffcd9edc-703e-4242-9b77-95c8593c9762/Untitled.png)

- unitary operator 을 적용한다는 게 우리가 양자계와 상호작용하고 있음을 나타내고 그럼 양자계가 닫혀있다고 표현할 수 있을까?
    - 책의 84 page에 답이 나와있음.
    - evolution ≠ measurement

## Evolution in computer science

- **Unitary transformation 을 통해 시간에 따른 변화를 나타낼 수 있다. the evolution of a closed quantum system**
    - 단 system이 closed 되어있다고 가정한다 (실제 우주는 모든 시스템이 interact한다. 크게 보면 open system 도 larger closed system 일 수도 있다. )
- Just as quantum mechanics does not tell us the state space or quantum state of a
particular quantum system, it does not tell us which unitary operators U describe real world quantum dynamics. Quantum mechanics merely assures us that the evolution of
any closed quantum system may be described in such a way
- the state at discretised time intervals, not in continuous time
- unitary operator U depends only on the underlying Hamiltonian and the times t0 and t1

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/424cef42-10b5-4ebb-81b2-1a949862e7e2/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/424cef42-10b5-4ebb-81b2-1a949862e7e2/Untitled.png)

# significance of unitary

- norm 의 크기가 1로 보존된다
- pauli matrix 와 hadamard matrix 모두 unitary 다

# Measurement

- {M_m}: Measurement operators
    - described by a collection of measurement operators
- completeness equation
    - probability sum to 1
- CS에서는 single qubit measurement 를 가정한다

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b98164f0-e85c-4938-846a-cbcd4e27d8ea/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b98164f0-e85c-4938-846a-cbcd4e27d8ea/Untitled.png)

- **measurement of a qubit in the computational basis**

# Composition

- state space of a composite physical system
    - tensor product of the state spaces
