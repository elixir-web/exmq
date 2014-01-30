defmodule ExmqTest do
  use ExUnit.Case

  import Exmq

  test "the truth" do
    start([], [])
    set_up_connection('localhost', 6379)
    push('channel1', {:ok, :test})
    push('channel1', {:ok, :test2})
    push('channel1', {:ok, :test3})
    
    assert pop('channel1') == {:ok, :test3}
    assert pop('channel1') == {:ok, :test2}

    assert(true)
  end
end
