# Robot-Control
Matlab implementation of an robot arm by using spatial operator algebra

The project has two parts;  The first part initializes some variables and constructs a Jacobian matrix J, while the second part defines a function that updates the pose of a robot until it reaches a target position.

This program is simulating a robot's movement based on its kinematics. Specifically, it appears to be using a chain of linkages to move the robot end-effector to a desired position. The first part initializes the parameters of the robot's links and calculates the Jacobian matrix, which is used to compute the angular velocities needed to achieve the desired position. The second part applies those velocities to update the position of each link in the chain.

Spatial Operator Algebra: https://dartslab.jpl.nasa.gov/References/pdf/soammc-paper.pdf

You should first run Initial.m then program.m

It will plot a 3d plot of the end factor of the robot arm.
