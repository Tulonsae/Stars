use stars;

-- get count
select count(*) from tulstars
  where Dist between 100 and 400
    and GLon between 120 and 150
    and GLat between -45 and 45
    and SpType is not null
;

-- get stars
select Tul, HIP, SpType, Name, RA, DE, GLon, GLat, Plx, Dist, X, Y, Z
  from tulstars
  where Dist between 100 and 400
    and GLon between 120 and 150
    and GLat between -45 and 45
    and SpType is not null
  into outfile '/tmp/stars.csv'
  fields terminated by ','
  lines terminated by '\n'
;
