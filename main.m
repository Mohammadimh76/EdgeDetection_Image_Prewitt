I=imread('siahosefid.bmp');
I=im2double(I);
I=imnoise(I, 'gaussian', 0, 0.001);
figure(1);
imshow(I,[]); 

[height width R]=size(I);
for i=2:height-1
    for j=2:width-1
        Dx(i,j)=[I(i+1,j-1)-I(i-1,j-1)]+[I(i+1,j)-I(i-1,j)]+[I(i+1,j+1)-I(i-1,j+1)];
        Dy(i,j)=[I(i-1,j+1)-I(i-1,j-1)]+[I(i,j+1)-I(i,j-1)]+[I(i+1,j+1)-I(i+1,j-1)];
        P(i,j)=sqrt(Dx(i,j)^2+Dy(i,j)^2);
        if Dx(i,j)<0.5
           Dx(i,j)=0;
        else Dx(i,j)=1;
        end
        if Dy(i,j)<0.5
           Dy(i,j)=0;
        else Dy(i,j)=1;
        end
    end
end
figure(2);
imshow(Dx,[]); 

figure(3);
imshow(Dy,[]);

for i=1:height-1
    for j=1:width-1
        if (P(i,j)<0.5)
            P(i,j)=0;
        else P(i,j)=1;
        end
    end
end
figure(4);
imshow(P,[]);