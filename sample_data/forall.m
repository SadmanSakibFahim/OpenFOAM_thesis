radii = zeros(118,1);
for k = 0:117
	 filename = sprintf('data.%d.csv', k);
	 data = readtable(filename);
     water = zeros(100000,1);
     data(:, [1,2,3,5,6,7,8,9,11,12])=[];
     data = table2array(data);
     for i = 2:100001
          if data(i, 1) >= 0.96
             water(i, 1) = data(i, 2);          
          end 
     end
     radii(k+1, 1) = max(water);
end