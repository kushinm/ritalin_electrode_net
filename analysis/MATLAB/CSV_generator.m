%%%original csv generator for LFP_Delay_PFC_STR

load("../../data/LFP_Delay_PFC_STR.mat");
data = DelayFP;
num_elecs = [];
for i=1:8
    dims = size(data(i).PFC_base_delay);
    base=[];
    drug=[];
    num_elecs = [num_elecs, dims(2)];
    for j=1:dims(2)
         base = cat(2,base, data(i).PFC_base_delay(:,j,:));
         drug = cat(2,drug, data(i).PFC_drug_delay(:,j,:));
    end
    base_acc = data(i).BaseCov(:,1);
    base_turn = data(i).BaseCov(:,2);
    drug_acc = data(i).drugCov(:,1);
    drug_turn = data(i).drugCov(:,2);
    basename ="../../data/"+"rat"+i+"base";
    writematrix(base,basename+".csv");
    drugname = "../../data/"+"rat"+i+"drug";
    writematrix(drug,drugname+".csv");
    
    accname = "../../data/"+"rat"+i+"acc";
   
    writematrix(base_acc,accname+"base"+".csv");
    writematrix(drug_acc,accname+"drug"+".csv");
    
    turnname = "../../data/"+"rat"+i+"turn";
    
    
    writematrix(base_turn,turnname+"base"+".csv");
    writematrix(drug_turn,turnname+"drug"+".csv");
    
end
writematrix(num_elecs,"../../data/num_electrodes.csv");



%%% csv generator for new saline and mph files
load("../../data/LFP_DELAY_MACHINE_LEARNING.mat");
mph  = DelayFP_MPH_LOW;
saline = DelayFP_Saline;


num_elecs = [];
best = []

for i=1:size(mph,2)
    best = [best,mph(i).bestPFC;]
    dims = size(mph(i).PFC_base_delay);
    drug=[];
    base=[];
    num_elecs = [num_elecs, dims(2)];
    for j=1:dims(2)
         base = cat(3,base, mph(i).PFC_base_delay(:,j,:));
         drug = cat(3,drug, mph(i).PFC_drug_delay(:,j,:));
    end
    %base_acc = mph(i).BaseCov(:,1);
    %base_turn = mph(i).BaseCov(:,2);
    %drug_acc = mph(i).drugCov(:,1);
    %drug_turn = mph(i).drugCov(:,2);
    basename ="../../data/"+"rat"+i+"mph_base";
    writematrix(base,basename+".csv");
    drugname = "../../data/"+"rat"+i+"mph_drug";
    writematrix(drug,drugname+".csv");
    
    %accname = "../../data/"+"rat"+i+"mph_acc";
   
    %writematrix(base_acc,accname+"base"+".csv");
    %writematrix(drug_acc,accname+"drug"+".csv");
    
    %turnname = "../../data/"+"rat"+i+"mph_turn";
    
    
    %writematrix(base_turn,turnname+"base"+".csv");
    %writematrix(drug_turn,turnname+"drug"+".csv");
    
    
end
writematrix(best,"../../data/mph_best_elec.csv");

num_elecs = [];
best = []
for i=1:size(saline,2)
    best = [best,saline(i).bestPFC;] %% Best electrode for this rat
    dims = size(saline(i).PFC_base_delay);
    drug=[];
    base=[];
    num_elecs = [num_elecs, dims(2)];
    for j=1:dims(2)
         base = cat(3,base, saline(i).PFC_base_delay(:,j,:));
         drug = cat(3,drug, saline(i).PFC_drug_delay(:,j,:));
    end
    basename ="../../data/"+"rat"+i+"saline_base";
    writematrix(base,basename+".csv");
    drugname = "../../data/"+"rat"+i+"saline_drug";
    writematrix(drug,drugname+".csv");
    
end
writematrix(best,"../../data/saline_best_elec.csv");