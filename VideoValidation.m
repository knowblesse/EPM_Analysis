%% VideoValidation
% Validate with raw vidio data
v = VideoReader('vid.mp4');
v.CurrentTime = 5;
currAxes = axes;
t = 2;

ClosedOpen = zeros(size(XY));

while hasFrame(v)
    vidFrame = readFrame(v);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible ='off';
    hold on;
    line([E1(1),E2(1)],[E1(2),E2(2)],'Color','w');
    line([E3(1),E4(1)],[E3(2),E4(2)],'Color','w');
    scatter(XY(t,1), XY(t,2),50,'Marker','*','MarkerEdgeColor','r');
    l1point = E1 + (E2-E1) .* ( (XY(t,:)-E1)*(E2-E1)' / norm(E2 - E1)^2);
    ClosedOpen(t,1) = (XY(t,:)-E1)*(E2-E1)' / norm(E2 - E1)^2;
    scatter(l1point(1), l1point(2),50,'Marker','*','MarkerEdgeColor','g');
    l2point = E3 + (E4-E3) .* ( (XY(t,:)-E3)*(E4-E3)' / norm(E4 - E3)^2);
    ClosedOpen(t,2) = (XY(t,:)-E3)*(E4-E3)' / norm(E4 - E3)^2;
    scatter(l2point(1), l2point(2),50,'Marker','*','MarkerEdgeColor','g');
    hold off;
    if v.CurrentTime - 5 >= Timestamps(t)
        t = t + 1;
    end
    pause(1/30);
end
    
