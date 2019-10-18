load("../../data/LFP_Delay_PFC_STR.mat");
data = DelayFP;
num_elecs = [];
for i=1:8
    dims = size(data(i).PFC_base_delay);
    base=[];
    drug=[];
    num_elecs = [num_elecs, dims(2)];
    for j=1:dims(2)
         base = cat(3,base, data(i).PFC_base_delay(:,j,:));
         drug = cat(3,drug, data(i).PFC_drug_delay(:,j,:));
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