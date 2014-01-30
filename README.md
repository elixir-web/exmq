# Exmq

Exmq - is redis based message queue for ElixirLang.

## Usage

First of all you must have runned redis.

After starting `redis` and `exmq` set up connection with:

```elixirlang
set_up_connection('localhost', 6379)
```

And you can use it:

```elixirlang
push('channel1', {:ok, :test})
push('channel1', {:ok, :test2})
push('channel1', {:ok, :test3})
{:ok, :test3} = pop('channel1')
```

## Contributing

  * Fork git@github.com:elixir-web/exmq.git
  * Make changes
  * Send pull request
  * Thank you.

## Todo

1. Add timestamps

2. Add reverse turn

## Author

[@0xAX](https://twitter.com/0xAX)
