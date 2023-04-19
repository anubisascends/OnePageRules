if exists(select 1 from ref.Games where Label = @Label OR Short = @Short)
begin
	declare @id int

	select @id = id from ref.Games where Label = @Label or Short = @Short

	if (select IsSystem from ref.Games where Id = @id) = 1
	begin
		select -1, -1

		return;
	end

	update ref.Games
		set
			Label = @Label,
			Short = @Short
		where
			Id = @Id

	select 0, @id
end
else
begin
	insert into ref.Games
		(Label, Short)
	values
		(@Label, @Short)

	select 1, SCOPE_IDENTITY()
end