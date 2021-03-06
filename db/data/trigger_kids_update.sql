#drop trigger kids_update;

use customer;
DELIMITER $$

CREATE TRIGGER kids_update AFTER update ON kids FOR EACH ROW
 BEGIN
 
	
	if new.userkey != old.userkey then
		update clients C 
			set C.client_id = Concat( new.userkey, right(client_id,4) ) , 
				C.client_pass = Concat( new.userkey, right(client_id,4) ) 
			where kids_id = old.id;
    end if;
    
	if new.fenics_key != old.fenics_key then
		update fenics F
			set F.fenics_id = Concat( new.fenics_key, right(fenics_id,5) ), 
				F.password = Concat( new.fenics_key, right(fenics_id,5) ) ,
                F.pc_name = Concat( upper(new.fenics_key), right(fenics_id,5) ) 
			where kids_id = old.id and is_mobile = 0;
    end if;
    
   if new.end_on is not null and old.end_on is null then
 		update clients C set C.end_on = new.end_on where kids_id = old.id and end_on is null;
   end if;

 END;
$$

DELIMITER ;kids_update
