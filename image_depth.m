function d = image_depth(X, P)
% Computes depth of the image using Eq. (6.15)
% Inputs:
%  - X = World coordinates (4x1)
%  - P = Projection matrix (3x4)
%
% Reference: Hartley and Zisserman, Multi View Geometry in Computer Vision, 
% 2nd Ed., p. 162.
%
M = P(1:3,1:3);
w = P(3,:) * X;

d = w / (X(4) * norm(M(3,:));

if det(M) < 0
  d = -d
end
