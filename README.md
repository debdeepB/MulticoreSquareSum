# Proj1

## 1. Group Information

Debdeep Basu (UFID: 4301-3324)

Ali Akbar (UFID: 8498-3349)

## 2. Instructions

After unzipping the project, cd into the root directory:

```bash
cd proj1
```

Run proj1.exs with two command line arguments N and k

```bash
mix run proj1.exs 1000000 4
```

## 3. Implementation information (single node)

### 3.1 Size of work unit

We have a boss genserver and many worker genservers. The boss genserver assigns work to the worker genservers.

The boss divides work equally amongst the total number of workers, so that each worker performs the same amount of work. So if N is 1000000 and we have 100 workers then the work unit is 1000000/100 = 10000.

### 3.2 The result of running: mix run proj1.exs 1000000 4

[]

### 3.3 Running time of N = 1000000 and k = 4

real	0m0.597s
user	0m1.457s
sys		0m0.138s

CPU/real = (user + system)/real = (1.457+0.138)/0.597 = 2.6716917922948076

### 3.4 Largest problem we have managed to solve

## 4. Bonus question (Multiple remote nodes)

### 4.1 Total number of remote nodes

We have been able to use 2 remote nodes.
On solving n=100000000 and k=20, it took s and the ratio of CPU time to real time was: . You can find the project in the proj1-bonus folder.


## 5. Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `proj1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:proj1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/proj1](https://hexdocs.pm/proj1).

