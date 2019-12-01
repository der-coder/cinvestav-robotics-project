%% Simulacion PGS
clc
clear

load('pose_PD.mat')

[~,~,a,b,~,~] = PGS_data();
p = pose_PD.Data(:,1:3);
R = pose_PD.Data(:,4:6);

clear pose

l = zeros(3,6,length(p));

for j = 1:length(p)
  Rot = ROT(R(j,3),'z','r')*ROT(R(j,2),'y','r')*ROT(R(j,1),'x','r');
  for i = 1:6
    l(:,i,j) = p(j,:)' + Rot*a(:,i) - b(:,i);
  end
end

fig = figure(1);

for i = 1:25:length(p)
  plt_pose(b,l(:,:,i))
  axis([-2 2 -2 2 -0 2])
  pause(.05)
  
%   k(i) = getframe(fig);
  if i ~= length(p)
    clf
  end
end

% video = VideoWriter('SubirPGS', 'MPEG-4');
% video.FrameRate = 30;
% open(video);
% writeVideo(video, k);
% close(video);
close (fig)

function plt_pose(b,l)
  p = b + l;
  hold on
  grid on
  axis equal
  view([-30 45])
  
  plot3(b(1,:),b(2,:),b(3,:),'ok')
  plot3(p(1,:),p(2,:),p(3,:),'ok')
  for i = 1:6
    x = [b(1,i),p(1,i)];
    y = [b(2,i),p(2,i)];
    z = [b(3,i),p(3,i)];
    plot3(x,y,z,'b')
  end
  t = 0:(2*pi)/10:2*pi;
  rb = norm(b(:,1));
  x = rb*cos(t);
  y = rb*sin(t);
  z = 0*t;
  plot3(x,y,z,'r')
  for i = 2:7
    if i <= 6
      x = [p(1,i-1),p(1,i)];
      y = [p(2,i-1),p(2,i)];
      z = [p(3,i-1),p(3,i)];
      plot3(x,y,z,'r')
    else
      x = [p(1,i-1),p(1,1)];
      y = [p(2,i-1),p(2,1)];
      z = [p(3,i-1),p(3,1)];
      plot3(x,y,z,'r')
    end
  end
end