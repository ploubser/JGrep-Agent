metadata :name => "JGrep Agent",
  :description => "Uses jgrep to inspect and match json and yaml files.",
  :author      => "P Loubser",
  :license     => "ASL2",
  :version     => "0.1",
  :url         => "https://jgrep.org",
  :timeout     => 60

action "match", :description => "Checks if a json or yaml file matches a given JGrep expression." do
  display :always

  input :file,
    :prompt      => "File name",
    :description => "Target File",
    :type        => :string,
    :optional    => false,
    :validation  => /.*/,
    :maxlength   => 90

  input :expression,
    :prompt       => "JGrep Expression",
    :description  => "The JGrep expression that the file contents will be matched on.",
    :type         => :string,
    :optional     => false,
    :validation   => /.*/,
    :maxlength    => 90


  output :match,
    :description => "Did the file match the expression?",
    :display_as  => "Match"
end

action "lookup", :description => "Find the value of a field in a yaml or json file" do
  display :always

   input :file,
    :prompt      => "File name",
    :description => "Target File",
    :type        => :string,
    :optional    => false,
    :validation  => /.*/,
    :maxlength   => 90

 input :field,
    :prompt      => "Field name",
    :description => "Targer Field to simplify.",
    :type        => :string,
    :optional    => false,
    :validation  => /.*/,
    :maxlength   => 90

 output :value,
   :description  => "JSON representation of the specified field",
   :display_as   => "Value"
end
