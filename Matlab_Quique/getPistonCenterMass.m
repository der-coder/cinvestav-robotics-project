function (pistonCOM) = getPistonCenterMass(points,masses)
    tempMass = 0;
    tempCOM = zeros(3,1);
    centerMass = zeros(3,1);
    for i = 2:size(points,2)
        tempMass = tempMass + masses(i-1);
        if i = 2
            tempCOM = combinedCenterMass(points(1),points(2),masses(1),masses(2));
        else
            tempCOM = combinedCenterMass(tempCOM,points(i),tempMass,masses(i));
        end
    end
    pistonCOM = tempCOM;
end