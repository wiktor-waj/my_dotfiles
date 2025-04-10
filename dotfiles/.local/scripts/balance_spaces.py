#!/opt/homebrew/bin/python3
# script used for auto balancing MacOS spaces based on number of displays
# 
# built-in display = index 1
# extra display 1  = index 2
# extra display 2  = index 3
#
#    3 displays
# ------------------------------------------------------------------------
#    display index 3           display index 2         display index 1
# |--------------------|   |--------------------|   |--------------------|
# |          9         |   |  1 2 3 4 5 6 7 8   |   |         10         |
# |--------------------|   |--------------------|   |--------------------|
# 
#    2 displays
# ------------------------------------------------------------------------
#    display index 2          display index 1
# |--------------------|   |--------------------|
# | 1 2 3 4 5 6 7 8 9  |   |         10         |
# |--------------------|   |--------------------|
# 
#    1 display
# ------------------------------------------------------------------------
#    display index 1
# |--------------------|
# |1 2 3 4 5 6 7 8 9 10|
# |--------------------|

import json
import subprocess

def query_displays():
    query_displays_cmd = "yabai -m query --displays"
    query_displays_out = subprocess.Popen(query_displays_cmd, shell=True,
                           stdout=subprocess.PIPE).stdout.read().decode("utf-8")
    return json.loads(query_displays_out)

def create_spaces(display_idx, spaces_count):
    create_cmd = f"yabai -m space --create {display_idx}"
    for i in range(spaces_count):
        subprocess.run(create_cmd, shell=True)

def delete_spaces(spaces, spaces_count):
    # delete spaces from end
    for i in range(spaces_count):
        popped_space = spaces.pop()
        destroy_cmd = f"yabai -m space --destroy {popped_space}"
        subprocess.run(destroy_cmd, shell=True)

def balance_display(display, correct_space_count):
    display_idx = display["index"]
    spaces = display["spaces"]
    space_diff = abs(correct_space_count - len(spaces))
    if len(spaces) < correct_space_count:
        create_spaces(display_idx, space_diff)
    elif len(spaces) > correct_space_count:
        delete_spaces(spaces, space_diff)

def balance_spaces():
    display_list = query_displays()
    if len(display_list) == 3:
        middle_display = display_list[0] # display id 2, middle, main
        balance_display(middle_display, 8) 

        # need to query displays again after each change in spaces
        display_list = query_displays()
        left_display = display_list[2] # display id 3, left
        balance_display(left_display, 1)

        display_list = query_displays()
        right_display = display_list[1] # display id 1, right, built-in
        balance_display(right_display, 1)
    elif len(display_list) == 2:
        main_display = display_list[0] # display id 2, main
        balance_display(main_display, 9)

        display_list = query_displays()
        built_in_display = display_list[1] # display id 1, built-in
        balance_display(built_in_display, 1)
    elif len(display_list) == 1:
        balance_display(display_list[0], 10) # display id 1, built-in

if __name__ == "__main__":
    balance_spaces()
