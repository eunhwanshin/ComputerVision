function P = camera_pose2proj(K, R_ec, pos)
% Compute camera projection matrix from pose
% Inputs:
%   K = Camera matrix (3x3)
%   R_ec = Rotation matrix from ECEF to camera frame (3x3)
%   pos = position in ECEF (3x1)
% Output:
%   P = projection matrix (3x4)
P = K * [R_ec , -R_ec*[pos(1); pos(2); pos(3)]];