function o = getall(n, t, ds1, ds2)
%n: Which rat?
%t: How much time?
%ds1: data structure 1 (mph)
%ds2: data structure 2 (saline)

    db = squeeze(ds1(n).PFC_base_delay(:,1,1:t));
    dmph = squeeze(ds1(n).PFC_drug_delay(:,1,1:t));
    ndb = squeeze(ds2(n).PFC_base_delay(:,1,1:t));
    ndsal = squeeze(ds2(n).PFC_drug_delay(:,1,1:t));

for i = 2:8
    db = horzcat(db, squeeze(ds1(n).PFC_base_delay(:,i,1:t)));
    dmph = horzcat(dmph, squeeze(ds1(n).PFC_drug_delay(:,i,1:t)));
    ndb = horzcat(ndb, squeeze(ds2(n).PFC_base_delay(:,i,1:t)));
    ndsal = horzcat(ndsal, squeeze(ds2(n).PFC_drug_delay(:,i,1:t)));
end

o = vertcat(db, dmph, ndb, ndsal);
end
