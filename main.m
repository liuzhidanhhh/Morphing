im1=imread('11.png');
im2=imread('22.png');
[im1_pts, im2_pts] = click_correspondences(im1, im2);
warp_frac=0.9:-0.1:0;
dissolve_frac=0.9:-0.1:0;
morphed_im=cell(1,9);
for i=1:length(warp_frac)
    morphed_im{1,i} = morph(im1, im2, im1_pts, im2_pts, warp_frac(i), dissolve_frac(i));
end
for i=1:9
    figure,imshow(morphed_im{1,i});
    cdata = print('-RGBImage');
    imwrite(cdata, fullfile(['femail'+i,num2str(i),'.png']));       
end
writerObj=VideoWriter('femail.avi');
open(writerObj);
for i=1:9
    frame=morphed_im{1,i};
    writeVideo(writerObj,frame);
end
close(writerObj);
