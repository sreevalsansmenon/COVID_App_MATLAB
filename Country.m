classdef Country<handle
    properties
        Country_Name="";
        Daily_Totals
        Cummulative_Deaths
        Cummulative_Cases
        Daily_Deaths
        Daily_Cases
    end
    
    methods
        function obj = Country(name,covid_data)
            if nargin==0
                return
            end
            obj.Country_Name = name;
            obj.Daily_Totals =  cell2mat(covid_data(ismember(covid_data(2:end,1),name),3:end));
            obj.Cummulative_Cases = sum(obj.Daily_Totals(:,1:2:end),1);
            obj.Daily_Cases = [0 diff(obj.Cummulative_Cases)];
            obj.Cummulative_Deaths= sum(obj.Daily_Totals(:,2:2:end),1);
            obj.Daily_Deaths = [0 diff(obj.Cummulative_Deaths)];
        end
    end
   
        
 end