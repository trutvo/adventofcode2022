open Re

let get_multiplication_summary src = 
  let re_mul = Perl.compile_pat "mul\\((\\d+)\\,(\\d+)\\)" in
  let data = Io.Resource.read_all src in
  Re.all re_mul data 
    |> List.map (fun g -> ((Re.Group.get g 1), (Re.Group.get g 2)))
    |> List.map (fun (a, b) -> ((int_of_string a), (int_of_string b)))
    |> List.map (fun (a, b) -> a * b)
    |> List.fold_left (+) 0
