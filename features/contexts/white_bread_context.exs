defmodule WhiteBreadContext do
  use WhiteBread.Context

  when_ "I navigate to heroku 200", fn state ->
      {:ok, state}
  end

  then_ "I should see heroku 200", fn state ->
      {:ok, state}
  end

end
