# DiscreteMDPs

This package provides a basic interface for working with discrete Markov decision processes (MDPs).

## Basic Types

The basic types are

- `DiscreteMDP`
- `Solver`
- `Simulator`
- `Policy`
- `MDPFile`
- `PolicyFile`

## Basic functions

- `solve(solver::Solver, mdp::DiscreteMDP)`
- `simulate(simulator::Simulator, mdp::DiscreteMDP, policy::Policy)`

## File IO

- `load(file::PolicyFile)`
- `load(file::MDPFile)`
- `save(file::PolicyFile, policy::Policy)`
- `save(file::MDPFile, mdp::DiscreteMDP)'

## Model functions

- `states(mdp::DiscreteMDP)` returns something that might be iterable (e.g., 1:100)
- `actions(mdp::DiscreteMDP)` returns something that might be iterable (e.g., 1:100)
- `actions(mdp::DiscreteMDP, state)` returns something that might be iterable (e.g., 1:100)
- `reward(mdp::DiscreteMDP, state, action)` returns reward
- `transition(mdp::DiscreteMDP, state, action, nextState)` returns probability
- `nextStates(mdp::DiscreteMDP, state, action)` returns arrays of state indices and their corresponding probabilities 

