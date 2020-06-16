function o = getbest(n, ds1, ds2)
bn = ds1(n).bestPFC;
db = squeeze(ds1(n).PFC_base_delay(:,bn,:));
dmph = squeeze(ds1(n).PFC_drug_delay(:,bn,:));
ndb = squeeze(ds2(n).PFC_base_delay(:,bn,:));
ndsal = squeeze(ds2(n).PFC_drug_delay(:,bn,:));

sz = vertcat(size(db), size(dmph), size(ndb), size(ndsal));
sz = min(sz(:,2));

o = vertcat(db(:,1:sz), dmph(:,1:sz), ndb(:,1:sz), ndsal(:,1:sz));
end
