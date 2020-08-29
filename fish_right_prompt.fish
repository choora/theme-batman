# Check if the current directory is a git repo
function git::is_git_repo
  command git rev-parse >/dev/null 2>&1
end

function git::get_ahead_count
  echo (command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
end

function git::branch_name
  command git symbolic-ref --short HEAD 2>/dev/null
end

function git::is_touched
  test -n (echo (command git status --porcelain))
end

function fish_right_prompt
  set -l code $status
  test $code -ne 0; and echo (__magenta_color_dim)"("(__magenta_color_red)"$code"(__magenta_color_dim)") "(__magenta_color_off)

  if git::is_git_repo
    echo (__magenta_color_dim)"["(begin
      if git::is_touched
        echo (__magenta_color_red)"*"(__magenta_color_off)
      else
        echo ""
      end
    end)(__magenta_color_blue)(git::branch_name)(__magenta_color_dim)(begin
      set -l count (git::get_ahead_count)
        if test $count -eq 0
          echo ""
        else
          echo " "$count
        end
    end)"] "(__magenta_color_off)
  end
  echo (__magenta_color_dim)(date +%H(__magenta_color_red):(__magenta_color_dim)%M(__magenta_color_red):(__magenta_color_dim)%S)(__magenta_color_off)" "
end
