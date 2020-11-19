function dy = SIR(t,y,beta,mu) % set up the SIR differential equations

    dy=zeros(3,1);
    if(isnumeric(beta) && isnumeric(mu)) 
        dy(1)=-((beta.*(y(1)).*y(2))./((y(1)+y(2)+y(3)))); % "S" of SIR
        dy(2)=((beta*y(1)*y(2))./((y(1)+y(2)+y(3))))-(mu.*y(2)); % "I" of SIR
        dy(3)=mu.*y(2); % "R" of SIR
    end
    
end