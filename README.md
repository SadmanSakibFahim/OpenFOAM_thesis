OpenFOAM is an open-source Linux package that is popular in the field of computational fluid mechanics. On my windows device, I employed Linux with Ubuntu 18.04 LTS on WSL.
This folder contains a sample_directory which is utilized by OpenFOAM's interFoam solver to generate fluid domain data based on the properties and commands provided in the directory.
sample_data is a folder of the information which is generated once the interFoam solver completes data generation and paraFoam is used to extract the required data from the data visualization interface of Paraview which comes in a package with OpenFOAM. For the purpose of my thesis, the parameter of concern was the maximum spreading diameter. To find this value, the spreading diameter at each timestep was computed by the MATLAB file 'forall.m'. Afterwards, the maximum spreading diameter is plotted against non-dimensional time parameter. A plethora of relations can be examined with this method. Some samples are provided in sample_results.
 
The following commands are sequentially on WSL to employ OpenFOAM:
blockMesh – this command creates the three-dimensional system and divides the system into the
required number of cells.
setFields – this command applies the presence of fluid in the desired cells using the ‘alpha.water’
variable.
decomposePar – this command decomposes the system into separate domains to be handled by
individual cores of the processor.
interFoam – this command engages the solver to perform computations.
mpirun – this command, in conjunction with interFoam, runs the simulation of the decomposed
system on the designated number of cores of the processor. mpirun uses the Open Run-Time
Environment (ORTE) to launch jobs for parallel processing..
reconstructPar – after the computation is completed, this command reconstructs the data of the
system computed by each core and stores the data in folders named as each timestep.
reconstructParMesh – after the computation is completed, this command reconstructs the data of
the Mesh geometry of the system computed by each core and stores the data in folders named as
each timestep.
paraFoam – this command runs the visualization software ‘Paraview’ to perform
post-processing. ‘-builtin’ must be added to the command to display decomposed cases.
