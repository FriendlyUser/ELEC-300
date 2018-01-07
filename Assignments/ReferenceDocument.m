%% ELEC 300 reference document,
% going through circuit analysis with matlab to create and document useful features.
% This is the document that will be published
%%
% # Another list
% # lists
% # trades
format compact
format rational
%% Introduction 
% testing things out, what exactly is the introduction section
%%% SECTION TITLE WITHOUT SECTION BREAK
% DESCRIPTIVE TEXT
G=[1 0 0 0 0;...
 -1/3 5/6 -1/3 0 0;...
 0 -1/3 13/30 19/60 -19/60;...
 0 -10/3 1 -1 0;...
 0 0 -1/10 -19/60 37/60]
I=[12 0 0 0 0]' 
V=G\I
fprintf('\n');...
 fprintf('v1 = %7.2f V \n',V(1));...
 fprintf('v2 = %7.2f V \n',V(2));...
 fprintf('v3 = %7.2f V \n',V(3));...
 fprintf('v4 = %7.2f V \n',V(4));...
 fprintf('v5 = %7.2f V \n',V(5));...
 fprintf('\n'); fprintf('\n')


z1=4-j*6; z2=2+j*3; z3=8-j*3; % Define z1, z2 and z3
Z=[1/z1+1/z2 -1/z2; -1/z2 1/z2+1/z3]; % Elements of matrix Z
I=[5 -10]'; % Column vector I
V=Z\I; Va=V(1,1); Vb=V(2,1); Vab=Va-Vb; % Va = V(1), Vb = V(2) are also acceptable
% With f p r i n t f only the real part of each parameter is processed so we will use di s p
fprintf(' \n'); disp('Va = '); disp(Va); disp('Vb = '); disp(Vb); disp('Vab = '); disp(Vab);
fprintf(' \n');

Z=[1 0 0; -(4-j*6) 14-j*6 -(8-j*3); 0 0 1];
V=[5 0 10]';
I=Z\V; i1=I(1); i2=I(2); i3=I(3); fprintf(' \n');
disp('i1 = '); disp(i1); disp('i2 = '); disp(i2); disp('i3 = '); disp(i3); 

z1=4-6j; z2=2+3j; z3=8-3j; Is=5; i1=z1*Is/(z1+z2+z3);...
i1, magI1=abs(i1), phaseI1=angle(i1)*180/pi, v1=-3j*i1,...
magV1=abs(v1), phaseV1=angle(v1)*180/pi,...
Is2=-10; i2=(z1+z2)*Is2/(z1+z2+z3); magI2=abs(i2), phaseI2=angle(i2)*180/pi,...
v2=-3j*i2, magV2=abs(v2), phaseV1=angle(v2)*180/pi,...
vC=v1+v2, magvC=abs(vC), phasevC=angle(vC)*180/pi

%% Another Section

clear all
% Enter the non-zero values of the G matrix
G(1,1)=1;
G(2,1)=-1/2;
G(2,2)=1/2-1/5j+1/3j;
G(2,3)=-1/3j;
G(3,2)=-1/3j;
G(3,3)=1/3j+1/5;
%
% Enter all values of the I matrix
I=[1 0 0]';
%
% Compute node voltages
V=G\I;
%
VR1=V(1)-V(2);
VL=V(2)-V(3);
% Compute magnitudes and phase angles of voltages
magV1=abs(V(1)); magV2=abs(V(2)); magV3=abs(V(3));
phaseV1=angle(V(1))*180/pi; phaseV2=angle(V(2))*180/pi; phaseV3=angle(V(3))*180/pi;
magVR1=abs(VR1); phaseVR1=angle(VR1)*180/pi;
magVL=abs(VL); phaseVL=angle(VL)*180/pi;
%
% Denote radian frequency as w and plot wt for 0 to 2*pi range
wt=linspace(0,2*pi);
V1=magV1*cos(wt-phaseV1);
V2=magV2*cos(wt-phaseV2);
V3=magV3*cos(wt-phaseV3);
VR1t=magVR1*cos(wt-phaseVR1);
VLt=magVL*cos(wt-phaseVL);
%
% Convert wt to degrees
deg=wt*180/pi;
%
% Print phasor voltages, magnitudes, and phase angles
fprintf(' \n');
% With f p r i n t f only the real part of each parameter is processed so we will use d i s p
disp('V1 = '); disp(V(1)); disp('V2 = '); disp(V(2)); disp('V3 = '); disp(V(3));
disp('VR1 = '); disp(VR1); disp('VL = '); disp(VL);
fprintf('magV1 = %4.2f V \t', magV1); fprintf('magV2 = %4.2f V \t', magV2);
fprintf('magV3 = %4.2f V', magV3); fprintf(' \n'); fprintf(' \n');
fprintf('phaseV1 = %4.2f deg \t', phaseV1);
fprintf('phaseV2 = %4.2f deg \t', phaseV2); fprintf('phaseV3 = %4.2f deg', phaseV3);
fprintf(' \n'); fprintf(' \n');
fprintf('magVR1 = %4.2f V \t', magVR1); fprintf('phaseVR1 = %4.2f deg ', phaseVR1);
fprintf(' \n'); fprintf(' \n');
fprintf('magVL = %4.2f V \t', abs(VL)); fprintf('phaseVL = %4.2f deg ', phaseVL);
fprintf(' \n');
%
plot(deg,V1,deg,V2,deg,V3,deg,VR1t,deg,VLt)
fprintf(' \n');
%%
% $$H = w_x + 5$$
%%
% <http://www.mathworks.com MathWorks> 
%
% <matlab:FUNCTION DISPLAYED TEXT>