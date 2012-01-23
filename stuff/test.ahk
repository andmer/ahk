$0::Suspend, toggle
$MButton::

   Loop  
   {
    if not GetKeyState("MButton", "P")
      break
     Send {MButton} 
     sleep 1
    }
return
$RButton::
   Loop  
   {
    if not GetKeyState("RButton", "P")

      break
     Send {RButton} 
     sleep 1
    }
return
$LButton::
   Loop  
   {
    if not GetKeyState("LButton", "P")
      break
     Send {LButton} 
     sleep 1

    }
return