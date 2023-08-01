# Elavator Controller
## Assumptions :
+ Lift service is between two floors only.
+ Lift doors closed /opened automatically.
+ Lift fan switch on/off automatically (used only when lift is in use).
+ If lift doors remain open due to malfunctioning of door etc. lift will not start.
+ The direction of motion of motor changed automatically according to position of lift.
+ No lift calling system.

### Lift controller operation :

+ If the lift is downstairs,
+ 1. Close the doors
+ 2. Start the lift fan and check for closed door.
+ 3. Select the motor direction to upward
+ 4. Start motor and go up.
+ 5. Check for top floor position
+ 6. Switch off lift fan and motor
+ 7. Open the doors
+ 
+ If the lift is upstairs,
+ 1. Close the doors
+ 2. Start the lift fan and check for closed door.
+ 3. Select the motor direction to downward
+ 4. Start motor and go down.
+ 5. Check for ground floor position
+ 6. Switch off lift fan and motor
+ 7. Open the doors
