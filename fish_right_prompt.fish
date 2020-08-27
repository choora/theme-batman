function git::is_stashed
  command git rev-parse --verify --quiet refs/stash >/dev/null
end

function git::get_ahead_count
  echo (command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
end

function git::branch_name
  command git symbolic-ref --short HEAD
end

function git::is_touched
  test -n (echo (command git status --porcelain))
end

function fish_right_prompt
  set -l code $status
  test $code -ne 0; and echo (__magenta_color_dim)"("(__magenta_color_yellow)"$code"(__magenta_color_dim)") "(__magenta_color_off)

  if test -n "$SSH_CONNECTION"
     printf (__magenta_color_yellow)":"(__magenta_color_dim)"$HOSTNAME "(__magenta_color_off)
   end

  if git rev-parse 2> /dev/null
    git::is_stashed; and echo (__magenta_color_yellow)"^"(__magenta_color_off)
    printf (__magenta_color_blue)"("(begin
      if git::is_touched
        echo (__magenta_color_yellow)"*"(__magenta_color_off)
      else
        echo ""
      end
    end)(__magenta_color_red)(git::branch_name)(__magenta_color_blue)(begin
      set -l count (git::get_ahead_count)
        if test $count -eq 0
          echo ""
        else
          echo (__magenta_color_yellow)"+"(__magenta_color_red)$count
        end
    end)(__magenta_color_blue)") "(__magenta_color_off)
  end
  printf (__magenta_color_dim)(date +%H(__magenta_color_red):(__magenta_color_dim)%M(__magenta_color_red):(__magenta_color_dim)%S)(__magenta_color_off)" "
end
