-- you can only delete non-system games
if (select IsSystem from ref.games where id = @id) = 0
begin
	delete from ref.games where id = @id
	select @@rowcount;
end
else
begin
	select -1;
end