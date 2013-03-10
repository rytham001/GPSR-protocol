
source "../../node_start_time.tcl"
set scene_data_file "./2_2grid.tcl"

# 
#处理节点起始和终结时间 
handle_node_time $scene_data_file



set after_turnon 10.0  
# GPSR routing agent settings
set move_node_num 90 
set savefile [ open "node_life.txt"  w ]
for {set i 0} { $i<$move_node_num } { incr i } {
   puts $savefile "$i \t$arr_node($i)\t$arr_node_end($i)"
}
close $savefile 


# for {set i 0} {$i < $move_node_num } {incr i} {
#    # puts $arr_node($i)
#     $ns_ at 1 "$ragent_($i) turnon"
#      $ns_ at $opt(nn) "$ragent_($i) turnoff"
# }


set n 0 

# 偶数节点
#for {set i 0 } { $i < 90 } { incr i } {
# set i 16
#     set send_node  92 
#     set rec_node $i
#     set null_($n) [new Agent/Null]
#     $ns_ attach-agent $node_($rec_node) $null_($n)

#     set udp_($n) [new Agent/UDP]
#     $ns_ attach-agent $node_($send_node) $udp_($n)

#     set cbr_($n) [new Application/Traffic/CBR]
#     $cbr_($n) set packetSize_ 32
#     $cbr_($n) set interval_ 2.0
#     $cbr_($n) set random_ 1
#     #    $cbr_(1) set maxpkts_ 100
#     $cbr_($n) attach-agent $udp_($n)
#     $ns_ connect $udp_($n) $null_($n)

#     $ns_ at [expr $arr_node($i) + 1 ]   "$cbr_($n) start"
#     $ns_ at [expr $arr_node_end($i) - 0.5 ]  "$cbr_($n) stop" 
#     incr n 
    
# }


    set send_node  93
    set rec_node 92
    set null_($n) [new Agent/Null]
    $ns_ attach-agent $node_($rec_node) $null_($n)

    set udp_($n) [new Agent/UDP]
    $ns_ attach-agent $node_($send_node) $udp_($n)

    set cbr_($n) [new Application/Traffic/CBR]
    $cbr_($n) set packetSize_ 32
    $cbr_($n) set interval_ 2.0
    $cbr_($n) set random_ 1
    #    $cbr_(1) set maxpkts_ 100
    $cbr_($n) attach-agent $udp_($n)
    $ns_ connect $udp_($n) $null_($n)

    $ns_ at 150   "$cbr_($n) start"
    $ns_ at $opt(stop)   "$cbr_($n) stop" 
    incr n 