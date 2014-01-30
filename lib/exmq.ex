defmodule Exmq do
  
  use Application.Behaviour

  def start(_type, _args) do
    Exmq.Supervisor.start_link
  end

  def set_up_connection(host, port) do
    :gen_server.cast(:Exmq.Worker, {:connection, host, port})
    :ok
  end

  def push(channel, message) do
    {:ok, pid} = Exmq.Mq.start_link
    :gen_server.cast(pid, {:push, channel, message})
    :ok
  end

  def pop(channel) do
    {:ok, pid} = Exmq.Mq.start_link
    :gen_server.call(pid, {:pop, channel})
  end
  
end