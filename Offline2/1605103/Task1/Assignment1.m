TrainFileName = 'train.csv';
TrainData = csvread(TrainFileName,1,0);%from row 1 col 0

longitude = transpose(TrainData(:,1));
latitude = transpose(TrainData(:,2));
totalRooms = transpose(TrainData(:,3));
totalBedRooms = transpose(TrainData(:,4));
population = transpose(TrainData(:,5));
houseHolds = transpose(TrainData(:,6));
medianHouseHoldValue = transpose(TrainData(:,7)); 

%TASK 1:plotting longitude VS latitude
figure
plotTrain = scatter(longitude,latitude,population.*0.07,medianHouseHoldValue,'filled');
plotTrain_colorBar = colorbar;
colormap('jet');
plotTrain_colorBar.Label.String = 'Mean Household Value';
plotTrain_colorBar.Label.FontSize = 12;
xlabel('longitude');
ylabel('latitude');
hold on;

%TASK 2: Multilinear Regression
trainX=[longitude;latitude;totalRooms;totalBedRooms;population;houseHolds];
format short g
A=multiLinearRegression(trainX,medianHouseHoldValue)
%X = [ones(size(longitude)) ;longitude ;latitude ;totalRooms ;totalBedRooms ;population ;houseHolds];
%y=medianHouseHoldValue;
%A2 = regress(transpose(y),transpose(X))    % Removes NaN data

fprintf("Equation y=%d +%dx1 +%dx2 +%dx3 +%dx4 +%dx5 +%dx6  ",A(1),A(2),A(3),A(4),A(5),A(6),A(7));

%TASK3 : RMSE
testFileName = 'test.csv';
testData = csvread(testFileName,1,0);
%loading Test Data
test_longitude = transpose(testData(:,1));
test_latitude = transpose(testData(:,2));
test_totalRooms = transpose(testData(:,3));
test_totalBedRooms = transpose(testData(:,4));
test_population = transpose(testData(:,5));
test_houseHolds = transpose(testData(:,6));
test_medianHouseHoldValue = transpose(testData(:,7)); 
testX=[test_longitude;test_latitude;test_totalRooms;test_totalBedRooms;test_population;test_houseHolds];
format long ;
medianHouseHoldValuePredicted=predictY(A,transpose(testX));
figure
plotTest=scatter(test_longitude,test_latitude,test_population*0.07,test_medianHouseHoldValue,'filled');%,test_mediaHouseHoldValue,'filled');
colormap('jet');
plotTest_ColorBar=colorbar;
plotTest_ColorBar.Label.String='Median HouseHold Value';
xlabel('longitude');
ylabel('latitude');
format long g;
testRMSE=RMSE(test_medianHouseHoldValue,medianHouseHoldValuePredicted)
trainRMSE=RMSE(medianHouseHoldValue,predictY(A,transpose(trainX)))

