#!/usr/bin/gawk -f
# Weight the times, taking out all non-project admin, mail, coffee, computer, etc.

BEGIN {
   FS = "\t"
   OFS = "\t"
   TIME = 1
   SUBTASK = 2
   TASK = 3
   PROJECT = 4
   DATE = 5

   TRUE = 1
   FALSE = 0

   error_number = 0

   #project_time = 1150
   #non_project_time = 640
}

($PROJECT ~ "^$|leave|non-project") {
   next
}

{
   $TIME = int($TIME * (project_time + non_project_time) / project_time + 0.5)
   #total += $TIME
   print
}

