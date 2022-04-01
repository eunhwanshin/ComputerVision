function X = triang_img_pts(K, R_ec1, pos1, img_pt1, R_ec2, pos2, img_pt2)
% Triagulate image points in two view to obtain target coordinates
% using lease squares solution.
% Inputs:
%   K = camera matrix (3x3)
%   R_ec1, R_ec2 = Rotation matrix from ECEF to camera 
%   pos1, pos2  = Position in ECEF
%   img_pt1, img_pt2 = Image coordinates of the target
% Output:
%   X = Coordinates of the target in ECEF
% Reference: Hartley and Zisserman, Multi View Geometry in Computer Vision, 
% 2nd Ed., p.312.

P1 = camera_pose2proj(K, R_ec1, pos1);
P2 = camera_pose2proj(K, R_ec2, pos2); 

A = [ ...
  img_pt1(1) * P1(3,:) - P1(1,:);
  img_pt1(2) * P1(3,:) - P1(2,:);
  img_pt2(1) * P2(3,:) - P2(1,:);
  img_pt2(2) * P2(3,:) - P2(2,:)];
  
B = A(:,1:3);
t = -A(:,4);
X = B\t;
  
  