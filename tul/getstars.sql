use stars;

-- get count
select count(*) from tulstars
  where Dist between 100 and 400
    and GLon between 120 and 150
    and GLat between -45 and 45
    and SpType is not null
;

-- get stars
select Tul, HIP, SpType, Name, Dist, X, Y, Z, Plx, GLon, GLat, RA, DE
  from tulstars
  where Dist between 100 and 400
    and GLon between 120 and 150
    and GLat between -45 and 45
    and SpType is not null
  into outfile '/tmp/stars.csv'
  fields terminated by ','
  lines terminated by '\n'
;

-- get stars around Mirfak, -150.66814,99.46585,-18.53716
select Tul, HIP, SpType, Name, Dist, X, Y, Z, Plx, GLon, GLat, RA, DE
  from tulstars
  where X between -170 and -120
    and Y between 80 and 120
    and Z between -38 and 5
--    and SpType is not null
  into outfile '/tmp/mstars.csv'
  fields terminated by ','
  lines terminated by '\n'
;

-- find named stars, but misses any that cdstars doesn't have hd for
select tulstars.tul, cdstars.name
  from tulstars left join cdstars
  on tulstars.hd = cdstars.hd
  where cdstars.name is not null;

-- different stars, still in Orion Spur
select Tul, HIP, SpType, Name, Dist, X, Y, Z, Plx, GLon, GLat, RA, DE
  from tulstars
  where Dist between 150 and 750
    and GLon between 150 and 180
    and GLat between -50 and 50
--    and SpType is not null
  into outfile '/tmp/dstars.csv'
  fields terminated by ','
  lines terminated by '\n'
;

-- find other named stars
select tulstars.tul, tulstars.hip, tulstars.sptype, cdstars.name, tulstars.dist, tulstars.x, tulstars.y, tulstars.z
  from tulstars left join cdstars
  on tulstars.hd = cdstars.hd
  where cdstars.name is not null
  into outfile '/tmp/nstars.csv'
  fields terminated by ','
  lines terminated by '\n'
;

-- find main sequence G stars
select Tul, HIP, SpType, Name, Dist, X, Y, Z
  from tulstars
  where SpType like 'G_V'
    and Dist between 150 and 750
    and GLon between 150 and 180
    and GLat between -50 and 50
  order by Dist
;

-- find main sequence F stars
select Tul, HIP, SpType, Name, Dist, X, Y, Z
  from tulstars
  where SpType like 'F_V'
    and Dist between 150 and 750
    and GLon between 150 and 180
    and GLat between -50 and 50
  order by Dist
;

-- misc searches
select Tul, HIP, SpType, Name, Dist, X, Y, Z
  from tulstars
  where X between -200 and -170
    and Y between 10 and 50
    and Z between 40 and 200
  order by Dist
  into outfile '/tmp/cstars.csv'
  fields terminated by ','
  lines terminated by '\n'
;
