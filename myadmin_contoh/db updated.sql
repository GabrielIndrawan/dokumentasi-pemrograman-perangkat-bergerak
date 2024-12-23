`djual``v_jual``v_jual`CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `test`.`v_jual` 
    AS
(SELECT d.no_jual AS no_nota,j.tgl_jual,j.kd_kons,k.nm_kons,d.kd_brg,b.nm_brg,d.harga_jual AS hrg_brg,d.jml_jual AS jml_brg, 
(d.harga_jual*d.jml_jual) AS totjual
FROM djual d,jual j,barang b,konsumen k
WHERE d.no_jual=j.no_jual AND d.kd_brg=b.kd_brg AND j.kd_kons=k.kd_kons);