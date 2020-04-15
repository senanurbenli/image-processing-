clc;
clear ;
close all;

I1=imread('Copy_2_of_küp.jpg');

subplot(211);
imshow(I1);

I=rgb2gray(I1);

[m, n]=size(I);

Im=padarray(I,[1 1]);

[x, y]=size(Im);

% mask=[-1 0 1;-1 0 1;-1 0 1];%prewitt
mask=[-1 -2 -1;0 0 0;1 2 1];%sobel

for i=1:x-2
    for j=1:y-2   
        mak=0;
        a=0;
        b=0;
        for ii=i:i+2
            a=a+1;
            for jj=j:j+2
                b=b+1;
                s(a,b)=Im(ii,jj);
            end
            b=0;
        end
        sm=double(s).*mask;
        t=0;
        for k=1:3
            for h=1:3
            t=t+sm(k,h);
            end
        end
        I2(i,j)=t;
    end
end
I21=im2bw(uint8(I2));
%mask=[-1 -1 -1;0 0 0;1 1 1];%prewitt
mask=[-1 0 1;-2 0 2;-1 0 1];%sobel
for i=1:x-2
    for j=1:y-2
        mak=0;
        a=0;
        b=0;
        for ii=i:i+2
            a=a+1;
            for jj=j:j+2
                b=b+1;
                s(a,b)=Im(ii,jj);
            end
            b=0;
        end
           sm=double(s).*mask;
        t=0;
        for k=1:3
            for h=1:3
            t=t+sm(k,h);
            end
        end
        I2(i,j)=t;
    end
end

I22=im2bw(uint8(I2));
I2=I21+I22;
subplot(212);
imshow(I2)
