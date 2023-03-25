# Robot-Control
Matlab implementation of an robot arm by using spatial operator algebra

The project has two parts;  The first part initializes some variables and constructs a Jacobian matrix J, while the second part defines a function that updates the pose of a robot until it reaches a target position.

This program is simulating a robot's movement based on its kinematics. Specifically, it appears to be using a chain of linkages to move the robot end-effector to a desired position. The first part initializes the parameters of the robot's links and calculates the Jacobian matrix, which is used to compute the angular velocities needed to achieve the desired position. The second part applies those velocities to update the position of each link in the chain.

Spatial Operator Algebra: https://dartslab.jpl.nasa.gov/References/pdf/soammc-paper.pdf

You should first run Initial.m then program.m

It will plot a 3d plot of the end factor of the robot arm.

Starting position of the manipulator in Matlab VRL
> ![Starting position of the manipulator](https://user-images.githubusercontent.com/128630855/227711686-f69f8991-33fc-4afb-855e-5bd59d13e953.jpg) 

Example trajectory of the end-factor of the manipulator
![Example trejectory of end-factor](https://user-images.githubusercontent.com/128630855/227711691-df37a106-ad4d-419c-badc-53c291b5416f.jpg)
