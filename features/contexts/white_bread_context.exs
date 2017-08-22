defmodule WhiteBreadContext do
  use WhiteBread.Context

  use Hound.Helpers

  scenario_starting_state fn state ->
    Application.ensure_all_started(:hound)
    Hound.start_session
  end

  scenario_finalize fn state ->
    Hound.end_session
  end


  when_ "I view the homepage", fn state ->
    navigate_to "/"
    {:ok, state}
  end

  then_ "I should see the homepage", fn state ->
    assert String.match? visible_page_text, ~r/.*200.*status/
    {:ok, state}
  end
  
  when_ "I navigate to heroku 200", fn state ->
    navigate_to "http://the-internet.herokuapp.com/status_codes/200"
    {:ok, state}
  end
  
  when_ "I navigate to heroku 500", fn state ->
    navigate_to "http://the-internet.herokuapp.com/status_codes/500"
    {:ok, state}
  end

  then_ "I should see heroku 200", fn state ->
    assert String.match? visible_page_text, ~r/.*200.*status/
    {:ok, state}
  end

  then_ "I should the homepage", fn state ->
    1/0
    require IEx; IEx.pry
    assert String.match? visible_page_text, ~r/.*Welcome to Phoenix.*/
    {:ok, state}
  end

end
