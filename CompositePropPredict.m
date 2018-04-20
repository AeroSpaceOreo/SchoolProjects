%Composite material propertie calculation
%% Fiber Input Data
Ef1 = 900e9; %(Pa) 1 direction Young's modulus
Ef2 = 8.1e9; %(Pa) 2 direction Young's modulus
Gf12 = 10e9; %(Pa) 1-2 direction Shear modulus
vf12 = 0.31; %1-2 direction Poisson's ratio
vf23 = 0.34; %2-3 direction Poisson's ratio
%Recalculate input data
vf21 = vf12*(Ef2/Ef1);
Gf23 = Ef2/(2*(1+vf23)); %(Pa) 2-3 direction Shear modulus

%Linear thermal expansion coefficient
af1 = -1.1e-6; %(1/K)1 direction thermal coefficient
af2 = 36e-6; %(1/K)2 direction thermal coefficient

%Density
rhof = 1930; %(kg/m^3)

%% Matrix(epoxy) Input Data
Em = 3e9; %(Pa) Isotropic Young's modulus
vm = 0.35; %Poisson's ratio
%Recalculate input data
Gm = Em/(2*(1+vm)); %Isotropic Shear modulus

%Linear thermal expansion coefficient
am = 45e-6; %(1/K)

%Density
rhom = 1150; %(kg/m^3)

cc = 0.8 %Volume fraction of fibers

%% Calculation of the effective properties of UD ply
G12 = Gm+(2*cc*(Gf12-Gm))/(1+cc+(1-cc)*(Gf12/Gm));
G23 = Gm+(4*cc*(Gf23-Gm)*(1-vm))/((1/(3-4*vm))+cc+(1-cc)*(Gf23/Gm))*1/(3-4*vm)
B = 2/(v*rhom+(1/cc)/(1-cc)+E)
