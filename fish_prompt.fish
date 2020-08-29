function fish_prompt
  test $status -ne 0;
    and set -l colors 600 900 c00
    or set -l colors 333 666 aaa

  #set -l pwd (prompt_pwd)
  set -l pwd (pwd)
  set -l base (basename "$pwd")

  set -l expr "s|$HOME|"(set_color -o)(__magenta_color_red)"~"(__magenta_color_off)"|g; \
               s|/|"(__magenta_color_yellow)"/"(__magenta_color_off)"|g;  \
               s|"$base"|"(__magenta_color_red)$base(__magenta_color_off)" |g"

  echo -n (echo "$pwd" | sed -e $expr)(__magenta_color_off)

  for color in $colors
    echo -n (set_color $color)">"
  end

  echo -n " "
end
