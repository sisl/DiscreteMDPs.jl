# defines API for discrete MDPs and their solvers
module DiscreteMDPs

# basic types
export DiscreteMDP, Solver, Simulator, Policy, MDPFile, PolicyFile

abstract DiscreteMDP
abstract Solver
abstract Simulator
abstract Policy
abstract MDPFile
abstract PolicyFile

# module function
export solve, simulate

solve(solver::Solver, mdp::DiscreteMDP) = error("$(typeof(solver)) does not implement solve for MDP $(typeof(mdp))")
simulate(simulator::Simulator, mdp::DiscreteMDP, policy::Policy) = error("$(typeof(simulator)) does not implement simulate for MDP $(typeof(mdp)) and policy $(typeof(policy))")

# file io
export load, save

load(file::PolicyFile) = error("$(typeof(file)) does not implement load")
load(file::MDPFile) = error("$(typeof(file)) does not implement load")
save(file::PolicyFile, policy::Policy) = error("$(typeof(file)) does not implement save for policy $(typeof(policy))")
save(file::MDPFile, mdp::DiscreteMDP) = error("$(typeof(file)) does not implement save for DiscreteMDP $(typeof(mdp))")

# model function
export states, actions, reward, transition, nextStates, numStates, numActions

states(mdp::DiscreteMDP) = error("$(typeof(mdp)) does not implement states") # returns something that might be iterable (e.g., 1:100)
actions(mdp::DiscreteMDP) = error("$(typeof(mdp)) does not implement actions") # returns something that might be iterable (e.g., 1:100)
reward(mdp::DiscreteMDP, state, action) = error("$(typeof(mdp)) does not implement reward") # returns reward
transition(mdp::DiscreteMDP, state, action, nextState) = error("$(typeof(mdp)) does not implement transition") # returns probability
nextStates(mdp::DiscreteMDP, state, aciton) = error("$(typeof(mdp)) does not implement transition") # returns neighbor states and prob vectors

numStates(mdp::DiscreteMDP) = length(collect(states(mdp)))
numActions(mdp::DiscreteMDP) = length(collect(actions(mdp)))

# policy functions
export action, value

action(p::Policy, state) = error("$(typeof(p)) does not implement action") # returns the action according to the policy p
value(p::Policy, state, action) = error("$(typeof(p)) does not implement value") # returns the expected value for a (s,a) pair
value(p::Policy, state) = error("$(typeof(p)) does not implement value") # returns the optimal expeted value for state s



end # module
