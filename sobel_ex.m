clc
clear
close all
original = imread('küp.jpg');
imshow(original)
clipped=original(:,:,:,:);

figure
imshow(clipped);
%%%%%%%%%%%change to black-white

bw = uint8((1/3)*(double(clipped(:,:,1))+double(clipped(:,:,2))+double(clipped(:,:,3))));
figure
imshow(bw);

bwdbl=double(bw);

%%%%%%%%%Apply mask for X
maskx=[-1 0 1;-2 0 2; -1 0 1];
[r,c]=size(bw);
  OUT = zeros(r-2,c-2);
for idx= 1:(r-3)
    for jdx= 1:(c-3)
      
%          rectangle('Position',[idx,jdx,3,3]);
%          drawnow
        bwsquare= bwdbl(idx:(idx+2),jdx:(jdx+2));
        
         OUT(idx,jdx)= sum(sum(maskx.*bwsquare));

    end
end
Gx=OUT;

figure()
imshow(Gx);

%%%%%%%%%Apply mask for Y



masky=[1 2 1;0 0 0;-1 -2 -1];

for idx= 1:(r-2)
    for jdx= 1:(c-2)
      
         rectangle('Position',[idx,jdx,3,3]);
         drawnow
        bwsquare= bwdbl(idx:(idx+2),jdx:(jdx+2));
         OUT(idx,jdx)= sum(sum(masky.*bwsquare));

    end
end
Gy=OUT;
figure()
imshow(Gy);

%%%%%%%%%%%%%%%%normalize it
G=sqrt(Gx.^2 + Gy.^2);
%G=1-G(1,:);
%%%%%%%%%%%%%%%%%%plot the result
figure();
imshow(G);

