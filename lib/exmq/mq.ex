defmodule Exmq.Mq do
	
  use GenServer.Behaviour

  defrecord Config, 
    conn: nil

  def start_link() do
    :gen_server.start(__MODULE__, [], [])
  end

  def init([]) do
  	conn = :gen_server.call(:Exmq.Worker, :get_connection)
    { :ok, Config.new conn: conn}
  end

  def handle_cast({:push, channel, message}, state) do
    {:ok, _} = :eredis.q(state.conn, ["RPUSH", channel, :erlang.term_to_binary(message)])
    {:noreply, state}
  end

  def handle_call({:pop, channel}, _from, state) do
    {:ok, message} = :eredis.q(state.conn, ["RPOP", channel])
    {:reply, :erlang.binary_to_term(message), state}
  end

end