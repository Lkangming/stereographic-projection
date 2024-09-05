P=(p_x.^2+p_y.^2+p_z.^2).^0.5;

p_x1(:,:,:)=p_x(:,:,:)./P(:,:,:);
p_y1(:,:,:)=p_y(:,:,:)./P(:,:,:);
p_z1(:,:,:)=p_z(:,:,:)./P(:,:,:);


for i = 1:64
    for j = 1:64
        for k = 1:20
            if p_z1(i,j,k)<0
                p_x1(i,j,k)=-p_x1(i,j,k);
                p_y1(i,j,k)=-p_y1(i,j,k);
                p_z1(i,j,k)=-p_z1(i,j,k);
            end
            theta(i,j,k)=0;
        end
    end
end

% for i = 1:64
%     for j = 1:64
%         for k = 1:20
%             theta(i,j,k)=0;
%         end
%     end
% end

for i = 1:64
    for j = 1:64
        for k = 1:20
            if p_y1(i,j,k)<0
                theta(i,j,k)=atan(p_y1(i,j,k)./p_x1(i,j,k))+pi;
            else
                theta(i,j,k)=atan(p_y1(i,j,k)./p_x1(i,j,k));
            end
        end
    end
end

gama = acos(p_z1(:,:,:));
rho = 2.*tan(gama(:,:,:)./2);

for i = 1:10
    if i<=2
        polarplot(theta(:,:,i),rho(:,:,i),'r.')
        hold on
    else
        polarplot(theta(:,:,i),rho(:,:,i),'b.')
        hold on
    end
end


% polarplot(theta(:,:,10),rho(:,:,10),'bx')
% % hold on
% % polarplot(theta(:,:,1),rho(:,:,1),'g.')