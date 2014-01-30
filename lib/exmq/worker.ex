defmodule Exmq.Worker do

  use GenServer.Behaviour

  defrecord Config, 
    host: nil, 
    port: nil, 
    conn: nil

  def start_link() do
    :gen_server.start({ :local, __MODULE__ }, __MODULE__, [], [])
  end

  def init([]) do
    { :ok, {} }
  end

  def handle_cast({:connection, host, port}, state) do
    {:ok, conn} = :eredis.start_link(host, port)
    {:noreply, Config.new host: host, port: port, conn: conn}
  end

  def handle_call(:get_connection, _from, state) do
    {:reply, state.conn, state}
  end

end