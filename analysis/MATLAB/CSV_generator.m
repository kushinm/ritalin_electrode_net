load("../../data/LFP_Delay_PFC_STR.mat")
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
    acc = data(i).BaseCov(:,1);
    turn = data(i).BaseCov(:,2);
    basename ="../../data/"+"rat"+i+"base";
    writematrix(base,basename+".csv");
    drugname = "../../data/"+"rat"+i+"drug";
    writematrix(drug,drugname+".csv");
    accname = "../../data/"+"rat"+i+"acc";
    writematrix(acc,accname+".csv");
    turnname = "../../data/"+"rat"+i+"turn";
    writematrix(turn,turnname+".csv");
end
writematrix(num_elecs,"../../data/num_electrodes.csv");
